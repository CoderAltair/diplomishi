import 'dart:async';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import '../bottom_navigator.dart';
import 'data.dart';

class FlipCardGane extends StatefulWidget {
  final Level level;
  const FlipCardGane({required this.level, super.key});

  @override
  State<FlipCardGane> createState() => _FlipCardGaneState();
}

class _FlipCardGaneState extends State<FlipCardGane> {
  int _previousIndex = -1;
  bool _flip = false;
  bool _start = false;

  bool _wait = false;

  late Timer _timer;
  int _time = 5;
  late int _left;
  late bool _isFinished;
  List<dynamic> _data = [];

  List<bool> _cardFlips = [];
  List<GlobalKey<FlipCardState>> _cardStateKeys = [];

  Widget getItem(int index) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[100],
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 3,
              spreadRadius: 0.8,
              offset: Offset(2.0, 1),
            )
          ],
          borderRadius: BorderRadius.circular(5)),
      margin: const EdgeInsets.all(4.0),
      child: Image.asset(_data[index]),
    );
  }

  startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (t) {
      setState(() {
        _time = _time - 1;
      });
    });
  }

  void restart() {
    startTimer();
    _data = getSourceArray(widget.level);
    _cardFlips = getInitialItemState(widget.level);
    _cardStateKeys = getCardStateKeys(widget.level);
    _time = 5;
    _left = (_data.length ~/ 2);

    _isFinished = false;
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        _start = true;
        _timer.cancel();
      });
    });
  }

  @override
  void initState() {
    super.initState();

    restart();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // return
    // _isFinished
    //     ? Scaffold(
    //         body: Center(
    //           child: GestureDetector(
    //             onTap: () {
    //               setState(() {
    //                 restart();
    //               });
    //             },
    //             child: Container(
    //               height: 50,
    //               width: 200,
    //               alignment: Alignment.center,
    //               decoration: BoxDecoration(
    //                 color: Colors.blue,
    //                 borderRadius: BorderRadius.circular(24),
    //               ),
    //               child: const Text(
    //                 "O`yinni qayta boshlash",
    //                 style: TextStyle(
    //                     color: Colors.white,
    //                     fontSize: 17,
    //                     fontWeight: FontWeight.w500),
    //               ),
    //             ),
    //           ),
    //         ),
    //       )
    //     :
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: _time > 0
                    ? Text(
                        '$_time',
                        style: Theme.of(context).textTheme.headline3,
                      )
                    : Text(
                        '$_left ta card qoldi',
                        style: Theme.of(context).textTheme.headline3,
                      ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, index) => _start
                      ? FlipCard(
                          key: _cardStateKeys[index],
                          onFlip: () {
                            if (!_flip) {
                              _flip = true;
                              _previousIndex = index;
                            } else {
                              _flip = false;
                              if (_previousIndex != index) {
                                if (_data[_previousIndex] != _data[index]) {
                                  _wait = true;

                                  Future.delayed(
                                      const Duration(milliseconds: 1500), () {
                                    _cardStateKeys[_previousIndex]
                                        .currentState
                                        ?.toggleCard();
                                    _previousIndex = index;
                                    _cardStateKeys[_previousIndex]
                                        .currentState
                                        ?.toggleCard();

                                    Future.delayed(
                                        const Duration(milliseconds: 160), () {
                                      setState(() {
                                        _wait = false;
                                      });
                                    });
                                  });
                                } else {
                                  _cardFlips[_previousIndex] = false;
                                  _cardFlips[index] = false;
                               

                                  setState(() {
                                    _left -= 1;
                                  });
                                  if (_cardFlips.every((t) => t == false)) {
                                  
                                    Future.delayed(
                                        const Duration(milliseconds: 160), () {
                                      setState(() {
                                        _isFinished = true;
                                        _start = false;
                                      });
                                    });
                                    AwesomeDialog(
                                      context: context,
                                      animType: AnimType.scale,
                                      dialogType: DialogType.success,
                                      body: const Center(
                                        child: Text(
                                          'Tabriklaymiz siz yutdingiz.\nQayta o`ynash uchun OK \nBosh menyuga qaytish uchun Cancel\n tugmalarini bosing.',
                                          style: TextStyle(
                                              fontStyle: FontStyle.italic),
                                        ),
                                      ),
                                      title: 'This is Ignored',
                                      desc: 'This is also Ignored',
                                      btnCancelOnPress: () {
                                        Navigator.pushAndRemoveUntil(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return const Home();
                                          },
                                        ), (Route<dynamic> route) => false);
                                      },
                                      btnOkOnPress: () {
                                        setState(() {
                                          restart();
                                        });
                                      },
                                    ).show();
                                  }
                                }
                              }
                            }
                            setState(() {});
                          },
                          flipOnTouch: _wait ? false : _cardFlips[index],
                          direction: FlipDirection.HORIZONTAL,
                          front: Container(
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black45,
                                    blurRadius: 3,
                                    spreadRadius: 0.8,
                                    offset: Offset(2.0, 1),
                                  )
                                ]),
                            margin: const EdgeInsets.all(4.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(
                                "assets/quest.png",
                              ),
                            ),
                          ),
                          back: getItem(index))
                      : getItem(index),
                  itemCount: _data.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
