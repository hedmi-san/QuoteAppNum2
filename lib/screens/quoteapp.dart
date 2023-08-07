import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class QuotesOnePage extends StatefulWidget {
  const QuotesOnePage({super.key});

  @override
  State<QuotesOnePage> createState() => _QuotesOnePageState();
}

class _QuotesOnePageState extends State<QuotesOnePage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Color?> coloranimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 7),
    );
    coloranimation = ColorTween(begin: Colors.black, end: Colors.cyanAccent)
        .animate(animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          animationController.forward();
        } else if (status == AnimationStatus.completed) {
          animationController.reverse();
        }
      });
    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  final List<Map> QuoteList = [
    {
      'quote':
          'Anyone who has \nnever made a \nmistake has never tried \nanything new',
      'author': 'Albert einstein'
    },
    {
      'quote':
          'The good physician \ntreats the disease the \ngreat physician treats \nthe patient who \nhas the disease',
      'author': 'William Osler'
    },
    {
      'quote':
          'Wherever the art \nof Medicine is loved,\nthere is also a \nlove of Humanity',
      'author': 'Hippocrates'
    },
    {
      'quote':
          'A physician without \na knowledge of Astrology \nhas no right to call \nhimself a physician',
      'author': 'William J. Mayo'
    },
  ];
  int i = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Icon(
                FontAwesomeIcons.quoteLeft,
                size: 30.0,
                color: Colors.grey,
              ),
            ),
            Text(
              QuoteList[i]['quote'].toString(),
              style: TextStyle(
                fontSize: 40.0,
                color: coloranimation.value ?? Colors.black,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              QuoteList[i]['author'].toString(),
              style: TextStyle(
                color: Colors.grey,
                fontSize: 18.0,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: () {
                  i++;
                  setState(() {});
                  if (i == QuoteList.length) {
                    i = 0;
                    setState(() {});
                  }
                },
                child: Text(
                  'tap for more',
                  style: TextStyle(fontSize: 15),
                ),
              ),
            ),
            IconButton(onPressed: () {}, icon: Icon(Icons.bookmark)),
            IconButton(onPressed: () {}, icon: Icon(Icons.ios_share)),
            SizedBox(
              width: 20,
            )
          ],
        ),
      ),
    );
  }
}
