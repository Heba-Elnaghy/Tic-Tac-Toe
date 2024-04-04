import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:socket_io/provider/room_data_provider.dart';
import 'package:socket_io/router.dart';
import 'package:socket_io/utils/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RoomDataProvider(),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: appRouter,
        theme: ThemeData.dark().copyWith(scaffoldBackgroundColor: bgColor),
      ),
    );
  }
}
