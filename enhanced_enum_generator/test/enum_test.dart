import 'package:enhanced_enum/enhanced_enum.dart';
import 'package:test/test.dart';

part 'enum_test.g.dart';

@EnhancedEnum(strict: false)
enum Animals { fox, rabbit, redPanda }

@EnhancedEnum(
    strict: false, namingConvention: EnhancedEnumNamingConvention.camelCase)
enum CamelCase { some_val, SomeVal }

@EnhancedEnum(
    strict: false,
    namingConvention: EnhancedEnumNamingConvention.upperCamelCase)
enum UpperCamelCase { some_val, someVal }

@EnhancedEnum(
    strict: false, namingConvention: EnhancedEnumNamingConvention.snakeCase)
enum SnakeCase { someVal, SOME_VAL }

@EnhancedEnum(
    strict: false,
    namingConvention: EnhancedEnumNamingConvention.screamingSnakeCase)
enum ScreamingSnakeCase { someVal, some_val }

@EnhancedEnum(
    strict: false,
    namingConvention: EnhancedEnumNamingConvention.screamingSnakeCase)
enum ComplexEnum {
  @EnhancedEnumValue(name: 'Very complex enum')
  someVal,
  someOtherVal,
}

@EnhancedEnum(namingConvention: EnhancedEnumNamingConvention.snakeCase)
enum StrictEnum {
  someVal,
  someOtherVal,
}

void main() {
  group('Enum test', () {
    test('basic functionality', () {
      expect(Animals.fox == Animals.fox, true);
      expect(Animals.rabbit == Animals.rabbit, true);
      expect(Animals.redPanda == Animals.redPanda, true);
      expect(Animals.fox == Animals.rabbit, false);
      expect(Animals.fox == Animals.redPanda, false);
      expect(Animals.rabbit == Animals.redPanda, false);
    });
    test('fromString', () {
      expect(Animals.values.fromString('fox'), Animals.fox);
      expect(Animals.values.fromString('Animals.fox'), Animals.fox);
      expect(Animals.values.fromString('red_panda'), Animals.redPanda);
      expect(Animals.values.fromString('redPanda'), Animals.redPanda);
      expect(Animals.values.fromString('RedPanda'), Animals.redPanda);
      expect(Animals.values.fromString('RED_PANDA'), Animals.redPanda);
      expect(ComplexEnum.values.fromString('Very complex enum'),
          ComplexEnum.someVal);
      expect(StrictEnum.values.fromString('some_val'), StrictEnum.someVal);
      expect(StrictEnum.values.fromString('someVal'), null);
    });
    test('name', () {
      expect(Animals.redPanda.name, 'redPanda');
      expect(CamelCase.some_val.name, 'someVal');
      expect(CamelCase.SomeVal.name, 'someVal');
      expect(UpperCamelCase.some_val.name, 'SomeVal');
      expect(UpperCamelCase.someVal.name, 'SomeVal');
      expect(SnakeCase.someVal.name, 'some_val');
      expect(SnakeCase.SOME_VAL.name, 'some_val');
      expect(ScreamingSnakeCase.someVal.name, 'SOME_VAL');
      expect(ScreamingSnakeCase.some_val.name, 'SOME_VAL');
      expect(ComplexEnum.someVal.name, 'Very complex enum');
      expect(ComplexEnum.someOtherVal.name, 'SOME_OTHER_VAL');
    });
    test('when', () {
      expect(
          Animals.fox.when(
            fox: () => 42,
            rabbit: () => 1,
            redPanda: () => 2,
          ),
          42);
    });
    test('maybeWhen', () {
      expect(Animals.fox.maybeWhen(fox: () => 42, orElse: () => 9001), 42);
      expect(Animals.fox.maybeWhen(rabbit: () => 42, orElse: () => 9001), 9001);
      expect(Animals.fox.maybeWhen(fox: () => null, orElse: () => 9001), 9001);
    });
    test('isXyz', () {
      expect(Animals.fox.isFox, true);
      expect(Animals.fox.isRabbit, false);
      expect(Animals.fox.isRedPanda, false);
      expect(Animals.rabbit.isFox, false);
      expect(Animals.rabbit.isRabbit, true);
      expect(Animals.rabbit.isRedPanda, false);
      expect(Animals.redPanda.isFox, false);
      expect(Animals.redPanda.isRabbit, false);
      expect(Animals.redPanda.isRedPanda, true);
    });
    test('switch', () {
      String execSwitch(Animals animal) {
        switch (animal) {
          case Animals.fox:
            return 'fox';
          case Animals.rabbit:
            return 'rabbit';
          case Animals.redPanda:
            return 'red panda';
        }
      }

      expect(execSwitch(Animals.fox), 'fox');
      expect(execSwitch(Animals.rabbit), 'rabbit');
      expect(execSwitch(Animals.redPanda), 'red panda');
    });
  });
}
