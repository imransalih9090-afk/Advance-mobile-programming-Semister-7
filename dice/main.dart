
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const DiceApp());
}

class DiceApp extends StatelessWidget {
  const DiceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const DicePage(),
    );
  }
}

class DicePage extends StatefulWidget {
  const DicePage({super.key});

  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int dice1 = 1;
  int dice2 = 1;

  void rollDice() {
    setState(() {
      dice1 = Random().nextInt(6) + 1;
      dice2 = Random().nextInt(6) + 1;
    });
  }

  Widget dot() {
    return Container(
      width: 18,
      height: 18,
      decoration: const BoxDecoration(
        color: Colors.black,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget empty() {
    return const SizedBox(
      width: 18,
      height: 18,
    );
  }

  Widget buildDice(int value) {
    List<Widget> dots;

    switch (value) {
      case 1:
        dots = [
          empty(), empty(), empty(),
          empty(), dot(),   empty(),
          empty(), empty(), empty(),
        ];
        break;

      case 2:
        dots = [
          dot(),   empty(), empty(),
          empty(), empty(), empty(),
          empty(), empty(), dot(),
        ];
        break;

      case 3:
        dots = [
          dot(),   empty(), empty(),
          empty(), dot(),   empty(),
          empty(), empty(), dot(),
        ];
        break;

      case 4:
        dots = [
          dot(),   empty(), dot(),
          empty(), empty(), empty(),
          dot(),   empty(), dot(),
        ];
        break;

      case 5:
        dots = [
          dot(),   empty(), dot(),
          empty(), dot(),   empty(),
          dot(),   empty(), dot(),
        ];
        break;

      case 6:
        dots = [
          dot(),   empty(), dot(),
          dot(),   empty(), dot(),
          dot(),   empty(), dot(),
        ];
        break;

      default:
        dots = [];
    }

    return Container(
      width: 150,
      height: 150,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: Colors.black,
          width: 3,
        ),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            offset: Offset(3, 3),
          ),
        ],
      ),
      child: GridView.count(
        crossAxisCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        children: dots,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Two Dice"),
        centerTitle: true,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // TWO DICE
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildDice(dice1),

                const SizedBox(width: 30),

                buildDice(dice2),
              ],
            ),

            const SizedBox(height: 50),

            // ROLL BUTTON
            ElevatedButton(
              onPressed: rollDice,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 15,
                ),
              ),
              child: const Text(
                "ROLL DICE",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
