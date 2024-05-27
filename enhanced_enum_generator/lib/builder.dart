library enhanced_enum_generator;

import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import './src/enhanced_enum_generator.dart';

Builder enumBuilder(BuilderOptions options) {
  return SharedPartBuilder([const EnhancedEnumGenerator()], 'enum');
}
