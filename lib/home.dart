import 'package:flutter/material.dart';
import 'package:mygobid/appstate.dart';
import 'loginpage.dart';
import 'mainpage.dart';
import 'appstate.dart';

//product page import
import 'itempage/vase.dart';
import 'itempage/rarecoin.dart';
import 'itempage/painting.dart';
import 'itempage/vintagewatch.dart';
import 'itempage/classiccarmodel.dart';


class HomeContainer extends StatelessWidget {
  final double height = 150;
  final double width = 75;
  final String title;
  final double price;

  const HomeContainer({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: const Color.fromARGB(255, 1, 114, 179),
      ),
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              '\$${price.toStringAsFixed(2)}',
              style: const TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});

  final List<Map<String, dynamic>> hotAuctions = [
    {'title': 'Antique Vase', 'price': 120.0, 'page': itemVase() },
    {'title': 'Rare Coin', 'price': 75.0, 'page': itemRareCoin() },
    {'title': 'Painting', 'price': 250.0, 'page': itemPainting()},
    {'title': 'Vintage Watch', 'price': 320.0, 'page': itemVintageWatch() },
    {'title': 'Classic Car Model', 'price': 150.0, 'page':itemCarModel() },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: <Widget>[
          // User info container
          Container(
            margin: const EdgeInsets.all(8),
            height: 100,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 0, 162, 255),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Row(
              children: <Widget>[
                CircleAvatar(
                  radius: 70,
                  backgroundImage: AssetImage('assets/idlan.jpg'),
                ),
                const SizedBox(width: 10),
                RichText(
                  text: TextSpan(
                    text: 'Hello, $username',
                    style: const TextStyle(color: Colors.black, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),

          // Section title
          const SizedBox(
            child: Center(
              child: Text(
                "Hot Auctions Right Now",
                style: TextStyle(color: Colors.black, fontSize: 30),
              ),
            ),
          ),
          ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 8),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: hotAuctions.length,
            itemBuilder: (context, index) {
              final item = hotAuctions[index];
              return InkWell(
                onTap: () {
                  // Navigate to the specific page for the selected item
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => item['page']),
                  );
                },
                child: HomeContainer(
                  title: item['title'] as String,
                  price: item['price'] as double,
                ),
              );
            },
          ),

          ElevatedButton(
            child: Text('Buy Now!'),
            onPressed: () {
              AppState().selectedIndex = 2;

              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
