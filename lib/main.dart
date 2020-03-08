import 'package:flutter/material.dart';
import 'package:giftcard/giftcard_page.dart';
import 'package:giftcard/giftcardprovider.dart';
import 'package:provider/provider.dart';

void main() { 
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<GiftCard>(
          create: (context) => GiftCard(),
        )
      ],
      
      child: MyApp())
    );
    }

class MyApp extends StatelessWidget {
 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
     
      theme: ThemeData(
        
        
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var gift = Provider.of<GiftCard>(context);
    int totalCount = 0;
    if(gift.cart.length > 0){
      totalCount = gift.cart.values.reduce((a, b) => a+b);
    }
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple,
        title: Text('Gift Cards', style: TextStyle(color:Colors.white),),
        actions: <Widget>[
          Padding(
            padding:
            EdgeInsets.all(10.0) ,
            child: Container(
              height: 150,
              width: 30,
              child: GestureDetector(
                onTap: (){
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GiftPage(),
                      ),
                    );
                },
                child: Stack(
                  children: <Widget>[
                    IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), 
                    onPressed: null),
                    Positioned(
                      child: Stack(
                        children: <Widget>[
                          Icon(Icons.brightness_1,size: 20.0,
                          color: Colors.red[700],
                          ),
                          Positioned(
                            top: 3.0,
                            right: 7,
                            child: Center(
                              child:Text('$totalCount',style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w500
                              ),)
                            ))
                        ],
                      )
                      )
                  ],
                ),
              ),
            ),
            )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(6, (index) {
            return GestureDetector(
              onTap: (){
                gift.addToCart(index);
              },
              child: Container(
                padding: EdgeInsets.all(16),
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/${index +1}.jpg'),
                    fit: BoxFit.cover
                    ),
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}