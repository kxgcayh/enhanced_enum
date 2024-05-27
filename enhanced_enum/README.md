# Enhanced Enum

Enhanced Enum is a generator for enum extensions and generators from strings.

## Installation & Building

1. Add the `enhanced_enum` package to your project and the `enhanced_enum_generator` package as dev dependency: `pub add enhanced_enum && pub add enhanced_enum_generator --dev`
2. Include the `enhanced_enum` package to the files where you want to use it: `import 'package:enhanced_enum/enhanced_enum.dart'`
3. Add the file that will be generated as part file: `part 'YOURFILE.g.dart';`, e.g. `part 'main.g.dart';`
4. Add the enhanced enum decorator to your enums, either `@enhancedEnum` or `@EnhancedEnum()` for more options
5. Build the enhanced enums with `pub run build_runner build`

## Usage

```dart
import 'package:enhanced_enum/enhanced_enum.dart';

part 'main.g.dart';

@EnhancedEnum(strict: false, namingConvention: EnhancedEnumNamingConvention.snakeCase)
enum Animals { fox, rabbit, redPanda }

@EnhancedEnum()
enum AnimalParts {
  @EnhancedEnumValue(name: 'cutsie paw')
  paw,
  @EnhancedEnumValue(name: 'curly tail')
  tail,
  @EnhancedEnumValue(name: 'boopable snoot')
  snoot,
}

@EnhancedEnum(namingConvention: EnhancedEnumNamingConvention.snakeCase)
enum AnimalColours {
  redYellow, greenBlack,
}

@EnhancedEnum(prefixes: ['water-', 'fire_'])
enum AnimalTypes {
  @EnhancedEnumValue(name: 'bird')
  bird
}

Animals.values.fromString('fox'); // returns Animals.fox
Animals.values.fromString('red_panda'); // returns Animals.redPanda
Animals.values.fromString('redPanda'); // returns Animals.redPanda
Animals.values.fromString('Animals.rabbit'); // returns Animals.rabbit
AnimalParts.values.fromString('boopable snoot'); // returns AnimalParts.snoot, because of the enhanced enum value override
AnimalColours.values.fromString('red_yellow'); // returns AnimalColours.redYellow
AnimalColours.values.fromString('redYellow'); // returns null, because the enum is set to strict (default)
AnimalTypes.values.fromString('water-bird'); // returns AnimalTypes.bird
AnimalTypes.values.fromString('fire_bird');  // returns AnimalTypes.bird

Animals.redPanda.name; // returns 'red_panda', depending on which namingConvention you set
AnimalParts.paw.name; // returns 'cutsie paw', because of the enhanced enum value override

Animals.fox.isFox; // returns true
Animals.fox.isRedPadna; // returns false

Animals.fox.when(
  fox: () => 1,
  rabbit: () => 2,
  redPanda: () => 3,
); // returns 1

Animals.fox.maybeWhen(
  rabbit: () => 2,
  orElse: () => 9001,
); // returns 9001

Animals.rabbit.maybeWhen(
  rabbit: () => 2,
  orElse: () => 9001,
); // returns 2
```

### Naming of enum values
If you have an enum called `MyEnum`, then `MyEnum.values.fromString()` will try to generate the corresponding
enum from a string, based on the name of the value. Similarly, `MyEnum.someVal.name` will return
the name of the enum as a string.

Now, not always the name of an enum in code is the name of the string representation you want the
enum value to have. For example, if in your code you use `camelCase`, however your enum is representing
values in json by `snake_case`. For that, the `EnhancedEnum()` constructor takes a `namingConvention`
parameter, which will try to then name the enums based on a naming conventions. The ones available are:

 - `EnhancedEnumNamingConvention.original`: unchanged enum value name from the source code
 - `EnhancedEnumNamingConvention.camelCase`: camelCase enum value naming convention
 - `EnhancedEnumNamingConvention.upperCamelCase`: UpperCamelCase enum value naming convention (same as camelCase, only the first character is uppercase)
 - `EnhancedEnumNamingConvention.snakeCase`: snake_case enum value naming convention
 - `EnhancedEnumNamingConvention.screamingSnakeCase`: SCREAMING_SNAKE_CASE enum value naming convention (same as snake_case, only all characters are uppercase)

Sometimes your enum value names are too complicated to map well to these naming conventions, though.
For that reason you can annotate specific values with the `EnhancedEnumValue()` annotation and give
them a name override for that specific value. For example, an enum to take use of this could be defined as
following:

```dart
@EnhancedEnum()
enum AnimalParts {
  @EnhancedEnumValue(name: 'cutsie paw')
  paw,
  @EnhancedEnumValue(name: 'curly tail')
  tail,
  @EnhancedEnumValue(name: 'boopable snoot')
  snoot,
}
```

### Strict enums
If the enum is set to strict (`strict: true`), then, when converting from a string to
the enum value, the exact enum name string representation *must* be used.
