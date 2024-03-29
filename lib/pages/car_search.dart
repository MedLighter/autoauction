import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_animated_icons/icons8.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';

class CarSearchScreen extends ConsumerStatefulWidget {
  const CarSearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => CarSearchScreenState();
}

class CarSearchScreenState extends ConsumerState<CarSearchScreen>
    with TickerProviderStateMixin {
  late AnimationController _filterController;

  @override
  void initState() {
    super.initState();

    _filterController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    super.dispose();
    _filterController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextPainter textPainter = TextPainter(
      text: TextSpan(text: "asdfas", style: TextStyle(fontSize: 20)),
      maxLines: 1,
      textDirection: TextDirection.ltr,
    )..layout();

    return Scaffold(
      appBar: AppBar(
        shape: const Border(bottom: BorderSide(width: 2, color: Colors.black)),
        title: Image.asset("assets/logo.png",
            width: MediaQuery.of(context).size.width / 3),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Container(
              width: MediaQuery.of(context).size.width / 7 * 6,
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 55,
                child: TextField(
                  onTapOutside: (PointerDownEvent event) {
                    FocusScope.of(context).unfocus();
                  },
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[200],
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Поиск',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0).copyWith(left: 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.0)),
                    color: Colors.grey[200]),
                height: 55,
                width: MediaQuery.of(context).size.width / 8.5,
                child: IconButton(
                  splashRadius: 50,
                  iconSize: 10,
                  onPressed: () {
                    _filterController.reset();
                    _filterController.forward();
                  },
                  icon: Lottie.asset(Icons8.adjust,
                      controller: _filterController),
                ),
              ),
            ),
          ]),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0).copyWith(left: 25),
                child: Text(
                  "История поиска",
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          Container(
            height: textPainter.height * 2.5,
            padding: const EdgeInsets.all(8.0).copyWith(left: 17),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  height: 10,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Skoda Rapid",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.grey[300],
                      // padding: const EdgeInsets.all(0),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
