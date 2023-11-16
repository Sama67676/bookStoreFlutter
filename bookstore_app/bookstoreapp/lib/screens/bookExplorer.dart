import 'dart:convert';

import 'package:bookstoreapp/models/booksContainer.dart';
import 'package:bookstoreapp/screens/cart.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/Books.dart';
import '../models/ColorsConst.dart';
List<Books> mybooks= [];
 bool isloading= false;
class bookexplorer extends StatefulWidget {
  const bookexplorer({super.key});

  @override
  State<bookexplorer> createState() => _bookexplorerState();
}

class _bookexplorerState extends State<bookexplorer> {
  @override
  void initState() {
  
   fetchData();
    super.initState();
  }
  
Future<void> fetchData()async{
  mybooks.clear();
  try {
    http.Response response= await http.get(url);
    var data= response.body.toString();
    var finaldata =await json.decode(data);
    print(finaldata.runtimeType);
 
    finaldata.forEach((Element){
      print(Element);
      Books t=Books(
       id: int.parse(Element['id']),
       bookName: Element['Name'].toString(),
       bookAuthor: Element['Author'].toString(),
       bookGenre: Element['genre'].toString(),
       bookAmount: int.parse(Element['amount']),
       bookPrice: double.parse(Element['price']),
       );

       print(t);
       mybooks.add(t);
    });
     setState(() {
     isloading= false;
   });
  
  } catch (e) {
    print('Error is $e');
  }
  
  print(mybooks);
}
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
        actions: [
        IconButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contex) => const cart()));
        }, icon: Icon(Icons.shopping_basket_outlined))
      ]),
       body:  isloading?
      Center(
        child: Container(
          height: 80,
          width: 80,
          child:  CircularProgressIndicator(
            color: navBarColor,
          )),
      ): Container(
  
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/white_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child:  ListView(
                 children:  mybooks.map((e) {
                    return booksContainer(
                     id: e.id, 
                     bookName: e.bookName,
                      bookAuthor: e.bookAuthor,
                       bookGenre: e.bookGenre, 
                       bookAmount: e.bookAmount,
                       bookPrice: e.bookPrice,
                      //  onPress :() => delete_ToDo(e.id.toString()),
                      onPress: (){
                        
                      },
                       );
          }).toList()
        
      ),
          
          )
       )
    );
  }
}

