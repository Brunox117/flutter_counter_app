import 'package:Counter_Screen_APP/presentation/providers/state_providers.dart';
import 'package:Counter_Screen_APP/presentation/widgets/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterFunctionsScreen extends ConsumerWidget{
  const CounterFunctionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider);
    return Scaffold(
      appBar: const CustomAppbar('Counter screen'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "$counter",
              style:
                  const TextStyle(fontSize: 160, fontWeight: FontWeight.w100),
            ),
            Text('Click${counter == 1 ? '' : 's'}',
                style: const TextStyle(fontSize: 25))
          ],
        ),
      ),
      floatingActionButton:
          Column(mainAxisAlignment: MainAxisAlignment.end, children: [
        CustomButton(
          icon: Icons.plus_one_outlined,
          onPressed: () {
            ref.read(counterProvider.notifier).increaseByOne();
          },
        ),
        const SizedBox(height: 20),
        CustomButton(
          icon: Icons.exposure_minus_1_outlined,
          onPressed: () {
            if (counter == 0) return;
            ref.read(counterProvider.notifier).decreaseByOne();
          },
        ),
        const SizedBox(height: 20),
        CustomButton(
          icon: Icons.refresh_outlined,
          onPressed: () {
            ref.read(counterProvider.notifier).equalToZero();
          },
        ),
        const SizedBox(height: 20),
      ]),
    );
  }

}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      enableFeedback: true,
      onPressed: onPressed,
      child: Icon(icon),
    );
  }
}

