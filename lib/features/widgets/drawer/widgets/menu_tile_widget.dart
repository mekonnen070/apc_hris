// import 'package:flutter/material.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:police_com/providers/drawer_selection_provider.dart';

// class MenuTileWidget extends ConsumerWidget {
//   const MenuTileWidget({
//     super.key,
//     required this.title,
//     required this.icon,
//     this.children = const [],
//   });

//   final String title;
//   final IconData icon;
//   final List<Widget> children;

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     final selectedSubModule = ref.watch(selectedSubModuleProvider);

//     return ExpansionTile(
//               key: PageStorageKey<String>(main.toString()),
//               leading: Icon(_mainModuleIcon(main)),
//               title: Text(_mainModuleTitle(main)),
//               children: SubModule.values
//                   .where((sub) => sub.mainModule == main)
//                   .map((sub) => ListTile(
//                         title: Text(sub.title),
//                         onTap: () {
//                           ref.read(selectedSubModuleProvider.notifier).state = sub;
//                           Navigator.of(context).pop();
//                         },
//                       ))
//                   .toList(),
//             ),
//   }
// }
