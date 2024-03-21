import 'package:flutter/material.dart';

import 'package:camera/camera.dart';
import 'camara_screen.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F0721),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'INICIO',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 20),
            _buildButton(context, 'REGISTRAR JUGADOR', Icons.person_add),
            _buildButton(context, 'VERIFICAR JUGADOR', Icons.verified_user),
            _buildButton(context, 'JUGADORES REGISTRADOS', Icons.people),
          ],
        ),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, IconData icon) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(title),
        onPressed: () async {
          // Inicializa la cámara aquí
          final cameras = await availableCameras();
          final controller = CameraController(
            cameras[0],
            ResolutionPreset.medium,
          );
          await controller.initialize();

          // Luego navega a la pantalla RegisterScreen
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CameraScreen()),
          );
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.transparent,
          side: BorderSide(color: Colors.white),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
      ),
    );
  }
}
