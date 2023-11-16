import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/ColorsConst.dart';

TextEditingController nameController= TextEditingController();
TextEditingController authorController= TextEditingController();
TextEditingController amountContoroller= TextEditingController();
TextEditingController priceController= TextEditingController();


String genre = 'Historical';
final genreList = [
    'Historical',
    'Mystery',
    'Horror',
    'Fantasy'
  ];

class editBook extends StatefulWidget {
  const editBook({required this.id, required this.bookName, super.key});
  final int id;
  final String bookName;
  @override
  State<editBook> createState() => _editBookState(id, bookName);
}

class _editBookState extends State<editBook> {
  final int id;
  final String bookName;
  _editBookState(this.id, this.bookName);
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
                    'Edit $bookName',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
               Expanded(
                flex: 12,
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
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                             Padding(
                                              padding:  const EdgeInsets.only(left:20, right: 20, top: 10),
                                              child: Text(
                                                'Book Name:',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                 fontSize: 20,
                                                 color: brownTextColor
                                               ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal:20),
                                              child: Container(
                                                height: 50,
                                               width: MediaQuery.of(context).size.width,
                          
                                               decoration: BoxDecoration(
                                                  color: textFieldLightColor,
                                                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                                               ),
                                                child: TextField(
                                               controller: nameController,
                                               decoration: InputDecoration(
                                                 contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                                  hintText: 'Add book name',
                                               border: InputBorder.none,
                                              hintStyle: TextStyle(
                                               color: textFieldFontColor
                                              ),   
                                               ),
                    
                                               ),
                                             ),
                                            ),
                       
                             Padding(
                               padding:  const EdgeInsets.symmetric(horizontal:20),
                               child: Text(
                                'Book Author:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: brownTextColor
                                ),
                                                       ),
                             ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                          
                                decoration: BoxDecoration(
                                   color: textFieldLightColor,
                                   borderRadius: const BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextField(
                                  controller: authorController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  hintText: 'Add book author',
                                border: InputBorder.none,
                               hintStyle: TextStyle(
                                color: textFieldFontColor
                               ),   
                                ),
                                
                                ),
                              ),
                            ),
                    
                        
                                    
                               Padding(
                                 padding:  const EdgeInsets.symmetric(horizontal:20),
                                 child: Text(
                                        "book's genre:",
                                       style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: brownTextColor
                                                           ),
                                                         ),
                               ),
                            Padding(
                                padding:const EdgeInsets.symmetric(vertical:10, horizontal: 20),
                                child: Expanded(
                                  flex: 2,
                                  child: Container(
                                    height: 50,
                                     width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                         color: textFieldLightColor,
                                         borderRadius: const BorderRadius.all(Radius.circular(20)),
                                      ),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric( vertical: 5),
                                      child:  DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          dropdownColor: textFieldLightColor,
                                            isExpanded: true,
                                              borderRadius: BorderRadius.circular(20),
                                              value: genre,
                                               icon: Icon(Icons.keyboard_arrow_down,size: 28,color: brownTextColor,),
                                              items: genreList.map((String item1) {
                                                return DropdownMenuItem(
                                                                   
                                                  value: item1,
                                                 child: Padding(
                                                   padding: const EdgeInsets.symmetric(horizontal:10),
                                                   child: Text(item1, style:  TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'HP Simplified Light', color: brownTextColor),),
                                                 ),
                                               );
                                              }).toList(),
                                              onChanged: (String? newValue) {
                                               setState(() {
                                                 genre = newValue!;
                                               });
                                             }),
                                      ),
                                      
                                    ),
                                  ),
                                ),
                              ),
                    
                    
                               Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                          
                                decoration: BoxDecoration(
                                   color: textFieldLightColor,
                                   borderRadius: const BorderRadius.all(Radius.circular(20)),
                                ),
                               child: Padding(
                                 padding: const EdgeInsets.symmetric(vertical:14, horizontal: 70),
                                 child: Text('Choose new image',
                                 style: TextStyle(
                                  color: brownTextColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                                 ),),
                               ),
                              ),
                            ),
                    
                    
                            Padding(
                              padding:  const EdgeInsets.symmetric(horizontal:20),
                              child: Text(
                                'Book Amount:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: brownTextColor
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                          
                                decoration: BoxDecoration(
                                   color: textFieldLightColor,
                                   borderRadius: const BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextField(
                                  inputFormatters: [FilteringTextInputFormatter.digitsOnly] ,
                                  controller: amountContoroller,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  hintText: 'Add book Amount',
                                border: InputBorder.none,
                               hintStyle: TextStyle(
                                color: textFieldFontColor
                               ),   
                                ),
                                
                                ),
                              ),
                            ),
                    
                           
                    
                              Padding(
                                padding:  const EdgeInsets.symmetric(horizontal:20),
                                child: Text(
                                'Price:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: brownTextColor
                                ),
                                                        ),
                              ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: Container(
                                height: 50,
                                width: MediaQuery.of(context).size.width,
                          
                                decoration: BoxDecoration(
                                   color: textFieldLightColor,
                                   borderRadius: const BorderRadius.all(Radius.circular(20)),
                                ),
                                child: TextField(
                                  inputFormatters: [
                                     FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
                               ],
                                  controller: priceController,
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                                  hintText: 'Add book Price',
                                border: InputBorder.none,
                               hintStyle: TextStyle(
                                color: textFieldFontColor
                               ),   
                                ),
                                
                                ),
                              ),
                            ),
                    
                    
                              
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                              child: InkWell(
                                child: Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                                      
                                  decoration: BoxDecoration(
                                     color: textFieldLightColor,
                                     borderRadius: const BorderRadius.all(Radius.circular(20)),
                                  ),
                                 child:  Center(
                                   child: Text('Submit changes',
                                     style: TextStyle(
                                      color: brownTextColor,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold
                                     ),),
                                 ),
                                 
                                ),
                                onTap: (){
                                  sendData(id);
                                },
                              ),
                            ),
                          
                        ]
                        ),
                    )
                      )
                      )
                      ),
                      Expanded(
                        flex: 1,
                        child: Padding(
                          padding: const EdgeInsets.only(top:16),
                          child: InkWell(
                            child: Text('Delete this book?',
                            style: TextStyle(color: brownTextColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 24),),
                            onTap: (){
                              delete_book(id, context);
                            },
                          ),
                        ))
            ]
          )
          )
       )
    );
  }
}

void sendData(int id)async{
  var url = Uri.parse( "http://192.168.1.107/dashboard/book%20store%20index/editBooks_Flutter.php");
  try {
     final response = await http.post(
        url,
        body:{
          'id': id.toString(),
           'bookName': nameController.text,
            'bookAuthor' : authorController.text,
            'bookGenre' :genre,
            'bookAmount' : amountContoroller.text.toString(),
            'bookPrice' : priceController.text.toString(),
        },);
       final responseData = json.decode(json.encode(response.body));
       print(responseData);
     
   }catch (e) {
     print('problem is $e');
   }
}

void delete_book(int id, context)async{
  var url = Uri.parse( "http://192.168.1.107/dashboard/book%20store%20index/DeleteBook_Flutter.php");
  try {
     final response = await http.post(
        url,
        body:{
          'id': id.toString(),
        },);
       final responseData = json.decode(json.encode(response.body));
       print(responseData);
      Navigator.pop(context);
   }catch (e) {
     print('problem is $e');
   }
}

