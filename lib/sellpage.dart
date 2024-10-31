import 'package:flutter/material.dart';
import 'package:mygobid/profilepage.dart';
import 'loginpage.dart';
import 'home.dart';
import 'dart:io';

class SellItemPage extends StatefulWidget {
  @override
  _SellItemPageState createState() => _SellItemPageState();
}

class _SellItemPageState extends State<SellItemPage> {
  final _formKey = GlobalKey<FormState>();
  String? _itemName;
  String? _itemDetails;
  File? _image;

  void _submit() {
    if (_formKey.currentState!.validate()) {
      // Perform submission logic (e.g., send data to server)
      print('Name: $_itemName');
      print('Details: $_itemDetails');
      if (_image != null) {
        print('Image path: ${_image!.path}');
      }
      // Show a success message or navigate away
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item submitted successfully!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 20),
          Container(
            height: 30,
            child: Text(
              'Sell Your Item!',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  GestureDetector(
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: _image == null
                          ? Icon(Icons.camera_alt, color: Colors.grey)
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.file(
                                _image!,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  SizedBox(height: 16),
                  _buildRoundedTextField(
                    label: 'Item Name',
                    onChanged: (value) {
                      _itemName = value;
                    },
                  ),
                  SizedBox(height: 16),
                  _buildRoundedTextField(
                    label: 'Item Details',
                    maxLines: 15,
                    
                    onChanged: (value) {
                      _itemDetails = value;
                    },
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: _submit,
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRoundedTextField({
    required String label,
    int? maxLines,
    required ValueChanged<String> onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.blue, width: 1),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: TextFormField(
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $label';
          }
          return null;
        },
        onChanged: onChanged,
      ),
    );
  }
}
