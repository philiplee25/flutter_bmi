import 'package:bmi/presentation/result_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();
  final _heightController = TextEditingController();
  final _weightController = TextEditingController();

  @override
  void dispose() {
    _heightController.dispose() ;
    _weightController.dispose() ;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI 계산기'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _heightController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: '키'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '키를 입력하세요.';
                }
                return null;
              },
            ),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _weightController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: '몸무게',
              ),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return '몸무게를 입력하세요.';
                }
                return null;
              },
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState?.validate() == false) {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      height: double.parse(_heightController.text),
                      weight: double.parse(_weightController.text),
                    ),
                  ),
                );
              },
              child: const Text('결과'),
            ),
          ],
        ),
      ),
    );
  }
}
