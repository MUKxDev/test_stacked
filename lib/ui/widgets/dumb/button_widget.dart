import 'package:flutter/material.dart';

// This is a dumb widget that don't have a viewModel
class ButtonWidget extends StatelessWidget {
  ButtonWidget({Key? key, required this.onPressed, required this.child})
      : super(key: key);
  final VoidCallback onPressed;
  final Widget child;

  // styles - lightTheme
  final ButtonStyle myButtonStyleLight = ElevatedButton.styleFrom(
    onPrimary: Colors.purple[50],
    primary: Colors.purple[300],
    shadowColor: Colors.purple[800],
    minimumSize: const Size(88, 36),
    elevation: 10,
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
  );
  // styles - darkTheme
  final ButtonStyle myButtonStyleDark = ElevatedButton.styleFrom(
    onPrimary: Colors.purple[900],
    primary: Colors.purple[400],
    shadowColor: Colors.purple[800],
    minimumSize: const Size(88, 36),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(20)),
    ),
    elevation: 10,
  );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: Theme.of(context).brightness == Brightness.light
          ? myButtonStyleLight
          : myButtonStyleDark,
      onPressed: onPressed,
      child: child,
    );
  }
}
