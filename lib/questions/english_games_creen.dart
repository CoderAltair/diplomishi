
import 'package:avtdevs/questions/question_manager.dart';
import 'package:avtdevs/questions/questions_model.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';

class QuestionsEnglish extends StatefulWidget {
  const QuestionsEnglish({super.key});

  @override
  State<QuestionsEnglish> createState() => _QuestionsEnglishState();
}

class _QuestionsEnglishState extends State<QuestionsEnglish> {
  List<QuestionData> questions = [];
  List<String> answers = ['', '', '', '', '', ''];
  List<bool> variantButtonsVisibility = [];
  List<bool> answerButtonsVisibility = [];

  late QuestionManager manager;

  @override
  void initState() {
    super.initState();
    getquestion();
    manager = QuestionManager(questions);
    setViewVisibility();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: 350,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            spreadRadius: -2,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      margin: const EdgeInsets.all(5),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          manager.getQuestion(),
                          filterQuality: FilterQuality.medium,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: answerButtonsVisibility[0],
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        answerButtonClick(0);
                      },
                      child: Text(answers[0]),
                    ),
                  ),
                ),
                Visibility(
                  visible: answerButtonsVisibility[1],
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        answerButtonClick(1);
                      },
                      child: Text(answers[1]),
                    ),
                  ),
                ),
                Visibility(
                  visible: answerButtonsVisibility[2],
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        answerButtonClick(2);
                      },
                      child: Text(answers[2]),
                    ),
                  ),
                ),
                Visibility(
                  visible: answerButtonsVisibility[3],
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        answerButtonClick(3);
                      },
                      child: Text(answers[3]),
                    ),
                  ),
                ),
                Visibility(
                  visible: answerButtonsVisibility[4],
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        answerButtonClick(4);
                      },
                      child: Text(answers[4]),
                    ),
                  ),
                ),
                Visibility(
                  visible: answerButtonsVisibility[5],
                  child: Container(
                    margin: const EdgeInsets.only(right: 4),
                    width: 45,
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        answerButtonClick(5);
                      },
                      child: Text(answers[5]),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: GridView.count(
              shrinkWrap: true,
              primary: false,
              padding: const EdgeInsets.all(16),
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              crossAxisCount: 5,
              children: [
                Visibility(
                  visible: variantButtonsVisibility[0],
                  child: ElevatedButton(
                    onPressed: () {
                      variantButtonClick(0);
                    },
                    child: Text(manager.getVariant()[0]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[1],
                  child: ElevatedButton(
                    onPressed: () {
                      variantButtonClick(1);
                    },
                    child: Text(manager.getVariant()[1]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[2],
                  child: ElevatedButton(
                    onPressed: () {
                      variantButtonClick(2);
                    },
                    child: Text(manager.getVariant()[2]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[3],
                  child: ElevatedButton(
                    onPressed: () {
                      variantButtonClick(3);
                    },
                    child: Text(manager.getVariant()[3]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[4],
                  child: ElevatedButton(
                    onPressed: () {
                      variantButtonClick(4);
                    },
                    child: Text(manager.getVariant()[4]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[5],
                  child: ElevatedButton(
                    onPressed: () {
                      variantButtonClick(5);
                    },
                    child: Text(manager.getVariant()[5]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[6],
                  child: ElevatedButton(
                    onPressed: () {
                      variantButtonClick(6);
                    },
                    child: Text(manager.getVariant()[6]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[7],
                  child: ElevatedButton(
                    onPressed: () {
                      variantButtonClick(7);
                    },
                    child: Text(manager.getVariant()[7]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[8],
                  child: ElevatedButton(
                    onPressed: () {
                      variantButtonClick(8);
                    },
                    child: Text(manager.getVariant()[8]),
                  ),
                ),
                Visibility(
                  visible: variantButtonsVisibility[9],
                  child: ElevatedButton(
                    onPressed: () {
                      variantButtonClick(9);
                    },
                    child: Text(manager.getVariant()[9]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void getquestion() {
    questions.add(QuestionData('assets/melon.jpg', 'melon', 'rmylaeodqn'));
    questions.add(QuestionData('assets/banan.jpg', 'banan', 'npaiaeonbp'));
    questions.add(QuestionData('assets/apple_2.jpg', 'apple', 'eacplepoph'));
    questions.add(QuestionData('assets/pen.webp', 'pen', 'rpynaeopqo'));
    questions.add(QuestionData('assets/pencil.jpg', 'pencil', 'rpliceonqp'));
    questions.add(QuestionData('assets/zebra.jpg', 'zebra', 'eacblerozh'));
    questions.add(QuestionData('assets/robot.jpg', 'robot', 'rptiaeobqo'));
    questions.add(QuestionData('assets/onion.jpg', 'onion', 'opnikeonqp'));
    questions.add(QuestionData('assets/orange.webp', 'orange', 'rpcanepogh'));
    questions.add(QuestionData('assets/potato.webp', 'potato', 'ptoiaeftqo'));
  }

  void setViewVisibility() {
    variantButtonsVisibility.clear();
    answerButtonsVisibility.clear();

    for (int i = 0; i < 10; i++) {
      variantButtonsVisibility.add(true);
    }

    for (int i = 0; i < 6; i++) {
      answers[i] = '';
      if (manager.getAnswerLength() > i) {
        answerButtonsVisibility.add(true);
      } else {
        answerButtonsVisibility.add(false);
      }
    }
  }

  void answerButtonClick(int i) {
    for (int j = 0; j < 10; j++) {
      if (variantButtonsVisibility[j] == false &&
          manager.getVariant()[j] == answers[i]) {
        setState(() {
          variantButtonsVisibility[j] = true;
          answers[i] = '';
        });
      }
    }
  }

  void variantButtonClick(int i) {
    for (int j = 0; j < manager.getAnswerLength(); j++) {
      if (answers[j].isEmpty) {
        setState(() {
          answers[j] = manager.getVariant()[i];
          variantButtonsVisibility[i] = false;
          checkAnswer();
        });
        break;
      }
    }
  }

  void checkAnswer() {
    String answer = '';
    answers.forEach((element) {
      if (element.isNotEmpty) answer += element;
    });
    if (manager.check(answer)) {
      setState(() {
        if (manager.nextQuestion()) {
          setViewVisibility();
        } else {
          AwesomeDialog(
            context: context,
            dialogType: DialogType.SUCCES,
            animType: AnimType.BOTTOMSLIDE,
            title: 'Congratulation',
            desc: 'You are win!!!!',
            btnOkOnPress: () {},
          )..show();
        }
      });
    }
  }
}
