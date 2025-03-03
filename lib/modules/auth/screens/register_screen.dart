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
                      width: 350,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              spreadRadius: 0,
                              offset: Offset(0, 8),
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
                              width: 280,
                              child: TextField(
                                controller: userController,
                                decoration: InputDecoration(
                                  labelText: 'Usuario',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
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
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22),
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
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: 'Contraseña',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(22),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
                                ),
                              ),
                            ),
                            const SizedBox(height: 20),

                            // Botón de Registro
                            ElevatedButton(
                              onPressed: auth
                                  ? null
                                  : () {
                                      print("Botón de registro presionado");
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
                            const SizedBox(height: 20),

                            // Íconos de Google, Apple y Facebook con fondo circular
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildSocialIcon('assets/google_logo.png', () {
                                  print("Iniciar sesión con Google");
                                }),
                                const SizedBox(width: 20),
                                _buildSocialIcon('assets/apple_logo.png', () {
                                  print("Iniciar sesión con Apple");
                                }),
                                const SizedBox(width: 20),
                                _buildSocialIcon('assets/facebook_logo.png', () {
                                  print("Iniciar sesión con Facebook");
                                }),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  '¿Ya tienes una cuenta? ',
                                  style: TextStyle(color: Colors.black87),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    context.go('/login');
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

  // Widget para construir iconos sociales con fondo circular
  Widget _buildSocialIcon(String assetPath, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: Color(0xFFF2F1F1),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Image.asset(
            assetPath,
            width: 30,
            height: 30,
          ),
        ),
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