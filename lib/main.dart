import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'camara_screen.dart'; // Importa la pantalla CameraScreen


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: Color(0xFF5F0721),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F0721),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'INICIO DE SESIÓN',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 20),
            _buildTextField(context, 'Usuario', Icons.person),
            _buildTextField(context, 'Contraseña', Icons.lock),
            _buildButton(context, 'INICIAR SESIÓN', Icons.login),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String title, IconData icon) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 300,
      child: TextField(
        decoration: InputDecoration(
          labelText: title,
          labelStyle: TextStyle(color: Colors.white),
          prefixIcon: Icon(icon, color: Colors.white),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, IconData icon) {
    return Container(
      margin: EdgeInsets.all(10),
      child: ElevatedButton.icon(
        icon: Icon(icon, color: Colors.white),
        label: Text(title),
        onPressed: () {
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
