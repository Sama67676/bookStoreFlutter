import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../models/ColorsConst.dart';
import 'cart.dart';


TextEditingController nameController= TextEditingController();
TextEditingController authorController= TextEditingController();
TextEditingController amountContoroller= TextEditingController();
TextEditingController priceController= TextEditingController();

Map<String, dynamic?> errorsMap={'nameError':'', 'authorError': '', 'amountError': '', 'priceError': ''};

String genre = 'Historical';
final genreList = [
    'Historical',
    'Mystery',
    'Horror',
    'Fantasy'
  ];


class AddNewBook extends StatefulWidget {
  const AddNewBook({super.key});

  @override
  State<AddNewBook> createState() => _AddNewBookState();
}

class _AddNewBookState extends State<AddNewBook> {



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        resizeToAvoidBottomInset: true,
      appBar: AppBar(
        title: const Text('BookStore',
        style: TextStyle(fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.bold),),
        backgroundColor: navBarColor,
        actionsIconTheme: const IconThemeData(color: Colors.black),
        actions: [
        IconButton(onPressed: (){
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (contex) => const cart()));
        }, icon: const Icon(Icons.shopping_basket_outlined))
      ]),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/white_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: 
              Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                    Expanded(
                      flex: 9,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal:10, vertical: 10),
                        child: Card(
                              shape: const BeveledRectangleBorder( //<-- 2. SEE HERE
                               side: BorderSide(
                                 color: Colors.black,
                                 width: 2,
                               ),),
                                elevation: 0,
                                color: Colors.transparent,
                                child:Padding(
                                  padding: const EdgeInsets.symmetric(horizontal:0),
                                  child: SingleChildScrollView(
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
                                          child: const Padding(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              'Add New Book',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                         ),
                                       ),

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
                      padding:  const EdgeInsets.symmetric(horizontal:20, ),
                            child: Container(
                              height: 20,
                              child: Text(
                                  errorsMap['nameError'].toString(),
                                  style: TextStyle(color: Colors.red),
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
                              child: Container(
                              height: 20,
                              child: Text(
                                  errorsMap['authorError'].toString(),
                                  style: TextStyle(color: Colors.red),
                                ),
                                                      ),
                            ),


                                  
                             Padding(
                               padding:  const EdgeInsets.symmetric(horizontal:20),
                               child: Text(
                                      "Choose book's genre:",
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
                               padding: const EdgeInsets.symmetric(vertical:14, horizontal: 85),
                               child: Text('Choose an image',
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
                                   child: Container(
                                          height: 20,
                                         child: Text(
                                             errorsMap['amountError'].toString(),
                                             style: TextStyle(color: Colors.red),
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
                               padding:  const EdgeInsets.symmetric(horizontal:20),
                               child: Container(
                                  height: 20,
                                  child: Text(
                                  errorsMap['priceError'].toString(),
                                  style: TextStyle(color: Colors.red),
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
                                 child: Text('Submit',
                                   style: TextStyle(
                                    color: brownTextColor,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                   ),),
                               ),
                               
                              ),
                              onTap: (){
                                setState(() {
                                  checkErrors();
                                });
                                
                              },
                            ),
                          ),

                                    
                                      ],
                                    ),
                                  ),
                               )),
                      ),
                    )
              ],
        ),
         
          )
    );
  }
}


void checkErrors(){
  
  if (nameController.text.isEmpty) {
    errorsMap['nameError']="Please add book's name";
    print('error null name');
  } 
  if (authorController.text.isEmpty) {
    errorsMap['authorError']="Please add book's Author";
    print('error null author');
  }  
  
  if (amountContoroller.text.isEmpty) {
    errorsMap['amountError']="Please add book Amount";
    print('error null amount');
  }
  if (priceController.text.isEmpty) {
    errorsMap['priceError']="Please add book's price";
    print('error null price');
  }

  final mapValues = errorsMap.values.join("");
if (mapValues.isEmpty) {

  print("all inputs are accepted");
  sendData();
} else {
  print("all are not empty");
  
}
}

void sendData()async{
  var url = Uri.parse("http://192.168.1.107/dashboard/book%20store%20index/add_book_flutter.php");
  try {
     final response = await http.post(
        url,
      
        body:{
           'bookName': nameController.text,
            'bookAuthor' : authorController.text,
            'bookGenre' :genre,
            'bookAmount' : amountContoroller.text,
            'bookPrice' : priceController.text,
        },);
       final responseData = json.decode(json.encode(response.body));
       print(responseData);
     
   }catch (e) {
     print('problem is $e');
   }
}

