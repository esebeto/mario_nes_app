import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mario_nes_app/widget/button_game.dart';
import 'package:mario_nes_app/widget/mario.dart';
import 'package:mario_nes_app/widget/text_game.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double marioX = 0;
  static double marioY = 1;

  double marioSize = 100;

  double time = 0;
  double height = 0;
  double initalHeight = marioY;

  bool midrun = false;
  bool midjump = false;

  String direction = 'right';

  void preJump() {
    time = 0;
    initalHeight = marioY;
  }

  void jump() {
    if (!midjump) {
      midjump = true;
      preJump();
      Timer.periodic(const Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initalHeight - height > 1) {
          midjump = false;
          timer.cancel();
          setState(() {
            marioY = 1;
          });
        } else {
          setState(() {
            marioY = initalHeight - height;
          });
        }
      });
    }
  }

  void moveLeft() {
    direction = 'left';

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (const ButtonGame().userIsHoldingButton() == true &&
          marioX - 0.02 > -1) {
        setState(() {
          marioX -= 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void moveRight() {
    direction = 'right';

    Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (const ButtonGame().userIsHoldingButton() == true &&
          marioX + 0.02 < 1) {
        setState(() {
          marioX += 0.02;
          midrun = !midrun;
        });
      } else {
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
                  color: Colors.blue,
                  child: AnimatedContainer(
                    alignment: Alignment(marioX, marioY),
                    duration: const Duration(milliseconds: 0),
                    child: midjump
                        ? MarioJumping(
                            direction: direction,
                            size: marioSize,
                          )
                        : MarioCharacter(
                            direction: direction,
                            midrun: midrun,
                            size: marioSize,
                          ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 100.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextGame(title: 'MARIO', description: '0000'),
                      TextGame(title: 'WORLD', description: '1-1'),
                      TextGame(title: 'TIME', description: '9999')
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 10,
            color: Colors.green,
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ButtonGame(
                    myIcon: Icons.arrow_back,
                    onTap: moveLeft,
                  ),
                  ButtonGame(
                    myIcon: Icons.arrow_upward,
                    onTap: jump,
                  ),
                  ButtonGame(
                    myIcon: Icons.arrow_forward,
                    onTap: moveRight,
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
