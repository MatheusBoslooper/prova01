// CALCULADORA IMC

import 'package:flutter/material.dart';

void main() {
  runApp(IMCCalculatorApp());
}

class IMCCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora de IMC',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: IMCCalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class IMCCalculatorPage extends StatefulWidget {
  @override
  _IMCCalculatorPageState createState() => _IMCCalculatorPageState();
}

class _IMCCalculatorPageState extends State<IMCCalculatorPage>
    with SingleTickerProviderStateMixin {
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _weightFocus = FocusNode();
  final _heightFocus = FocusNode();

  double? imc;
  String _resultMessage = '';
  Color _resultColor = Colors.transparent;
  bool _showResult = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );

    _scaleAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutBack,
    );

    _controller.forward();
  }

  void _calculateIMC() {
    final weight = double.tryParse(_weightController.text);
    final height = double.tryParse(_heightController.text);

    if (weight == null || height == null || height <= 0) {
      setState(() {
        _resultMessage = 'Por favor, insira valores válidos.';
        imc = null;
        _resultColor = Colors.red.shade100;
        _showResult = true;
      });
      return;
    }

    final imcCalculated = weight / (height * height);
    String message;
    Color bgColor;

    if (imcCalculated < 18.5) {
      message = 'Abaixo do peso';
      bgColor = Colors.yellow.shade200;
    } else if (imcCalculated < 24.9) {
      message = 'Peso normal';
      bgColor = Colors.green.shade200;
    } else if (imcCalculated < 29.9) {
      message = 'Sobrepeso';
      bgColor = Colors.orange.shade200;
    } else if (imcCalculated < 34.9) {
      message = 'Obesidade grau 1';
      bgColor = Colors.deepOrange.shade200;
    } else if (imcCalculated < 39.9) {
      message = 'Obesidade grau 2';
      bgColor = Colors.red.shade300;
    } else {
      message = 'Obesidade grau 3';
      bgColor = Colors.red.shade400;
    }

    setState(() {
      imc = imcCalculated;
      _resultMessage = '$message (IMC: ${imcCalculated.toStringAsFixed(2)})';
      _resultColor = bgColor;
      _showResult = true;
    });
  }

  void _resetFields() {
    _weightController.clear();
    _heightController.clear();
    setState(() {
      imc = null;
      _resultMessage = '';
      _resultColor = Colors.transparent;
      _showResult = false;
    });
  }

  Widget _buildAnimatedInput({
    required String label,
    required IconData icon,
    required TextEditingController controller,
    required FocusNode focusNode,
  }) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: focusNode.hasFocus ? Colors.teal.shade50 : Colors.grey.shade100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: focusNode.hasFocus ? Colors.teal : Colors.grey.shade400,
          width: 2,
        ),
      ),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        keyboardType: TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: label,
          border: InputBorder.none,
        ),
        onTap: () => setState(() {}),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _weightController.dispose();
    _heightController.dispose();
    _weightFocus.dispose();
    _heightFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _resultColor.withAlpha((0.15 * 255).toInt()),
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _resetFields,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Center(
              child: Column(
                children: [
                  Text(
                    '',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal.shade800,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  _buildAnimatedInput(
                    label: 'Peso (kg)',
                    icon: Icons.fitness_center,
                    controller: _weightController,
                    focusNode: _weightFocus,
                  ),
                  SizedBox(height: 16),
                  _buildAnimatedInput(
                    label: 'Altura (m)',
                    icon: Icons.height,
                    controller: _heightController,
                    focusNode: _heightFocus,
                  ),
                  SizedBox(height: 24),
                  GestureDetector(
                    onTap: _calculateIMC,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.shade300,
                            blurRadius: 10,
                            offset: Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Text(
                        'Calcular IMC',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 32),
                  if (_showResult)
                    AnimatedOpacity(
                      opacity: 1,
                      duration: Duration(milliseconds: 600),
                      child: Card(
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        color: _resultColor,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            _resultMessage,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal.shade900,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
