import 'package:flutter/material.dart';
import 'package:starhovanie/presentation/home.dart';
import 'package:starhovanie/presentation/sing_in.dart';

class Application extends StatefulWidget {
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PassManager',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      // onGenerateRoute: router.generateRouter,
      // initialRoute: isAuth ? UrlPage.singIn : UrlPage.home,
      home: const SingIn(),
    );
  }
}
