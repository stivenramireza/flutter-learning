import "package:flutter/material.dart";
import "package:go_router/go_router.dart";

class SnackbarScreen extends StatelessWidget {
  static const String name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();

    final snackbar = SnackBar(
      content: const Text('Hello world!'),
      action: SnackBarAction(
        label: 'OK!', 
        onPressed: () {},
      ),
      duration: const Duration(seconds: 2),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  void openDialog(BuildContext context) {
    showDialog(
      context: context, 
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: const Text('Are you sure?'),
        content: const Text('Elit deserunt aliquip duis proident incididunt id dolore et nostrud ut. Sint voluptate nisi id ut consectetur dolor nisi proident ullamco mollit incididunt exercitation do incididunt. Aliqua nulla exercitation aliqua proident consequat. Anim eiusmod ex commodo nulla labore qui ipsum laboris. Nisi ad reprehenderit minim nostrud elit nulla Lorem aliqua aute consectetur tempor. Deserunt dolore excepteur reprehenderit sint anim veniam dolore in velit quis esse laboris minim labore. Exercitation pariatur duis quis deserunt cillum qui aute irure eu esse quis ea.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancel')),
          FilledButton(onPressed: () => context.pop(), child: const Text('Accept'))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Snackbars and dialogs'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: () => showAboutDialog(
                context: context, 
                children: [
                  const Text('Velit magna laboris magna deserunt ullamco. Lorem pariatur occaecat veniam excepteur qui anim dolor voluptate sint aliquip laborum irure. Sit sit nostrud irure esse incididunt consequat. Est pariatur non nulla est dolor veniam et nisi dolor mollit deserunt irure commodo reprehenderit.')
                ]
              ), 
              child: const Text('Used licenses')
            ),
            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Show dialog')
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Show snackbar'),
        icon: const Icon(Icons.remove_red_eye_outlined),
        onPressed: () => showCustomSnackbar(context), 
      ),
    );
  }
}
