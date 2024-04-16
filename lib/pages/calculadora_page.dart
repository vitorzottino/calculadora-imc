import 'package:calculadora/components/bottom_button.dart';
import 'package:calculadora/components/contador.dart';
import 'package:calculadora/components/custom_card.dart';
import 'package:calculadora/components/gender_select.dart';
import 'package:calculadora/components/slider_altura.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  Gender? selectedGender;
  int altura = 120;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora IMC'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  child: CustomCard(
                    active: selectedGender == Gender.male,
                    child: const GenderSelect(
                      genderIcon: Icons.man,
                      text: 'Masculino',
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                child: CustomCard(
                  active: selectedGender == Gender.female,
                  child: const GenderSelect(
                    genderIcon: Icons.woman,
                    text: 'Feminino',
                  ),
                ),
              )),
            ],
          )),
          Expanded(
            child: CustomCard(
              child: SliderAltura(
                altura: altura,
                fn: (double value) {
                  setState(() {
                    altura = value.toInt();
                  });
                },
              ),
            ),
          ),
          const Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: Contador(),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: Contador(),
                  ),
                ),
              ],
            ),
          ),
          const BottomButton(buttonTitle: 'Calcular IMC')
        ],
      ),
    );
  }
}
