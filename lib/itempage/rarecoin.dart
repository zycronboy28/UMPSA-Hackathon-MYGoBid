import 'dart:io';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import '../main.dart';

class itemRareCoin extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<itemRareCoin> {
  int _quantity = 1;  // Initial quantity

  // Example item details
  final String _itemTitle = "Rare Coin";
  final int _totalBidders = 6;
  double _itemPrice = 75;
  final String _itemImage = "assets/rarecoin.png"; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          tooltip: "Menu",
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back on back button press
          },
        ),
        title: Text("Item Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.asset(
                _itemImage,
                height: 300,
                width: 300,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text(
              _itemTitle,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              "$_totalBidders are bidding for this item!",
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 16),
            Text(
              "Price: \$${_itemPrice.toStringAsFixed(2)}",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            // Buy button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  double total = _itemPrice + 20;
                  setState(() {
                    _itemPrice += 20; // Update the item price
                  });
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Placement Confirmation"),
                        content: Text("Placement successful! You are bidding for this item for \$${total.toStringAsFixed(2)}"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(),
                            child: Text("OK"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Join the bid! +\$20"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  textStyle: TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
