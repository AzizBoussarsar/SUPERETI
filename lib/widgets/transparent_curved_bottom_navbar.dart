import 'package:flutter/material.dart';

// No state included
class TransparentBtmNavBarCurvedFb1 extends StatefulWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final Color backgroundColor;

  TransparentBtmNavBarCurvedFb1(
      {this.primaryColor = const Color.fromARGB(255, 19, 71, 21),
      this.secondaryColor = Colors.white,
      Key? key})
      : backgroundColor = Colors.black.withOpacity(.5),
        super(
          key: key,
        );

  @override
  _TransparentBtmNavBarCurvedFb1State createState() => _TransparentBtmNavBarCurvedFb1State();
}

class _TransparentBtmNavBarCurvedFb1State extends State<TransparentBtmNavBarCurvedFb1> {
  //- - - - - - - - - instructions - - - - - - - - - - - - - - - - - -
  
  // WARNING! MUST ADD extendBody: true; TO CONTAINING SCAFFOLD
  //
  // Instructions:
  //
  // add this widget to the bottomNavigationBar property of a Scaffold, along with
  // setting the extendBody parameter to true i.e:
  //
  // Scaffold(
  //  extendBody: true,
  //  bottomNavigationBar: BottomNavBarCurvedFb1()
  // )
  //
  // Properties such as color and height can be set by changing the properties at the top of the build method
  //
  // For help implementing this in a real app, watch https://www.youtube.com/watch?v=C0_3w0kd0nc. The style is different, but connecting it to navigation is the same.
  //
  //- - - - - - - - - - - - - - -  - - - - - - - - - - - - - - - - - -

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 58;

    final primaryColor = widget.primaryColor;
    final secondaryColor = widget.secondaryColor;
    final backgroundColor = widget.backgroundColor;

    return Container(
      width: size.width, // Set the width of the container to match the screen width
      child: Stack(
        children: [
          CustomPaint(
            size: Size(size.width, height + 6),
            painter: BottomNavCurvePainter(backgroundColor: backgroundColor),
          ),
          Center(
            heightFactor: 0.6,
            child: ClipOval(
              child: FloatingActionButton(
                backgroundColor: primaryColor,
                child: Icon(
                  Icons.attach_money_outlined,
                  color: Colors.white,
                ),
                elevation: 0.1,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/buysell');
                },
              ),
            ),
          ),
          SizedBox(
            height: height,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NavBarIcon(
                  text: "Home",
                  icon: Icons.home_outlined,
                  selected: true,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/home');
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Inventory",
                  icon: Icons.inventory_outlined,
                  selected: false,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/inventory');
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                const SizedBox(width: 56),
                NavBarIcon(
                  text: "Clients",
                  icon: Icons.person_outlined,
                  selected: false,
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/clients');
                  },
                  defaultColor: secondaryColor,
                  selectedColor: primaryColor,
                ),
                NavBarIcon(
                  text: "Suppliers",
                  icon: Icons.local_shipping_outlined,
                  selected: false,
                  onPressed: () {},
                  selectedColor: primaryColor,
                  defaultColor: secondaryColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BottomNavCurvePainter extends CustomPainter {
  BottomNavCurvePainter(
      {this.backgroundColor = Colors.white, this.insetRadius = 38});

  Color backgroundColor;
  double insetRadius;
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 12);

    double insetCurveBeginnningX = size.width / 2 - insetRadius;
    double insetCurveEndX = size.width / 2 + insetRadius;
    double transitionToInsetCurveWidth = size.width * .05;
    path.quadraticBezierTo(size.width * 0.20, 0,
        insetCurveBeginnningX - transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(
        insetCurveBeginnningX, 0, insetCurveBeginnningX, insetRadius / 2);

    path.arcToPoint(Offset(insetCurveEndX, insetRadius / 2),
        radius: Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(
        insetCurveEndX, 0, insetCurveEndX + transitionToInsetCurveWidth, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 12);
    path.lineTo(size.width, size.height + 56);
    path.lineTo(
        0,
        size.height +
            56); //+56 here extends the navbar below app bar to include extra space on some screens (iphone 11)
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class NavBarIcon extends StatelessWidget {
  const NavBarIcon(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed,
      this.selectedColor = const Color(0xffFF8527),
      this.defaultColor = Colors.black54})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final Color defaultColor;
  final Color selectedColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? selectedColor : defaultColor,
          ),
        ),
      ],
    );
  }
}