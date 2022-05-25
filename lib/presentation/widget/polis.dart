import 'package:flutter/material.dart';

class Polis extends StatefulWidget {
  const Polis({Key? key}) : super(key: key);

  @override
  State<Polis> createState() => _PolisState();
}

class _PolisState extends State<Polis> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: SingleChildScrollView(
        child: Column(children: [
          Container(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Не нашли свой полис ?'),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Добавить полис'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.blue[300]),
                    ),
                  ),
                  SizedBox(height: 25),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('Архив полисов'),
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.transparent),
                      elevation: MaterialStateProperty.all(0),
                      padding: MaterialStateProperty.all(EdgeInsets.zero),
                      foregroundColor:
                          MaterialStateProperty.all(Colors.blue[300]),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
    ;
  }
}
