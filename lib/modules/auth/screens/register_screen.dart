import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../providers/auth_provider.dart';

class RegisterScreen extends ConsumerWidget {
  final TextEditingController userController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(authProvider);

    return Scaffold(
      backgroundColor: Color(0xFFE1E1E1),
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: 0,
            right: 0,
            child: Opacity(
              opacity: 0.5,
              child: ClipPath(
                clipper: TopWaveClipper(),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/bg.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/logo_blanco.png',
                      height: 150,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 350, // Ancho aumentado del box blanco
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30), // Bordes más redondeados
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 8), // Sombra solo hacia abajo
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            const Text(
                              "Bienvenido\nRegistra tu cuenta",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Campo Usuario
                            SizedBox(
                              width: 280, // Más corto horizontalmente
                              child: TextField(
                                controller: userController,
                                decoration: InputDecoration(
                                  labelText: 'Usuario',
                                  filled: false,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22),
                                    borderSide: const BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10), // Altura reducida
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Campo Correo Electrónico
                            SizedBox(
                              width: 280,
                              child: TextField(
                                controller: emailController,
                                decoration: InputDecoration(
                                  labelText: 'Correo Electrónico',
                                  filled: false,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22),
                                    borderSide: const BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),

                            // Campo Contraseña
                            SizedBox(
                              width: 280,
                              child: TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  filled: false,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22),
                                    borderSide: const BorderSide(color: Colors.black),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                ),
                                obscureText: true,
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Botón de Registro
                            ElevatedButton(
                              onPressed: auth
                                  ? null
                                  : () {
                                      ref.read(authProvider.notifier).register(
                                            userController.text,
                                            emailController.text,
                                            passwordController.text,
                                          );
                                    },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              ),
                              child: auth
                                  ? const CircularProgressIndicator()
                                  : const Text(
                                      'Registrarse',
                                      style: TextStyle(color: Colors.white, fontSize: 18),
                                    ),
                            ),
                            const SizedBox(height: 10),

                            // Enlace para iniciar sesión
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '¿Ya tienes una cuenta? ',
                                  style: TextStyle(color: Colors.black87),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.go('/login'); // Redirige a la pantalla de inicio de sesión
                                  },
                                  child: const Text(
                                    'Ingresa',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(
        size.width / 2, size.height + 20, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
