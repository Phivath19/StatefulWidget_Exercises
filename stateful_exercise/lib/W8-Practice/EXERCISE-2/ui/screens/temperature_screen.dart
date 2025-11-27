
import 'package:flutter/material.dart';

class TemperatureScreen extends StatefulWidget {
  final VoidCallback onBackPressed;

  const TemperatureScreen({
    super.key, 
    required this.onBackPressed,
  });

  @override
  State<TemperatureScreen> createState() => _TemperatureScreenState();
}

class _TemperatureScreenState extends State<TemperatureScreen> {

  final TextEditingController celsiusController = TextEditingController();
  final TextEditingController fahrenheitController = TextEditingController();

  final InputDecoration inputDecoration = InputDecoration(
    enabledBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.white, width: 1.0),
      borderRadius: BorderRadius.circular(12),
    ),
    hintText: 'Enter a temperature',
    hintStyle: const TextStyle(color: Colors.white),
  );

  void celsiusToFahrenheit(String value) {
    if (value.isEmpty) {
      fahrenheitController.clear();
      return;
    }
    try {
      double celsius = double.parse(value);
      double fahrenheit = (celsius * 9 / 5) + 32;
      setState(() {
        fahrenheitController.text = fahrenheit.toStringAsFixed(2);
      });
    } catch (e) {
      fahrenheitController.clear();
    }
  }
  void fahrenheitToCelsius(String value) {
    if (value.isEmpty) {
      celsiusController.clear();
      return;
    }
    try {
      double fahrenheit = double.parse(value);
      double celsius = (fahrenheit - 32) * 5 / 9;
      setState(() {
        celsiusController.text = celsius.toStringAsFixed(2);
      });
    } catch (e) {
      celsiusController.clear();
    }
  }
  
  @override
  void dispose() {
    celsiusController.dispose();
    fahrenheitController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Icon(
              Icons.thermostat_outlined,
              size: 120,
              color: Colors.white,
            ),
            const Center(
              child: Text(
                "Converter",
                style: TextStyle(color: Colors.white, fontSize: 45),
              ),
            ),
            const SizedBox(height: 50),
            const Text(
              "Temperature in Degrees:",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: celsiusController,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: celsiusToFahrenheit,
            ),
            const SizedBox(height: 30),
            const Text(
              "Temperature in Fahrenheit:",
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: fahrenheitController,
              decoration: inputDecoration,
              style: const TextStyle(color: Colors.white),
              keyboardType: TextInputType.number,
              onChanged: fahrenheitToCelsius,
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: widget.onBackPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
              ),
              child: const Text(
                'Back to Home',
                style: TextStyle(color: Color(0xff16C062), fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

