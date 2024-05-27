// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'enum_test.dart';

// **************************************************************************
// EnhancedEnumGenerator
// **************************************************************************

extension AnimalsFromStringExtension on Iterable<Animals> {
  Animals? fromString(String val) {
    final cmpval =
        val.replaceAll('Animals.', '').replaceAll('_', '').toLowerCase();
    return cast<Animals?>().firstWhere(
        (v) =>
            v
                .toString()
                .replaceAll('Animals.', '')
                .replaceAll('_', '')
                .toLowerCase() ==
            cmpval,
        orElse: () => null);
  }
}

extension AnimalsEnhancedEnum on Animals {
  @override
// ignore: override_on_non_overriding_member
  String get name => {
        Animals.fox: 'fox',
        Animals.rabbit: 'rabbit',
        Animals.redPanda: 'redPanda',
      }[this]!;
  bool get isFox => this == Animals.fox;
  bool get isRabbit => this == Animals.rabbit;
  bool get isRedPanda => this == Animals.redPanda;
  T when<T>({
    required T Function() fox,
    required T Function() rabbit,
    required T Function() redPanda,
  }) =>
      {
        Animals.fox: fox,
        Animals.rabbit: rabbit,
        Animals.redPanda: redPanda,
      }[this]!();
  T maybeWhen<T>({
    T? Function()? fox,
    T? Function()? rabbit,
    T? Function()? redPanda,
    required T Function() orElse,
  }) =>
      {
        Animals.fox: fox,
        Animals.rabbit: rabbit,
        Animals.redPanda: redPanda,
      }[this]
          ?.call() ??
      orElse();
}

extension CamelCaseFromStringExtension on Iterable<CamelCase> {
  CamelCase? fromString(String val) {
    final cmpval =
        val.replaceAll('CamelCase.', '').replaceAll('_', '').toLowerCase();
    return cast<CamelCase?>().firstWhere(
        (v) =>
            v
                .toString()
                .replaceAll('CamelCase.', '')
                .replaceAll('_', '')
                .toLowerCase() ==
            cmpval,
        orElse: () => null);
  }
}

extension CamelCaseEnhancedEnum on CamelCase {
  @override
// ignore: override_on_non_overriding_member
  String get name => {
        CamelCase.some_val: 'someVal',
        CamelCase.SomeVal: 'someVal',
      }[this]!;
  bool get isSome_val => this == CamelCase.some_val;
  bool get isSomeVal => this == CamelCase.SomeVal;
  T when<T>({
    required T Function() some_val,
    required T Function() SomeVal,
  }) =>
      {
        CamelCase.some_val: some_val,
        CamelCase.SomeVal: SomeVal,
      }[this]!();
  T maybeWhen<T>({
    T? Function()? some_val,
    T? Function()? SomeVal,
    required T Function() orElse,
  }) =>
      {
        CamelCase.some_val: some_val,
        CamelCase.SomeVal: SomeVal,
      }[this]
          ?.call() ??
      orElse();
}

extension UpperCamelCaseFromStringExtension on Iterable<UpperCamelCase> {
  UpperCamelCase? fromString(String val) {
    final cmpval =
        val.replaceAll('UpperCamelCase.', '').replaceAll('_', '').toLowerCase();
    return cast<UpperCamelCase?>().firstWhere(
        (v) =>
            v
                .toString()
                .replaceAll('UpperCamelCase.', '')
                .replaceAll('_', '')
                .toLowerCase() ==
            cmpval,
        orElse: () => null);
  }
}

extension UpperCamelCaseEnhancedEnum on UpperCamelCase {
  @override
// ignore: override_on_non_overriding_member
  String get name => {
        UpperCamelCase.some_val: 'SomeVal',
        UpperCamelCase.someVal: 'SomeVal',
      }[this]!;
  bool get isSome_val => this == UpperCamelCase.some_val;
  bool get isSomeVal => this == UpperCamelCase.someVal;
  T when<T>({
    required T Function() some_val,
    required T Function() someVal,
  }) =>
      {
        UpperCamelCase.some_val: some_val,
        UpperCamelCase.someVal: someVal,
      }[this]!();
  T maybeWhen<T>({
    T? Function()? some_val,
    T? Function()? someVal,
    required T Function() orElse,
  }) =>
      {
        UpperCamelCase.some_val: some_val,
        UpperCamelCase.someVal: someVal,
      }[this]
          ?.call() ??
      orElse();
}

extension SnakeCaseFromStringExtension on Iterable<SnakeCase> {
  SnakeCase? fromString(String val) {
    final cmpval =
        val.replaceAll('SnakeCase.', '').replaceAll('_', '').toLowerCase();
    return cast<SnakeCase?>().firstWhere(
        (v) =>
            v
                .toString()
                .replaceAll('SnakeCase.', '')
                .replaceAll('_', '')
                .toLowerCase() ==
            cmpval,
        orElse: () => null);
  }
}

