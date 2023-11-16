import 'package:flutter/material.dart';

import '../models/ColorsConst.dart';

class cart extends StatefulWidget {
  const cart({super.key});

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: Text('BookStore',
        style: TextStyle(fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.bold),),
        backgroundColor: navBarColor,
        actionsIconTheme: IconThemeData(color: Colors.black),
       ),
       body:  Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/white_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: navBarColor,
                 
                    border: Border.all(color: Colors.black, width:2)
                ),
                height: 50,
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    'Cart',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
               Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(color: Colors.black, width:2),
                        left: BorderSide(color: Colors.black, width:2),
                        right: BorderSide(color: Colors.black, width:2),
                        ),
                  ),
                  height: 50,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Text('Cart is empty',
                            style: TextStyle(
                              color: brownTextColor,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),),
                          ),
                        
                      ]
                      )
                      )
                      )
                      ),
            ]
          )
          )
       )
    );
  }
}