import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IMC Fácil',
      theme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          secondary: Colors.cyanAccent,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(fontSize: 34.0, fontWeight: FontWeight.bold, color: Colors.white),
          headlineMedium: TextStyle(fontSize: 26.0, fontWeight: FontWeight.w500, color: Colors.white),
          bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white70),
          bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white60),
        ),
        inputDecorationTheme: InputDecorationTheme(
          labelStyle: const TextStyle(color: Colors.white70),
          hintStyle: const TextStyle(color: Colors.white54),
          filled: true,
          fillColor: Colors.white12,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: const BorderSide(color: Colors.white24),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.cyanAccent, width: 2),
          ),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const BMICalculatorPage(),
    );
  }
}

class BMICalculatorPage extends StatefulWidget {
  const BMICalculatorPage({super.key});

  @override
  State<BMICalculatorPage> createState() => _BMICalculatorPageState();
}

class _BMICalculatorPageState extends State<BMICalculatorPage> {
  final TextEditingController _pesoController = TextEditingController();
  final TextEditingController _alturaController = TextEditingController();

  double _imc = 0.0;
  String _classificacao = '';

  void _calcularIMC() {
    final peso = double.tryParse(_pesoController.text);
    final alturaInput = _alturaController.text;
    double? altura;

    if (peso == null || peso <= 0) {
      _mostrarErro('Por favor, insira um peso válido.');
      return;
    }

    if (alturaInput.isEmpty) {
      _mostrarErro('Por favor, insira a altura.');
      return;
    }

    if (alturaInput.contains('.')) {
      altura = double.tryParse(alturaInput);
      if (altura == null || altura <= 0) {
        _mostrarErro('Por favor, insira uma altura válida (ex: 1.70).');
        return;
      }
    } else {
      final alturaCm = int.tryParse(alturaInput);
      if (alturaCm == null || alturaCm <= 0 || alturaCm > 300) {
        _mostrarErro('Por favor, insira uma altura válida em cm (ex: 170).');
        return;
      }
      altura = alturaCm / 100;
    }

    setState(() {
      _imc = peso / (altura! * altura!);
      _classificacao = _classificarIMC(_imc);
    });
  }

  String _classificarIMC(double imc) {
    if (imc < 18.5) return 'Abaixo do peso';
    if (imc < 25) return 'Peso normal';
    if (imc < 30) return 'Sobrepeso';
    if (imc < 35) return 'Obesidade grau I';
    if (imc < 40) return 'Obesidade grau II';
    return 'Obesidade grau III';
  }

  void _mostrarErro(String msg) {
    Scaffold
