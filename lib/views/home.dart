import 'package:flutter/material.dart';
import 'package:golf_app/helpers/dbhelper.dart';
import 'package:golf_app/models/golf.dart';
import 'package:golf_app/views/book_list.dart';
import 'package:golf_app/views/product.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(10),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              SizedBox(height: 25),
              Text(
                'Welcome to Our App🏌️⛳️',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors
                          .black,
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset(
                    'assets/img/home.png',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                '"Elevate Your Game with Every Swing"',
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => BookList()),
                  );
                },
                child: Text(
                  'Manage Booking',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff00AA13),
                  padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  side: BorderSide(color: Colors.black, width: 2.0),
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(5),
                  ),
                ),
              ),
              SizedBox(height: 25),
              Text(
                '⬆️ Book Now ⬆️',
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
