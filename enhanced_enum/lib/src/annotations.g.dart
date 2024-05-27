// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'annotations.dart';

// **************************************************************************
// EnhancedEnumGenerator
// **************************************************************************

extension EnhancedEnumNamingConventionFromStringExtension
    on Iterable<EnhancedEnumNamingConvention> {
  EnhancedEnumNamingConvention? fromString(String val) {
    final override = {
      'original': EnhancedEnumNamingConvention.original,
      'camelCase': EnhancedEnumNamingConvention.camelCase,
      'upperCamelCase': EnhancedEnumNamingConvention.upperCamelCase,
      'snakeCase': EnhancedEnumNamingConvention.snakeCase,
      'screamingSnakeCase': EnhancedEnumNamingConvention.screamingSnakeCase,
    }[val];
// ignore: unnecessary_this
    return this.contains(override) ? override : null;
  }
}

extension EnhancedEnumNamingConventionEnhancedEnum
    on EnhancedEnumNamingConvention {
  @override
// ignore: override_on_non_overriding_member
  String get name => {
        EnhancedEnumNamingConvention.original: 'original',
        EnhancedEnumNamingConvention.camelCase: 'camelCase',
        EnhancedEnumNamingConvention.upperCamelCase: 'upperCamelCase',
        EnhancedEnumNamingConvention.snakeCase: 'snakeCase',
        EnhancedEnumNamingConvention.screamingSnakeCase: 'screamingSnakeCase',
      }[this]!;
  bool get isOriginal => this == EnhancedEnumNamingConvention.original;
  bool get isCamelCase => this == EnhancedEnumNamingConvention.camelCase;
  bool get isUpperCamelCase =>
      this == EnhancedEnumNamingConvention.upperCamelCase;
  bool get isSnakeCase => this == EnhancedEnumNamingConvention.snakeCase;
  bool get isScreamingSnakeCase =>
      this == EnhancedEnumNamingConvention.screamingSnakeCase;
  T when<T>({
    required T Function() original,
    required T Function() camelCase,
    required T Function() upperCamelCase,
    required T Function() snakeCase,
    required T Function() screamingSnakeCase,
  }) =>
      {
        EnhancedEnumNamingConvention.original: original,
        EnhancedEnumNamingConvention.camelCase: camelCase,
        EnhancedEnumNamingConvention.upperCamelCase: upperCamelCase,
        EnhancedEnumNamingConvention.snakeCase: snakeCase,
        EnhancedEnumNamingConvention.screamingSnakeCase: screamingSnakeCase,
      }[this]!();
  T maybeWhen<T>({
    T? Function()? original,
    T? Function()? camelCase,
    T? Function()? upperCamelCase,
    T? Function()? snakeCase,
    T? Function()? screamingSnakeCase,
    required T Function() orElse,
  }) =>
      {
        EnhancedEnumNamingConvention.original: original,
        EnhancedEnumNamingConvention.camelCase: camelCase,
        EnhancedEnumNamingConvention.upperCamelCase: upperCamelCase,
        EnhancedEnumNamingConvention.snakeCase: snakeCase,
        EnhancedEnumNamingConvention.screamingSnakeCase: screamingSnakeCase,
      }[this]
          ?.call() ??
      orElse();
}
