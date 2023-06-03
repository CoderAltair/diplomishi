import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../core/app_style.dart';
import '../flip_card/homepage.dart';

class AboutGame15 extends StatefulWidget {
  const AboutGame15({super.key});

  @override
  State<AboutGame15> createState() => _AboutGame15State();
}

class _AboutGame15State extends State<AboutGame15> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 1,
                          blurRadius: 6,
                          offset: Offset(1, 1),
                        ),
                      ],
                      image: const DecorationImage(
                          image: AssetImage("assets/zoot.jpg"),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const HomePage();
                            }));
                          },
                          child: const Padding(
                            padding: EdgeInsets.all(15.0),
                            child: ImageIcon(
                              AssetImage('assets/playy.png'),
                              size: 70,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Container(
                          height: 30,
                          child: AnimatedTextKit(
                            animatedTexts: [
                              ScaleAnimatedText(
                                "O`ynash uchun bosing",
                                textStyle: AppStyle.title(
                                    color: Colors.white, size: 20),
                              ),
                            ],
                            totalRepeatCount: 10,
                            pause: const Duration(milliseconds: 400),
                            displayFullTextOnTap: true,
                            stopPauseOnTap: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10, left: 15),
                child: Text(
                  'O`yin qoidalari',
                  style: AppStyle.title(size: 20),
                ),
              ),
              Text(
                'Ushbu o`yin xotirani mustahkamlash uchun mo`ljallangan o`yin hisoblanadi.'
                'Ushbu o`yinda sizga berilgan vaqt ichida o`yin kartalarini eslab qolishingiz kerak.'
                'Ikkita bir xil kartani topsangiz ushbu kartalar  ochiqligicha qoladi'
                'Barcha kartalarni ochib bo`lsangiz siz o`yinni yutgan hisoblanasiz',
                style: AppStyle.subTitle(size: 17, font: FontWeight.w400),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 10, left: 15),
                child: Text(
                  'Baho bering',
                  style: AppStyle.title(size: 20),
                ),
              ),
              RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: controller,
                style: AppStyle.txtStyleWhite(),
                decoration: InputDecoration(
                  hintText: 'Fikringizni qoldiring',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).canvasColor,
                    ),
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      // drawer: Drawer(
      //   child: drawerItems,
      // ),
    );
  }
}
