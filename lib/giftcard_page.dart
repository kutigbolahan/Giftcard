import 'package:flutter/material.dart';
import 'package:giftcard/giftcardprovider.dart';
import 'package:provider/provider.dart';

class GiftPage extends StatefulWidget {
  GiftPage({Key key}) : super(key: key);

  @override
  _GiftPageState createState() => _GiftPageState();
}

class _GiftPageState extends State<GiftPage> {
  @override
  Widget build(BuildContext context) {
    var gift = Provider.of<GiftCard>(context);
    var cart = gift.cart;
    return Scaffold(
     appBar: AppBar(
       elevation: 0,
       title:  Text('Gift Shopping', style: TextStyle(color:Colors.black),),
     ),
     body: ListView.builder(
       itemCount: cart.length,
       itemBuilder: (context, index){
         int giftIndex= cart.keys.toList()[index];
         int count = cart[giftIndex];
         return ListTile(
           leading: Container(
             height: 70,
             width: 70,
             decoration: BoxDecoration(
               image:DecorationImage(
                 image: AssetImage('assets/images/${giftIndex+1}.jpg'),
                 fit: BoxFit.fitWidth,
                 ),
                  borderRadius: BorderRadius.circular(12),
             ),
             
           ),
           title: Text('ItemCont: $count'),
           trailing: RaisedButton(
             child: Text('Clear'),
             color: Theme.of(context).buttonColor,
             elevation: 1.0,
             splashColor: Colors.blueGrey,
             onPressed: (){
               gift.clear(giftIndex);
             }),
         );
       }
       ),
    );
  }
}