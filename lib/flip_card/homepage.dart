import 'package:flutter/material.dart';
import '../core/app_style.dart';
import 'flipcardgame.dart';
import 'data.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Level',
                style: AppStyle.title(color: const Color(0xFF3594DD), size: 40),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 150),
              child: ListView.builder(
                itemCount: _list.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) =>
                                _list[index].goto,
                          ));
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 90,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color(0xFF3594DD),
                              Color(0xFF4563DB),
                              Color(0xFF5036D5),
                              Color(0xFF5B16D0),
                            ],
                            stops: [
                              0.1,
                              0.4,
                              0.7,
                              0.9,
                            ],
                            begin: FractionalOffset.topCenter,
                            end: FractionalOffset.bottomCenter,
                            tileMode: TileMode.repeated,
                          ),
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                                child: Text(
                              _list[index].name,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black26,
                                      blurRadius: 2,
                                      offset: Offset(1, 2),
                                    ),
                                    Shadow(
                                        color: Colors.green,
                                        blurRadius: 2,
                                        offset: Offset(0.5, 2))
                                  ]),
                            )),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: genratestar(_list[index].noOfstar),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Container(
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  "assets/254.png",
                ),
                Image.asset(
                  "assets/253.png",
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> genratestar(int no) {
    List<Widget> _icons = [];
    for (int i = 0; i < no; i++) {
      _icons.insert(
          i,
          const Icon(
            Icons.star,
            color: Colors.yellow,
          ));
    }
    return _icons;
  }
}

class Details {
  String name;
  Color primarycolor;
  Color secomdarycolor;
  Widget goto;
  int noOfstar;

  Details(
      {required this.name,
      required this.primarycolor,
      required this.secomdarycolor,
      required this.noOfstar,
      required this.goto});
}

List<Details> _list = [
  Details(
      name: "EASY",
      primarycolor: Colors.green,
      secomdarycolor: Colors.greenAccent,
      noOfstar: 1,
      goto: const FlipCardGane(
        level: Level.Easy,
      )),
  Details(
    name: "MEDIUM",
    primarycolor: Colors.orange,
    secomdarycolor: Colors.orangeAccent,
    noOfstar: 2,
    goto: const FlipCardGane(level: Level.Medium),
  ),
  Details(
      name: "HARD",
      primarycolor: Colors.red,
      secomdarycolor: Colors.redAccent,
      noOfstar: 3,
      goto: const FlipCardGane(
        level: Level.Hard,
      ))
];
