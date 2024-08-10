import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _login() {
    const String correctUsername = '2200016024'; // Ganti dengan NIM Anda
    const String correctPassword =
        'ruwaeda'; // Ganti dengan password Anda

    if (_usernameController.text == correctUsername &&
        _passwordController.text == correctPassword) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Invalid username or password')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login,
              child: Text('Login'),
            ),
          ],
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  String _bmiResult = '';
  String _bmiCategory = '';

  void _calculateBMI() {
    double weight = double.parse(_weightController.text);
    double height =
        double.parse(_heightController.text) / 100; // Convert cm to meters
    double bmi = weight / (height * height);

    setState(() {
      _bmiResult = bmi.toStringAsFixed(2);
      if (bmi < 18.5) {
        _bmiCategory = 'Underweight';
      } else if (bmi >= 18.5 && bmi <= 24.9) {
        _bmiCategory = 'Normal';
      } else {
        _bmiCategory = 'Overweight';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Weight (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Height (cm)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calculateBMI,
              child: Text('Calculate BMI'),
            ),
            SizedBox(height: 20),
            Text(
              _bmiResult.isNotEmpty ? 'BMI: $_bmiResult' : '',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              _bmiCategory.isNotEmpty ? 'Category: $_bmiCategory' : '',
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}