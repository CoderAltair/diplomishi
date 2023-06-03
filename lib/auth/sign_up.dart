import 'package:flutter/material.dart';
import '../bottom_navigator.dart';
import '../service/firebase_auth.dart';
import '../service/prefs.dart';

class SignUp extends StatefulWidget {
  static String id = 'signup_page';
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController fullNameController = TextEditingController();

  var isLoading = false;
  _getFirebaseUser(Future<String>? user) async {
    setState(() {
      isLoading = false;
    });
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) {
            return const Home();
          },
        ),
      );
    } else {
      // Utils.fireToast('Check your information');
    }
  }

  _doSignUp() {
    String email = fullNameController.text.toString().trim();
    String password = fullNameController.text.toString().trim();
    String name = fullNameController.text.toString().trim();
    if (email.isEmpty || password.isEmpty || name.isEmpty) return;
    setState(() {
      isLoading = true;
    });

    AuthService.instance.signUpUser(context, email, password, name);
    _getFirebaseUser(Prefs.instance.loadUserId());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        // alignment: Alignment.topCenter,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 200,
              ),
              const Center(
                child: Text(
                  "Ro`yxatdan o`tish",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.deepPurple),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(color: Colors.deepPurple),
                    hoverColor: Colors.deepPurple,
                    fillColor: Colors.deepPurple,
                    focusColor: Colors.deepPurple,
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepPurple),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10.0),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 200,
                height: 50,
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      _doSignUp();
                    },
                    child: const Text('Sign Up'),
                  ),
                ),
              ),
            ],
          ),
          isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : const SizedBox.shrink(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
}
