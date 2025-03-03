import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class InitScreen extends ConsumerWidget {
  const InitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Imagen de fondo
          Image.asset('assets/bg.png', fit: BoxFit.cover),
          // Contenido centrado sobre la imagen
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo centrado y más grande
              Padding(
                padding: const EdgeInsets.only(top: 100), // Ajusta el valor según necesites
                child: Center(
                  child: Image.asset(
                    'assets/logo_blanco.png',
                    width: 260, // Aumenta el tamaño del logo
                    height: 260,
                  ),
                ),
              ),
              const Spacer(),
              // Botón de Google
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                ),
                onPressed: () {
                  // Acción de continuar con Google
                },
                icon: Image.asset(
                  'assets/google_logo.png', // Asegúrate de tener este ícono en assets
                  width: 24,
                  height: 24,
                ),
                label: const Text(
                  'Continuar con Google',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 20),
              // Texto de registro
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿No tienes una cuenta? ',
                    style: TextStyle(color: Colors.white),
                  ),
                  GestureDetector(
                    onTap: () {
                      context.go('/register'); // Redirige a la pantalla de registro
                    },
                    child: const Text(
                      'Regístrate',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
            ],
          ),
        ],
      ),
    );
  }
}
