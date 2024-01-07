import 'package:flutter/material.dart';
import 'package:flutter_application_1/widgets/appbar.dart';
import 'package:flutter_application_1/widgets/transparent_curved_bottom_navbar.dart';


class BuySellPage extends StatefulWidget {
   @override
  _BuySellPageState createState() => _BuySellPageState();
}

class _BuySellPageState extends State<BuySellPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: CustomAppBar(
        title: 'Operations',
        leadingOnPressed: () {
          Navigator.pushReplacementNamed(context, '/home');
        },
        ),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('paths/background_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            color:
                Colors.black.withOpacity(0.3), // Adjust the opacity as desired
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'paths/logofinal.png',
                  width: 250.0,
                  height: 250.0,
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(97, 194, 100, 00),
                        Color(0xc9c26400)
                      ])), 
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(50.0, 55.0)),
                      elevation: MaterialStateProperty.all(0),
                      alignment: Alignment.center,
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(
                              right: 55,
                              left: 55,
                              top: 15,
                              bottom: 15)),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(25)),
                      )),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/operations');
                    },
                    child: Text(
                      'Buy',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 18.0),
                      ),
                  ),
                ),
                SizedBox(height: 16), 
                DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25.0),
                      gradient: const LinearGradient(colors: [
                        Color.fromARGB(97, 194, 100, 00),
                        Color(0xc9c26400)
                      ])),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                          Size(50.0, 55.0)),
                      elevation: MaterialStateProperty.all(0),
                      alignment: Alignment.center,
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.only(
                              right: 55,
                              left: 55,
                              top: 15,
                              bottom: 15)),
                      backgroundColor: MaterialStateProperty.all(
                          Colors.transparent),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(25)),
                      )),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/shoppingcart');
                    },
                    child: Text(
                      'Sell',
                      style: const TextStyle(
                          color: Colors.white, fontSize: 18.0),
                      ),
                  ),
                )// Add some spacing between the buttons
              
              ],
            ),
          ),
        ],
      ),

      
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1() , 
    );
  }
}