import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:starhovanie/presentation/widget/advertisement.dart';
import 'package:starhovanie/presentation/widget/home_list_item.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Advertisement(),
        Expanded(
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: SingleChildScrollView(
              child: Column(children: [
                HomeListItem(
                  buttonText: 'Добавить полис',
                  searchText: 'полис',
                  title: 'Мои полисы',
                  icon: Icons.security,
                ),
                HomeListItem(
                  buttonText: 'Добавить страховой случай',
                  searchText: 'страховой случай',
                  title: 'Страховые случаи',
                  icon: Icons.error,
                ),
                HomeListItem(
                  buttonText: 'Добавить платеж',
                  searchText: 'платеж',
                  title: 'Платеж',
                  icon: Icons.currency_ruble_sharp,
                ),
                HomeListItem(
                  buttonText: 'Добавить полис для оформления',
                  searchText: 'полис',
                  title: 'Полисы в оформлении',
                  icon: Icons.camera_alt,
                ),
                HomeListItem(
                  buttonText: 'Добавить ДМС',
                  searchText: 'ДМС',
                  title: 'Здоровье (ДМС)',
                  icon: Icons.health_and_safety,
                ),
              ]),
            ),
          ),
        )
      ],
    );
  }
}