extension SnakeCaseEnhancedEnum on SnakeCase {
  @override
// ignore: override_on_non_overriding_member
  String get name => {
        SnakeCase.someVal: 'some_val',
        SnakeCase.SOME_VAL: 'some_val',
      }[this]!;
  bool get isSomeVal => this == SnakeCase.someVal;
  bool get isSOME_VAL => this == SnakeCase.SOME_VAL;
  T when<T>({
    required T Function() someVal,
    required T Function() SOME_VAL,
  }) =>
      {
        SnakeCase.someVal: someVal,
        SnakeCase.SOME_VAL: SOME_VAL,
      }[this]!();
  T maybeWhen<T>({
    T? Function()? someVal,
    T? Function()? SOME_VAL,
    required T Function() orElse,
  }) =>
      {
        SnakeCase.someVal: someVal,
        SnakeCase.SOME_VAL: SOME_VAL,
      }[this]
          ?.call() ??
      orElse();
}

extension ScreamingSnakeCaseFromStringExtension
    on Iterable<ScreamingSnakeCase> {
  ScreamingSnakeCase? fromString(String val) {
    final cmpval = val
        .replaceAll('ScreamingSnakeCase.', '')
        .replaceAll('_', '')
        .toLowerCase();
    return cast<ScreamingSnakeCase?>().firstWhere(
        (v) =>
            v
                .toString()
                .replaceAll('ScreamingSnakeCase.', '')
                .replaceAll('_', '')
                .toLowerCase() ==
            cmpval,
        orElse: () => null);
  }
}

extension ScreamingSnakeCaseEnhancedEnum on ScreamingSnakeCase {
  @override
// ignore: override_on_non_overriding_member
  String get name => {
        ScreamingSnakeCase.someVal: 'SOME_VAL',
        ScreamingSnakeCase.some_val: 'SOME_VAL',
      }[this]!;
  bool get isSomeVal => this == ScreamingSnakeCase.someVal;
  bool get isSome_val => this == ScreamingSnakeCase.some_val;
  T when<T>({
    required T Function() someVal,
    required T Function() some_val,
  }) =>
      {
        ScreamingSnakeCase.someVal: someVal,
        ScreamingSnakeCase.some_val: some_val,
      }[this]!();
  T maybeWhen<T>({
    T? Function()? someVal,
    T? Function()? some_val,
    required T Function() orElse,
  }) =>
      {
        ScreamingSnakeCase.someVal: someVal,
        ScreamingSnakeCase.some_val: some_val,
      }[this]
          ?.call() ??
      orElse();
}

extension ComplexEnumFromStringExtension on Iterable<ComplexEnum> {
  ComplexEnum? fromString(String val) {
    final override = {
      'Very complex enum': ComplexEnum.someVal,
    }[val];
// ignore: unnecessary_this
    if (this.contains(override)) {
      return override;
    }
    final cmpval =
        val.replaceAll('ComplexEnum.', '').replaceAll('_', '').toLowerCase();
    return cast<ComplexEnum?>().firstWhere(
        (v) =>
            v
                .toString()
                .replaceAll('ComplexEnum.', '')
                .replaceAll('_', '')
                .toLowerCase() ==
            cmpval,
        orElse: () => null);
  }
}

extension ComplexEnumEnhancedEnum on ComplexEnum {
  @override
// ignore: override_on_non_overriding_member
  String get name => {
        ComplexEnum.someVal: 'Very complex enum',
        ComplexEnum.someOtherVal: 'SOME_OTHER_VAL',
      }[this]!;
  bool get isSomeVal => this == ComplexEnum.someVal;
  bool get isSomeOtherVal => this == ComplexEnum.someOtherVal;
  T when<T>({
    required T Function() someVal,
    required T Function() someOtherVal,
  }) =>
      {
        ComplexEnum.someVal: someVal,
        ComplexEnum.someOtherVal: someOtherVal,
      }[this]!();
  T maybeWhen<T>({
    T? Function()? someVal,
    T? Function()? someOtherVal,
    required T Function() orElse,
  }) =>
      {
        ComplexEnum.someVal: someVal,
        ComplexEnum.someOtherVal: someOtherVal,
      }[this]
          ?.call() ??
      orElse();
}

extension StrictEnumFromStringExtension on Iterable<StrictEnum> {
  StrictEnum? fromString(String val) {
    final override = {
      'some_val': StrictEnum.someVal,
      'some_other_val': StrictEnum.someOtherVal,
    }[val];
// ignore: unnecessary_this
    return this.contains(override) ? override : null;
  }
}

extension StrictEnumEnhancedEnum on StrictEnum {
  @override
// ignore: override_on_non_overriding_member
  String get name => {
        StrictEnum.someVal: 'some_val',
        StrictEnum.someOtherVal: 'some_other_val',
      }[this]!;
  bool get isSomeVal => this == StrictEnum.someVal;
  bool get isSomeOtherVal => this == StrictEnum.someOtherVal;
  T when<T>({
    required T Function() someVal,
    required T Function() someOtherVal,
  }) =>
      {
        StrictEnum.someVal: someVal,
        StrictEnum.someOtherVal: someOtherVal,
      }[this]!();
  T maybeWhen<T>({
    T? Function()? someVal,
    T? Function()? someOtherVal,
    required T Function() orElse,
  }) =>
      {
        StrictEnum.someVal: someVal,
        StrictEnum.someOtherVal: someOtherVal,
      }[this]
          ?.call() ??
      orElse();
}
