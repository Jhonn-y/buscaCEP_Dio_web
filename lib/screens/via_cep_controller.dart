import 'package:dio_browser_nativo/repositories/via_cep_repository.dart';
import 'package:flutter/material.dart';

class ViaCepController extends ValueNotifier<({String city, String street})> {
  ViaCepController() : super((city: '', street: ''));

  final repository = ViaCepRepository();

  Future<void> getAddress(String cep) async {
    value = await repository.getAddress(cep);
  }

}
