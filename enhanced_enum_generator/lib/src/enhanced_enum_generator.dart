import 'dart:async';

import 'package:analyzer/dart/element/element2.dart';
import 'package:build/build.dart';
import 'package:enhanced_enum/enhanced_enum.dart';
import 'package:source_gen/source_gen.dart';

import 'enum_extension_generator.dart';

class EnhancedEnumGenerator extends GeneratorForAnnotation<EnhancedEnum> {
  const EnhancedEnumGenerator();

  @override
  FutureOr<String> generateForAnnotatedElement(
    Element2 element,
    ConstantReader annotation,
    BuildStep buildStep,
  ) {
    if (element.kind == ElementKind.ENUM && element is EnumElement2) {
      return EnumExtensionGenerator(element, annotation).generate();
    } else {
      throw InvalidGenerationSourceError(
        '''@EnhancedEnum() can only be applied on enum types. Instead, you are trying to use is it on a ${element.kind} ${element.name3}.''',
        element: element,
      );
    }
  }
}
