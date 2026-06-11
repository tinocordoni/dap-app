import 'package:go_router/go_router.dart';
import 'package:login_interfaz/screens/home.dart';
import 'package:login_interfaz/screens/login.dart';
import 'package:login_interfaz/screens/show.dart';
import 'package:login_interfaz/clases/class_user_info.dart';

final appRouter = GoRouter(
  initialLocation: "/login",
  
  routes: [
   
  
  GoRoute(path: "/login", builder: (context, state) => const LoginScreen()),
  GoRoute(path: "/home", builder: (context, state) => HomeScreen(usuario: state.extra as UserInfo)),
  GoRoute(path: "/show", builder: (context, state) => ShowScreen())
]
 
);
