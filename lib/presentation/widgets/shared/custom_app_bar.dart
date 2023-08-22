import 'package:Counter_Screen_APP/presentation/providers/state_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
class CustomAppbar extends ConsumerWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar(this.title, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(darkModeProvider);
    return AppBar(
        title: Text(title),
        actions: [
          IconButton(
              onPressed: () {
                colorPickerDialog(context, ref);
              },
              icon: const Icon(Icons.brush_outlined)),
          IconButton(
              onPressed: () {
                ref.read(darkModeProvider.notifier).toggleDarkMode();
              },
              icon: isDarkMode
                  ? const Icon(Icons.dark_mode_outlined)
                  : const Icon(Icons.light_mode_outlined)),
          IconButton(
            icon: const Icon(Icons.refresh_rounded),
            onPressed: () {
              ref.read(counterProvider.notifier).equalToZero();
            },
          ),
        ],
      );
  }
  
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Future colorPickerDialog(BuildContext context, WidgetRef ref) {
  final colors = Theme.of(context).colorScheme;
  return showDialog(
    context: context,
    builder: (context) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
      content: SingleChildScrollView(
        child: BlockPicker(
          pickerColor: colors.primary,
          onColorChanged: (value) {
            ref.read(selectedColorProvider.notifier).changeSelectedColor(value);
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              padding: const EdgeInsets.only(
                  left: 30.0, top: 0.0, right: 30.0, bottom: 0.0)),
          onPressed: () {
            Navigator.of(context).pop(false);
          },
          child: Text('CLOSE', style: TextStyle(color: colors.primary)),
        ),
      ],
    ),
  );
}