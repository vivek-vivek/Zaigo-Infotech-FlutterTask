import 'dart:io';

import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:glassmorphism/glassmorphism.dart';

import '../utils/authentication.dart';
import '../utils/custom_colors.dart';

class ExitPopUpDialog extends StatelessWidget {
  const ExitPopUpDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      width: 300,
      height: 200,
      borderRadius: 20,
      blur: 2,
      alignment: Alignment.center,
      border: 1,
      linearGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.1),
          const Color(0xFFFFFFFF).withOpacity(0.05),
        ],
        stops: const [0.1, 1],
      ),
      borderGradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [
          const Color(0xFFffffff).withOpacity(0.5),
          const Color((0xFFFFFFFF)).withOpacity(0.5),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Are you sure?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 16),
          // A row of buttons to show the options of the dialog
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // A button to log out
              OutlinedButton(
                onPressed: () {
                  Authentication().userLogout(context);
                },
                style: ElevatedButton.styleFrom(),
                child: const Text(
                  'Log out',
                  style: TextStyle(color: kRed),
                ),
              ),
              // A button to exit from the app
              OutlinedButton(
                onPressed: () {
                  exit(0);
                },
                child: const Text('Exit', style: TextStyle(color: kYellow)),
              ),
              // A button to cancel the dialog
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel', style: TextStyle(color: kGreen)),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
