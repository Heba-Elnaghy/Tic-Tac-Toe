import 'package:go_router/go_router.dart';
import 'package:socket_io/screens/create_room_screen.dart';
import 'package:socket_io/screens/game_screen.dart';
import 'package:socket_io/screens/join_room_screen.dart';
import 'package:socket_io/screens/main_menu_screen.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const MainMenuScreen(),
    ),
    GoRoute(
      path: '/JoinRoom',
      builder: (context, state) => const JoinRoomScreen(),
    ),
    GoRoute(
      path: '/CreateRoom',
      builder: (context, state) => const CreateRoomScreen(),
    ),
    GoRoute(
      path: '/GameScreen',
      builder: (context, state) => const GameScreen(),
    ),
  ],
);
