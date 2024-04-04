import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:socket_io/responsive/responsive.dart';
import 'package:socket_io/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  const MainMenuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Responsive(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomButton(
              onTap: () {
                GoRouter.of(context).push('/CreateRoom');
              },
              text: "Create Room",
            ),
            const SizedBox(height: 20),
            CustomButton(
              onTap: () {
                GoRouter.of(context).push('/JoinRoom');
              },
              text: "Join Room",
            ),
          ],
        ),
      ),
    );
  }
}
