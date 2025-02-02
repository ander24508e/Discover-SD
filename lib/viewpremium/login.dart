import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:app_turism/templates/color.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String clave_correcta = 'root1234';

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "Usuario Incorrecto";
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Contraseña Incorrecta";
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: thirdColor,
        title: Text(
          'Iniciar Sesión'.toUpperCase(),
          style: GoogleFonts.dmSerifDisplay(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.asset(
                    'lib/imagenes/discoverlogo.jpg',
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  enabled: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(242, 34, 34, 34),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Usuario".toUpperCase(),
                    prefixIcon: const Icon(Icons.person_outline),
                    prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                  ),
                  validator: _validateUsername,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _passwordController,
                  enabled: true,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.black12),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color.fromARGB(242, 34, 34, 34),
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    hintText: "Contraseña".toUpperCase(),
                    prefixIcon: const Icon(Icons.lock),
                    prefixIconColor: const Color.fromARGB(242, 34, 34, 34),
                  ),
                  obscureText: true,
                  validator: _validatePassword,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (_usernameController.text != 'ander') {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text("Usuario incorrecto")),
                            );
                          } else if (_passwordController.text !=
                              clave_correcta) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Contraseña incorrecta"),
                              ),
                            );
                          } else {
                            Navigator.pushNamed(context, 'menu_premium');
                          }
                        }
                      },
                      child: const Text("INICIAR SESIÓN"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'registro');
                      },
                      child: const Text("REGISTRARSE"),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'menu_page');
                  },
                  child: const Text("INVITADO"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
