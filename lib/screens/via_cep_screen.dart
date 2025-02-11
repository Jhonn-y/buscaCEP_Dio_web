import 'package:dio_browser_nativo/screens/via_cep_controller.dart';
import 'package:flutter/material.dart';

class ViaCepScreen extends StatefulWidget {
  const ViaCepScreen({super.key});

  @override
  State<ViaCepScreen> createState() => _ViaCepScreenState();
}

class _ViaCepScreenState extends State<ViaCepScreen> {
  final cepEC = TextEditingController();
  final viaCepController = ViaCepController();

  @override
  void dispose() {
    cepEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Busca de Logradouro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: cepEC,
              decoration: const InputDecoration(
                  label: Text('CEP'), border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton(
                onPressed: () {
                  viaCepController.getAddress(cepEC.text);
                },
                child: const Text('Buscar CEP')),
            const SizedBox(
              height: 16,
            ),
            ValueListenableBuilder(
              valueListenable: viaCepController,
              builder: (_, viaCepControllerValue, child) {
                return Text(
                  'Logradouro: ${viaCepControllerValue.street}',
                  style: const TextStyle(fontSize: 16),
                );
              },
            ),
            ValueListenableBuilder(
              valueListenable: viaCepController,
              builder: (_, viaCepControllerValue, child) {
                return Text(
                  'Cidade: ${viaCepControllerValue.city}',
                  style: const TextStyle(fontSize: 16),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
