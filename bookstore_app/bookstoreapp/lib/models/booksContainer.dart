import 'package:flutter/material.dart';
import '../screens/editBooks.dart';
import 'ColorsConst.dart';

class booksContainer extends StatelessWidget {
  final int id;
  final String bookName;
  final String bookAuthor;
  final String bookGenre;
  final int bookAmount;
  final double bookPrice;
  final Function onPress;
  const booksContainer({super.key,
  required this.id,
  required this.bookName,
  required this.bookAuthor,
  required this.bookGenre,
  required this.bookAmount,
  required this.onPress,
  required this.bookPrice,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        
        width: double.infinity,
        height: 130,
        decoration: BoxDecoration(
         border: Border.all(color: Colors.black,
            width: 3),
          color:  navBarColor,
          
        ),
        child: Row(
          children: [
          
            Padding(
              padding: const EdgeInsets.only(left:20.0,),
              child: Container(
              height: 95,
              width: 75,
              decoration: BoxDecoration(
                color: brownTextColor,
                border: Border.all(color: Colors.black,
                width: 3),
              ),
                //  child: IconButton(
                //   icon: const Icon(Icons.done, 
                //   size: 15,
                //   ),
                //   onPressed: () {
                   
                //  },)
                 
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:0, left: 16, right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                       Text(bookName, style:  TextStyle(
                          color: Colors.black,
                         fontSize: 26,
                        ),
                        ),
                        IconButton(onPressed: (){
                           Navigator.push(
                            context,
                            MaterialPageRoute(
                             builder: (contex) =>  editBook(id: id, bookName: bookName)));
                        }, icon: Icon(Icons.edit,
                        size: 18,))
                       
                      ],
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16, vertical: 1),
                    child: 
                     Text(bookAuthor, style:  TextStyle(
                          color: brownTextColor,
                        fontSize: 18,
                        ),
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16, vertical: 1),
                    child:
                     Text(bookGenre, style:  TextStyle(
                        color: brownTextColor,
                        fontSize: 18,
                        ),
                        )
                      
                    
                  ),
                   Padding(
                    padding: const EdgeInsets.symmetric(horizontal:16, vertical: 1),
                    child:  
                     Text("$bookPrice dollar", style:  TextStyle(
                          color: brownTextColor,
                        fontSize: 18,
                        ),
                        )
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}