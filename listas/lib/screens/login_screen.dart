// ignore_for_file: must_be_immutable
import 'package:listas/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:listas/classes/users.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _LoginView(),
    );
  }
}

class _LoginView extends StatefulWidget {
  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  final TextEditingController userController = TextEditingController();
  final TextEditingController passController = TextEditingController();
  bool _obscureText = true;

  final List<Users> usuarios = [
    Users('cambi', 'skibidi'),
    Users('echi', 'toilet'),
    Users('lilo', 'elpepe'),
  ];

  final snackBarUserIncorrect = SnackBar(
    content: const Text("Usuario incorrecto"),
    action: SnackBarAction(
      label: 'Descartar',
      onPressed: () {},
    ),
  );

  final snackBarPassIncorrect = SnackBar(
    content: const Text("Contraseña incorrecta"),
    action: SnackBarAction(
      label: 'Descartar',
      onPressed: () {},
    ),
  );

  void _login(BuildContext context) {
    String userInput = userController.text;
    String passInput = passController.text;

    int userIndex = usuarios.indexWhere((usuario) => usuario.user == userInput);

    if (userIndex == -1) {
      ScaffoldMessenger.of(context).showSnackBar(snackBarUserIncorrect);
    } else {
      if (usuarios[userIndex].pass == passInput) {
        context.pushNamed(HomeScreen.name, extra: userInput);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(snackBarPassIncorrect);
      }
    }
  }

  void _togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueAccent, Colors.lightBlueAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      "Login",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: userController,
                      decoration: const InputDecoration(
                        hintText: 'Usuario',
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: passController,
                      obscureText: _obscureText,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        suffixIcon: IconButton(
                          icon: Icon(
                            _obscureText ? Icons.visibility : Icons.visibility_off,
                          ),
                          onPressed: _togglePasswordVisibility,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () => _login(context),
                      child: const Text("Login"),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
