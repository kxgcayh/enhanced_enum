import 'package:analyzer/dart/element/element.dart';
import 'package:enhanced_enum/enhanced_enum.dart';
import 'package:source_gen/source_gen.dart';

class EnumExtensionGenerator {
  final EnumElement element;
  final ConstantReader annotation;
  final EnhancedEnum config;
  final buff = StringBuffer();

  static String camelToUnder(String s, {bool lower = true}) {
    final ret = s.replaceAllMapped(
        RegExp(r'([a-z])([A-Z])'), (m) => '${m.group(1)!}_${m.group(2)!}');
    return lower ? ret.toLowerCase() : ret.toUpperCase();
  }

  static String underToCamel(String s, {bool lower = true}) {
    final ret = s.toLowerCase().replaceAllMapped(
        RegExp(r'(\w)_(\w)'), (m) => m.group(1)! + m.group(2)!.toUpperCase());
    return lower ? ret : castFirstUpper(ret);
  }

  static String castFirstUpper(String s) => s[0].toUpperCase() + s.substring(1);

  static String castFirstLower(String s) => s[0].toLowerCase() + s.substring(1);

  String get name => element.displayName;
  Iterable<FieldElement> get values => element.fields
      .where((f) => f.type.getDisplayString(withNullability: true) == name);
  Iterable<EnhancedEnumValue?> get valueConfigs => values
      .map((v) => v.metadata.cast<ElementAnnotation?>().firstWhere(
          (m) => m?.element?.displayName == 'EnhancedEnumValue',
          orElse: () => null))
      .map((v) => v == null
          ? null
          : EnhancedEnumValue(
              name: v.computeConstantValue()?.getField('name')?.toStringValue(),
            ));
  Map<String, EnhancedEnumValue?> get valueConfigsMap =>
      Map.fromIterables(valueNames, valueConfigs);
  Iterable<String> get valueNames => values.map((v) => v.displayName);

  String getStringValue(String n) {
    final strVal = valueConfigsMap[n]?.name;
    if (strVal != null) {
      return strVal;
    }
    switch (config.namingConvention) {
      case EnhancedEnumNamingConvention.original:
        return n;
      case EnhancedEnumNamingConvention.camelCase:
        return n.contains('_') ? underToCamel(n) : castFirstLower(n);
      case EnhancedEnumNamingConvention.upperCamelCase:
        return n.contains('_')
            ? underToCamel(n, lower: false)
            : castFirstUpper(n);
      case EnhancedEnumNamingConvention.snakeCase:
        return camelToUnder(n);
      case EnhancedEnumNamingConvention.screamingSnakeCase:
        return camelToUnder(n, lower: false);
    }
  }

  EnumExtensionGenerator(this.element, this.annotation)
      : assert(element.kind == ElementKind.ENUM),
        config = EnhancedEnum(
          namingConvention: EnhancedEnumNamingConvention.values[annotation
                  .objectValue
                  .getField('namingConvention')
                  ?.getField('index')
                  ?.toIntValue() ??
              0],
          strict: annotation.objectValue.getField('strict')?.toBoolValue() ??
              EnhancedEnum().strict,
          prefixes: annotation.objectValue.getField('prefixes')?.toListValue(),
        );

  String generate() {
    generateFromString();
    buff.writeln('extension ${name}EnhancedEnum on $name {');
    generateName();
    generateIsMethods();
    generateWhen();
    generateMaybeWhen();
    buff.writeln('}');
    return buff.toString();
  }

  void generateFromString() {
    buff.writeln('extension ${name}FromStringExtension on Iterable<$name> {');
    buff.writeln('$name? fromString(String val) {');
    if (config.strict || valueConfigs.any((c) => c?.name != null)) {
      // we have name overrides, handle them first
      buff.writeln('  final override = {');
      for (final entry in valueConfigsMap.entries) {
        if (config.prefixes != null) {
          for (final prefix in config.prefixes!) {
            if (entry.value?.name != null) {
              buff.writeln(
                  '    \'${prefix.toStringValue()}${entry.value!.name}\': $name.${entry.key},');
            } else if (config.strict) {
              buff.writeln(
                  '    \'${prefix.toStringValue()}${getStringValue(entry.key)}\': $name.${entry.key},');
            }
          }
        } else {
          if (entry.value?.name != null) {
            buff.writeln('    \'${entry.value!.name}\': $name.${entry.key},');
          } else if (config.strict) {
            buff.writeln(
                '    \'${getStringValue(entry.key)}\': $name.${entry.key},');
          }
        }
      }
      buff.writeln('  }[val];');
      // we need to access `contains` with `this.contains`, else somehow the package
      // matcher is used in some cases. Then, in other cases, the analyzer complains about
      // unneededlyusing `this`. So, we just ignore the linter here.
      buff.writeln('// ignore: unnecessary_this');
      if (config.strict) {
        buff.writeln('return this.contains(override) ? override : null;}}');
        return;
      }
      buff.writeln('  if (this.contains(override)) {');
      buff.writeln('    return override;');
      buff.writeln('  }');
    }
    buff.writeln(
        '  final cmpval = val.replaceAll(\'$name.\', \'\').replaceAll(\'_\', \'\').toLowerCase();');
    buff.writeln('  return cast<$name?>().firstWhere((v) =>');
    buff.writeln(
        '    v.toString().replaceAll(\'$name.\', \'\').replaceAll(\'_\', \'\').toLowerCase() == cmpval');
    buff.writeln('  , orElse: () => null);');
    buff.writeln('}');
    buff.writeln('}');
  }

  void generateName() {
    buff.writeln('@override');
    buff.writeln('// ignore: override_on_non_overriding_member');
    buff.writeln('String get name => {');
    for (final n in valueNames) {
      buff.writeln('  $name.$n: \'${getStringValue(n)}\',');
    }
    buff.writeln('}[this]!;');
  }

  void generateIsMethods() {
    for (final n in valueNames) {
      buff.writeln(
          'bool get is${n[0].toUpperCase()}${n.substring(1)} => this == $name.$n;');
    }
  }

  void generateWhen() {
    buff.writeln('T when<T>({');
    for (final n in valueNames) {
      buff.writeln('  required T Function() $n,');
    }
    buff.writeln('}) => {');
    for (final n in valueNames) {
      buff.writeln('    $name.$n: $n,');
    }
    buff.writeln('  }[this]!();');
  }

  void generateMaybeWhen() {
    buff.writeln('T maybeWhen<T>({');
    for (final n in valueNames) {
      buff.writeln('  T? Function()? $n,');
    }
    buff.writeln('  required T Function() orElse,');
    buff.writeln('}) => {');
    for (final n in valueNames) {
      buff.writeln('    $name.$n: $n,');
    }
    buff.writeln('  }[this]?.call() ?? orElse();');
  }
}
