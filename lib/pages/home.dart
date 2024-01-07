import 'package:flutter/material.dart';
import '../../widgets/transparent_curved_bottom_navbar.dart';
import 'package:intl/intl.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'statistics.dart';
import 'toast.dart';

class BankApp extends StatefulWidget {
  const BankApp({Key? key}) : super(key: key);

  @override
  State<BankApp> createState() => _BankAppState();
}

class _BankAppState extends State<BankApp> {
  // CalendarFormat _calendarFormat = CalendarFormat.month;
  // DateTime _focusedDay = DateTime.now();
  // DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image:
                AssetImage('paths/back2.png'), // Replace with your image path
            fit: BoxFit.cover, // Adjust the fit as needed
          ),
        ),
        child: Scaffold(
          backgroundColor: const Color.fromARGB(0, 255, 255,
              255), // Set Scaffold's background color as transparent
          body: SafeArea(
            child: Column(
              children: [
                SizedBox(
                  height: 40,
                ),
                _top(),
                SizedBox(
                  height: 310,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    scrollDirection: Axis.horizontal,
                    children: [
                      _card(
                        id: '*********** 34567',
                        balance: '\$600',
                        color: Color.fromARGB(255, 25, 62, 17),
                        image: 'paths/logofinal.png',
                        isBigImage: true,
                      ),
                      _card(
                        id: '*********** 20999',
                        balance: '\$60',
                        color: Color.fromARGB(255, 30, 60, 48),
                        image: 'paths/logofinal.png',
                        isBigImage: true,
                      ),
                    ],
                  ),
                ),
                // const SizedBox(height: 30),
                // TableCalendar(
                //   firstDay: DateTime.utc(2010, 10, 16),
                //   lastDay: DateTime.utc(2030, 3, 14),
                //   focusedDay: _focusedDay,
                //   calendarFormat: _calendarFormat,
                //   selectedDayPredicate: (day) {
                //     // Use _selectedDay here to mark the selected day
                //     return isSameDay(_selectedDay, day);
                //   },
                //   onDaySelected: (selectedDay, focusedDay) {
                //     setState(() {
                //       _selectedDay = selectedDay;
                //       _focusedDay = focusedDay;
                //     });
                //     // Implement action when a day is selected
                //   },
                //   onPageChanged: (focusedDay) {
                //     _focusedDay = focusedDay;
                //     // Implement action when page changes
                //   },
                // ),
                const SizedBox(height: 30),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Transaction',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _transactions(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: TransparentBtmNavBarCurvedFb1(),
    );
  }

  Widget _transactions() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Container(
          decoration: BoxDecoration(
            color:
                Colors.white.withOpacity(1), // Adjust opacity here (0.0 - 1.0)
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListView(
            children: [
              _itemTransactions(
                onTap: () {},
                iconPath: 'paths/client1.png',
                desc: 'Mohamed Ben Ticha',
                date: '24 feb',
                total: '\$445.000',
                color: Colors.blue,
              ),
              _itemTransactions(
                onTap: () {},
                iconPath: 'paths/client1.png',
                desc: 'Ahmed Ben Taleb Ali',
                date: '27 feb',
                total: '\$45.000',
                color: Colors.orange,
              ),
              _itemTransactions(
                onTap: () {},
                iconPath: 'paths/client1.png',
                desc: 'Zeineb Gahbiche',
                date: '24 Jan',
                total: '\$45.000',
                color: Colors.deepOrange,
              ),
              _itemTransactions(
                onTap: () {},
                iconPath: 'paths/client1.png',
                desc: 'Aziz Boussarsar',
                date: '24 Jan',
                total: '\$45.000',
                color: Colors.deepOrange,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _itemTransactions({
    required VoidCallback onTap,
    required String iconPath, // New parameter for image path
    required Color color,
    required String desc,
    required String total,
    required String date,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () => onTap(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: const EdgeInsets.only(right: 18),
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.asset(iconPath, width: 40, height: 40),
            ),
            Expanded(
              flex: 1,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    desc,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  total,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _card({
    required String id,
    required Color color,
    required String balance,
    required String image,
    required bool isBigImage, // New parameter to determine image size
  }) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: MediaQuery.of(context).size.width - 40,
          margin: const EdgeInsets.only(top: 100, left: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(38),
          ),
          child: Stack(
            children: [
              _cardBackground(size: 40, pTop: 90, pLeft: 300),
              _cardBackground(size: 140, pBottom: -50),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _masterCardLogo(),
                        Text(
                          id,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Mastercard',
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              balance,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                            )
                          ],
                        ),
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(Icons.add, size: 32),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: isBigImage ? -70 : -20, // Adjust the positioning of the image
          child: Image.asset(
            image,
            width:
                isBigImage ? 200 : 220, // Adjust the width for a larger image
            height:
                isBigImage ? 300 : 220, // Adjust the height for a larger image
          ),
        ),
      ],
    );
  }

  Widget _masterCardLogo() {
    return SizedBox(
      width: 100,
      child: Stack(
        children: [
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: Colors.white70,
              borderRadius: BorderRadius.circular(24),
            ),
          ),
          Positioned(
            left: 20,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: Colors.white70,
                borderRadius: BorderRadius.circular(24),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardBackground({
    double size = 40,
    double? pTop,
    double? pBottom,
    double? pLeft,
    double? pRight,
  }) {
    return Positioned(
      left: pLeft,
      top: pTop,
      bottom: pBottom,
      right: pRight,
      child: Transform.rotate(
        angle: 1,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white10,
            borderRadius: BorderRadius.circular(size / 6),
          ),
          width: size,
          height: size,
        ),
      ),
    );
  }

  Widget _top() {
    DateFormat dateFormat = DateFormat.yMMMd();
    String formattedDate = dateFormat.format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Welcome Back',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'BebasNeue', // Use the correct font family name declared in pubspec.yaml
                      color: Color.fromARGB(255, 243, 192,
                          155), // Replace with your desired color
                    ),
                  ),
                  Text(
                    formattedDate,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      fontFamily:
                          'BebasNeue', // Use the correct font family name declared in pubspec.yaml
                      color: Color.fromARGB(
                          255, 196, 132, 47), // Replace with your desired color
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => const Statistics(),
                    ),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 199, 174),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.chartBar,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
              height:
                  5), // Adding space between the statistics icon and the logout icon
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushNamed(context, "/login");
                  showToast(message: "Successfully signed out");
                },
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 247, 199, 174),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: FaIcon(
                    FontAwesomeIcons.signOutAlt,
                    size: 25,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
