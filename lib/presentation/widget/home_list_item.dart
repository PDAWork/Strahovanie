import 'package:flutter/material.dart';

class HomeListItem extends StatefulWidget {
  HomeListItem({
    Key? key,
    required String this.title,
    required IconData this.icon,
    required this.searchText,
    required this.buttonText,
  }) : super(key: key);

  final String title;
  final String searchText;
  final String buttonText;
  final IconData icon;

  @override
  State<HomeListItem> createState() => _HomeListItemState();
}

class _HomeListItemState extends State<HomeListItem>
    with TickerProviderStateMixin {
  bool visibility = false;

  AnimationController? _controller;
  Animation<double>? _animation;

  double lowerBount = 0.5;
  double upperBound = 1.0;
  double value = 0.0;

  double height = 0.0;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
      value: value,
      lowerBound: lowerBount,
      upperBound: upperBound,
    );
    _animation = CurvedAnimation(parent: _controller!, curve: Curves.linear);

    super.initState();
  }

  @override
  dispose() {
    _controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () {
          setState(() {
            visibility ? _controller!.reverse() : _controller!.forward();
            visibility ? height = 0 : height = 85;
            visibility = !visibility;
          });
        },
        child: SizedBox(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Row(
                  children: [
                    Icon(
                      widget.icon,
                      color: Colors.grey[400],
                    ),
                    SizedBox(width: 20),
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 10),
                    RotationTransition(
                        alignment: Alignment(0.1, 0.1),
                        turns: _animation!,
                        child: Icon(Icons.arrow_drop_down)),
                  ],
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: height,
                width: double.infinity,
                color: Colors.grey[200],
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                          child: Text('Не нашли свой ${widget.searchText} ?')),
                      Flexible(
                        child: Container(height: 10),
                      ),
                      Flexible(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Text(widget.buttonText),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.transparent),
                            elevation: MaterialStateProperty.all(0),
                            padding: MaterialStateProperty.all(EdgeInsets.zero),
                            foregroundColor:
                                MaterialStateProperty.all(Colors.blue[300]),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
