import 'package:flutter/material.dart';
import 'package:starhovanie/presentation/sing_in.dart';
import 'package:starhovanie/presentation/widget/cabinet.dart';
import 'package:starhovanie/presentation/widget/cart.dart';
import 'package:starhovanie/presentation/widget/main.dart';
import 'package:starhovanie/presentation/widget/polis.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int count = 0;

  List<Widget> contentList = [
    Main(),
    Cart(),
    Polis(),
    Cabinet(),
  ];

  // List<AppBar> appBarList = [
  //   AppBar(
  //     title: const Text('ИНГОССТРАХ'),
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //   ),
  //   AppBar(
  //     title: const Text('ИНГОССТРАХ'),
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //   ),
  //   AppBar(
  //     toolbarHeight: 40,
  //     title: const Text(
  //       'Мои полисы',
  //       style: TextStyle(fontSize: 16),
  //     ),
  //     centerTitle: true,
  //     actions: [
  //       Container(
  //         child: Padding(
  //           padding: EdgeInsets.symmetric(horizontal: 10),
  //           child: Icon(
  //             Icons.search_outlined,
  //             color: Color.fromARGB(133, 214, 214, 214),
  //           ),
  //         ),
  //       )
  //     ],
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //   ),
  //   AppBar(
  //     actions: const [
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10),
  //         child: Icon(Icons.edit),
  //       )
  //     ],
  //     leading: IconButton(
  //       onPressed: () {
  //         Navigator.pushAndRemoveUntil(context, SingIn(), (route) => false);
  //       },
  //       icon: Icon(Icons.exit_to_app),
  //     ),
  //     backgroundColor: Colors.transparent,
  //     elevation: 0,
  //   ),
  // ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.blue[900]!,
            Colors.blue[600]!,
            Colors.blue[600]!,
            Colors.blue[900]!
          ],
          begin: Alignment.centerRight,
          end: Alignment.centerLeft,
        ),
      ),
      child: Scaffold(
        appBar: appBar(context, count),
        floatingActionButton: count == 0
            ? FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {},
                child: Icon(
                  Icons.messenger,
                  color: Colors.blue[800],
                ),
              )
            : null,
        backgroundColor: Colors.transparent,
        bottomNavigationBar: BottomNavigationBar(
            onTap: ((value) {
              setState(() {
                count = value;
              });
            }),
            currentIndex: count,
            backgroundColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.blue[700],
            unselectedItemColor: Colors.grey[400],
            selectedLabelStyle: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w600,
            ),
            unselectedLabelStyle: TextStyle(
              color: Colors.grey[400],
              fontWeight: FontWeight.w600,
              fontSize: 11,
            ),
            showSelectedLabels: true,
            showUnselectedLabels: true,
            selectedFontSize: 11,
            selectedIconTheme: const IconThemeData(
              opacity: 1,
              size: 20,
            ),
            unselectedIconTheme: const IconThemeData(
              opacity: 1.5,
              size: 20,
            ),
            items: const [
              BottomNavigationBarItem(
                label: 'Главная',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Купить',
                icon: Icon(Icons.shopping_cart),
              ),
              BottomNavigationBarItem(
                label: 'Мои полисы',
                icon: Icon(Icons.security_outlined),
              ),
              BottomNavigationBarItem(
                label: 'Кабинет',
                icon: Icon(Icons.person),
              )
            ]),
        body: contentList[count],
      ),
    );
  }

  AppBar? appBar(BuildContext context, int count) {
    switch (count) {
      case 0:
        {
          return AppBar(
            title: const Text('ИНГОССТРАХ'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          );
        }
      case 1:
        {
          return AppBar(
            title: const Text('ИНГОССТРАХ'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          );
        }
      case 2:
        {
          return AppBar(
            toolbarHeight: 40,
            title: const Text(
              'Мои полисы',
              style: TextStyle(fontSize: 16),
            ),
            centerTitle: true,
            actions: const [
              SizedBox(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: Icon(
                    Icons.search_outlined,
                    color: Color.fromARGB(133, 214, 214, 214),
                  ),
                ),
              )
            ],
            backgroundColor: Colors.transparent,
            elevation: 0,
          );
        }
      case 3:
        {
          return AppBar(
            actions: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Icon(Icons.edit),
              )
            ],
            leading: IconButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SingIn(),
                    ),
                    (route) => false);
              },
              icon: Icon(Icons.exit_to_app),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          );
        }
    }
    return null;
  }
}
