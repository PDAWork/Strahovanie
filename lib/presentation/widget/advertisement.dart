import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class Advertisement extends StatefulWidget {
  Advertisement({
    Key? key,
  }) : super(key: key);

  @override
  State<Advertisement> createState() => _AdvertisementState();
}

class _AdvertisementState extends State<Advertisement> {
  int _currentIndex = 0;

  final List<AdvertisementItem> _list = <AdvertisementItem>[
    AdvertisementItem(
      'Дорогие клиенты',
      'Мы продолжаем выполнять свои обязательства. Нажмите и узнайте больше',
      17,
    ),
    AdvertisementItem(
      'Сервис без посещения офиса',
      'Онлайн урегулирование по ОСАГО, КАСКО и имущества',
      18,
    ),
    AdvertisementItem(
      'Страхование картиры',
      'При онлайн оформлении полиса выплатим компенсацию до 50 000 ₽ без справок',
      17,
    ),
    AdvertisementItem(
      'Авантаж Квартира',
      'Удобно копить, когда имущество под защитой',
      20,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 120,
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: _list.length,
            itemBuilder:
                (BuildContext context, int itemIndex, int pageViewIndex) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 120,
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(30, 0, 0, 0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            _list[itemIndex].title,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Flexible(
                            child: Text(
                              _list[itemIndex].content,
                              style: TextStyle(
                                fontSize: _list[itemIndex].size,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
            options: CarouselOptions(
              onPageChanged: (index, reason) {
                setState(
                  () {
                    _currentIndex = index;
                  },
                );
              },
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 3),
              enlargeCenterPage: true,
              initialPage: 0,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: _list.map((urlOfItem) {
            int index = _list.indexOf(urlOfItem);
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 25.0,
              height: 7.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: _currentIndex == index
                    ? Color.fromRGBO(0, 0, 0, 0.8)
                    : Color.fromRGBO(0, 0, 0, 0.3),
              ),
            );
          }).toList(),
        )
      ],
    );
  }
}

class AdvertisementItem {
  final String title;
  final String content;
  final double size; // Костыль

  AdvertisementItem(this.title, this.content, this.size);
}
