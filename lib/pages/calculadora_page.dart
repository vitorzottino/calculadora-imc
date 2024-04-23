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
  int peso = 80;
  int idade = 18;

  final int pesoMin = 20;
  final int pesoMax = 200;
  final int idadeMin = 10;
  final int idadeMax = 100;

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
           Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CustomCard(
                    child: Contador(
                      label: 'Peso',
                      value: peso,
                      onIncrement: () {
                        if (peso < pesoMax) {
                          setState(() {
                            peso++;
                          });
                        }
                      },
                      onDecrement: () {
                        if (peso > pesoMin) {
                          setState(() {
                            peso++;
                          });
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: CustomCard(
                    child: Contador(
                      label: 'Idade',
                      value: idade,
                      onIncrement: () {
                        if (idade < idadeMax) {
                          setState(() {
                            idade++;
                          });
                        }
                      },
                      onDecrement: () {
                        if (idade > idadeMin) {
                          setState(() {
                            idade--;
                          });
                        }
                      },
                    ),
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
