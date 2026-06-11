import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '/clases/class_user_info.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String appTitle = "CruzAR";

  List<UserInfo> usuarios = [
    UserInfo(
      mail: "tino@gmail.com",
      password: "Helado",
      name: "Santino",
      surname: "Cordoni",
    ),
    UserInfo(
      mail: "noah@gmail.com",
      password: "Papada991",
      name: "Noah",
      surname: "Goldaracena",
    ),
    UserInfo(
      mail: "ivo@gmail.com",
      password: "Karting",
      name: "Iván",
      surname: "Musto",
    ),
    UserInfo(
      mail: "mate@gmail.com",
      password: "Messi",
      name: "Mateo",
      surname: "De Rosa",
    ),
    UserInfo(
      mail: "jero@gmail.com",
      password: "Copita",
      name: "Jerónimo",
      surname: "Bralo",
    ),
  ];

  bool obscurePassword = true;

  String informar = "Ingrese su usuario y contraseña";

  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Builder(
          builder: (context) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  appTitle,
                  style: TextStyle(fontSize: 50, color: Colors.blueGrey),
                ),
                SizedBox(height: 100),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: mailController,
                    decoration: InputDecoration(
                      labelText: "Mail",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(
                  width: 500,
                  child: TextField(
                    controller: passwordController,
                    obscureText: obscurePassword,
                    decoration: InputDecoration(
                      labelText: "Contraseña",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    final mail = mailController.text;
                    final password = passwordController.text;
                    if (mail.isEmpty || password.isEmpty) {
                      informar = "Llene ambos campos";
                    } else if (usuarios.any(
                      (usuario) => usuario.mail == mail,
                    )) {
                      UserInfo persona = usuarios.firstWhere(
                        (usuario) => usuario.mail == mail,
                      );
                      if (password == persona.password) {
                        context.push("/home");
                        informar = "Puede ingresar";
                      }
                    } else {
                      informar = "El usuario no existe";
                    }
                    passwordController.clear();
                    ScaffoldMessenger.of(
                      context,
                    ).showSnackBar(SnackBar(content: Text(informar)));
                    setState(() {});
                  },
                  child: Text("Ingresar"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
