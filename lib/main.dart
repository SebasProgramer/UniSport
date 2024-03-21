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

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // Correo y contraseña predeterminados
  final String defaultEmail = 'admin@gmail.com';
  final String defaultPassword = '123456';

  // Controladores para los campos de texto
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF5F0721),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Bienvenidos a UniSport',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
            SizedBox(height: 20),
            _buildTextField(context, 'Usuario', Icons.person, emailController),
            _buildTextField(
                context, 'Contraseña', Icons.lock, passwordController),
            _buildButton(context, 'INICIAR SESIÓN', Icons.login),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String title, IconData icon,
      TextEditingController controller) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 300,
      child: TextField(
        controller: controller,
        obscureText: title ==
            'Contraseña', // Oculta el texto si es el campo de la contraseña
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
          if (emailController.text == defaultEmail &&
              passwordController.text == defaultPassword) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          } else {
            // Muestra un mensaje de error si el correo o la contraseña son incorrectos
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Correo o contraseña incorrectos')),
            );
          }
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
