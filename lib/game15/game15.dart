import 'dart:async';
import 'package:flutter/material.dart';

import 'components.dart';

class Game15 extends StatefulWidget {
  const Game15({super.key});

  @override
  State<Game15> createState() => _Game15State();
}

class _Game15State extends State<Game15> {
  List<Color> colorList = [];
  int score = 0;
  int time = 0;
  late Timer timer;
  List<int> numberList = [];
  int objectIndex = 15;
  @override
  void initState() {
    super.initState();
    loadView();
  }

  void loadView() {
    objectIndex = 15;
    numberList.clear();
    for (int i = 0; i < 16; i++) {
      i < 15 ? colorList.add(Colors.deepPurple) : colorList.add(Colors.white);
      if (i < 15) {
        numberList.add(i + 1);
      }
    }
    // numberList.shuffle();
    numberList.add(16);
    time = 0;
    score = 0;
    startTimeout();
  }

  void click(int clickIndex) {
    if ((clickIndex - objectIndex).abs() == 1 ||
        (clickIndex - objectIndex).abs() == 4) {
      colorList[objectIndex] = Colors.deepPurple;
      colorList[clickIndex] = Colors.white;
      int k = numberList[objectIndex];
      numberList[objectIndex] = numberList[clickIndex];
      numberList[clickIndex] = k;
      objectIndex = clickIndex;
      score++;
      check();
    }
  }

  void check() {
    bool checked = true;
    for (int i = 0; i < numberList.length; i++) {
      if (numberList[i] != i + 1) {
        checked = false;
        break;
      }
    }
    if (checked) {
      restart();
      showAwesomeDialog(context, "Tabriklaymiz ! ! !", "Siz yutdingiz");
    }
  }

  void restart() {}
  void startTimeout() {
//    Timer.run(() {});
    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        time++;
      });
//      saveTime(time).then((value) => print(time.toString()));
    });
  }

  Widget cards(int colorIndex, int numberIndex, int clickIndex) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        backgroundColor: colorList[colorIndex],
      ),
      onPressed: () {
        setState(() {
          click(clickIndex);
        });
      },
      child: Text(
        numberList[numberIndex].toString(),
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  String timeFormat(int second) {
    String min = (second / 60).round() < 10
        ? '0${(second / 60).round()}'
        : '${(second / 60).round()}';
    String sec = (second - (second / 60).round() * 60) < 10
        ? '0${(second - (second / 60).round() * 60)}'
        : '${(second - ((second / 60).round() * 60))}';
    return '$min:$sec';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.deepPurple,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Time",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "$score",
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 50,
                      color: Colors.deepPurple,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Time",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            timeFormat(time),
                            style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Container(
                width: 320,
                height: 320,
                child: GridView.count(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 2,
                  mainAxisSpacing: 2,
                  crossAxisCount: 4,
                  children: [
                    cards(0, 0, 0),
                    cards(1, 1, 1),
                    cards(2, 2, 2),
                    cards(3, 3, 3),
                    cards(4, 4, 4),
                    cards(5, 5, 5),
                    cards(6, 6, 6),
                    cards(7, 7, 7),
                    cards(8, 8, 8),
                    cards(9, 9, 9),
                    cards(10, 10, 10),
                    cards(11, 11, 11),
                    cards(12, 12, 12),
                    cards(13, 13, 13),
                    cards(14, 14, 14),
                    cards(15, 15, 15),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Flex(
                direction: Axis.horizontal,
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(8),
                      height: 50,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          backgroundColor: Colors.deepPurple,
                        ),
                        onPressed: () {
                          check();
                        },
                        child: const Text(
                          "Finish",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                        margin: const EdgeInsets.all(8),
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                            backgroundColor: Colors.deepPurple,
                          ),
                          onPressed: () {
                            setState(() {
                              restart();
                              loadView();
                            });
                          },
                          child: const Text(
                            "Restart",
                            style: TextStyle(color: Colors.white),
                          ),
                        )),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (timer != null) {
      timer.cancel();
      // timer = null;
    }
    super.dispose();
  }
}
