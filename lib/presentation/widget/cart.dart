import 'package:flutter/material.dart';
import 'package:starhovanie/presentation/widget/advertisement.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<ItemCart> listCart = <ItemCart>[
    ItemCart('Автосрахование', ['КАСКО', 'ОСАГО']),
    ItemCart('Путешествия', ['Путешествия']),
    ItemCart('Имущество', ['Квартира', 'Дом', 'Ипотека']),
    ItemCart('Здоровье (ДМС)', ['ДМС']),
  ];

  final ScrollController _scrollController = ScrollController();
  bool isScroll = false;

  @override
  void initState() {
    _scrollController.addListener(() {
      setState(() {
        if (_scrollController.position.pixels >= 10) {
          isScroll = true;
        } else {
          isScroll = false;
        }
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Advertisement(),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: isScroll
                  ? null
                  : const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
            ),
            child: SingleChildScrollView(
              controller: _scrollController,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: listCart.length,
                        itemBuilder: (context, index) {
                          return test(index);
                        })
                  ]),
            ),
          ),
        )
      ],
    );
  }

  Widget test(int count) {
    return ListView(
      shrinkWrap: true,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: count == 0
                ? const BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  )
                : null,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 3,
            ),
            child: Text(
              listCart[count].title,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
          ),
        ),
        ListView.builder(
            shrinkWrap: true,
            itemCount: listCart[count].content.length,
            itemBuilder: (context, index) {
              return ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.blue[400],
                ),
                title: Text(listCart[count].content[index]),
              );
            })
      ],
    );
  }
}

class ItemCart {
  final String title;
  final List<String> content;

  ItemCart(this.title, this.content);

  ItemCart.empty()
      : title = '',
        content = <String>[];
}
