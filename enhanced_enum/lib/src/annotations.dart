part 'annotations.g.dart';

/// Possible naming convention for enhanced enums
@EnhancedEnum()
enum EnhancedEnumNamingConvention {
  /// Preserve enum values how they are originally written in code
  original,

  /// Convert enum values to camelCase
  camelCase,

  /// Convert enum values to UpperCamelCase
  upperCamelCase,

  /// Convert enum values to snake_case
  snakeCase,

  /// Convert enum values to SCREAMING_SNAKE_CASE
  screamingSnakeCase,
}

/// Annotation class to flag enums to be converted to enhanced enums.
/// Usage:
/// ```dart
/// @EnhancedEnum(/* parameters */)
/// enum Animals { fox, cat, bunny }
/// ```
class EnhancedEnum {
  /// Set the naming convention used for enum values `.name`
  final EnhancedEnumNamingConvention namingConvention;

  /// Set whether the enum is supposed to be strict, in which case, when converting from a string to
  /// the enum value, the exact enum name string representation *must* be used.

  final bool strict;

  /// assign any prefixes to be concatenated before `.name`

  final List? prefixes;

  /// Create the enhanced enum annotation, specify which [namingConvention] to use and
  /// whether the enum is [strict]

  const EnhancedEnum({
    this.namingConvention = EnhancedEnumNamingConvention.original,
    this.strict = true,
    this.prefixes,
  });
}

/// Annotation class to set additional enhanced enum properties to specific
/// values of enums.
/// Usage:
/// ```dart
/// @EnhancedEnum()
/// enum AnimalParts {
///   @EnhancedEnumValue(name: 'cutsie paw')
///   paw,
///   @EnhancedEnumValue(name: 'curly tail')
///   tail,
///   @EnhancedEnumValue(name: 'boopable snoot')
///   snoot,
/// }
/// ```
class EnhancedEnumValue {
  /// The name for this enum value
  final String? name;

  /// Create an enhanced enum value annotation, optionally specify which [name] this
  /// enum value should have.
  const EnhancedEnumValue({this.name});
}
