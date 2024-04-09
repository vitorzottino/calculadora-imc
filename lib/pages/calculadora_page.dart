import 'package:calculadora/components/custom_card.dart';
import 'package:calculadora/components/gender_select.dart';
import 'package:flutter/material.dart';

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                  child: CustomCard(
                      child: GenderSelect(
                          genderIcon: Icons.man, text: 'Masculino'))),
              Expanded(
                  child: CustomCard(
                child: GenderSelect(genderIcon: Icons.woman, text: 'Feminino'),
              )),
            ],
          )),
          Expanded(
            child: CustomCard(),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(),
                ),
                Expanded(
                  child: CustomCard(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
