import 'package:flutter/material.dart';
import 'package:socket_io/resources/socket_methods.dart';
import 'package:socket_io/responsive/responsive.dart';
import 'package:socket_io/widgets/custom_button.dart';
import 'package:socket_io/widgets/custom_text.dart';
import 'package:socket_io/widgets/custom_textfield.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({super.key});

  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreen();
}

class _JoinRoomScreen extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.joinRoomSuccessListener(context);
    _socketMethods.errorOccuredListener(context);
    _socketMethods.updatePlayersStateListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _gameIdController.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  ),
                ],
                text: 'Join Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextField(
                controller: _nameController,
                hintText: 'Enter your nickname',
              ),
              const SizedBox(height: 20),
              CustomTextField(
                controller: _gameIdController,
                hintText: 'Enter Game ID',
              ),
              SizedBox(height: size.height * 0.045),
              CustomButton(
                onTap: () {
                  _socketMethods.joinRoom(
                    _nameController.text,
                    _gameIdController.text,
                  );
                },
                text: 'Join',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
