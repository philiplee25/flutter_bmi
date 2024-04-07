import 'package:bmi/presentation/result_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _formKey = GlobalKey<FormState>();

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
                if (_formKey.currentState?.validate() ?? false) {
                  return;
                }

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ResultScreen(
                      height: 180,
                      weight: 77.5,
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
