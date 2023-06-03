
import 'package:avtdevs/service/hive_service.dart';
import 'package:avtdevs/service/pref.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth/first_scren.dart';
import 'bloc/comments/bloc.dart';
import 'bottom_navigator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await HiveService.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  AppPrefs prefs = AppPrefs.instance;
  @override
  Widget build(BuildContext context) {
    print('***************************');
    print(prefs.employeeService);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => SendCommentsBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Colors.deepPurple,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ),
          primarySwatch: Colors.blue,
        ),
        home:
            prefs.employeeService != null ? const Home() : const SplashScreen(),
      ),
    );
  }
}
