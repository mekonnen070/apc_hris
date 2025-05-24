import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:police_com/core/enums/sub_module_enum.dart';

final selectedSubModuleProvider = StateProvider<SubModule>(
  (ref) => SubModule.dashboard,
);
