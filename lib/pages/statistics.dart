import 'package:carousel_slider/carousel_slider.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Statistics extends StatefulWidget {
  const Statistics({Key? key}) : super(key: key);

  @override
  State<Statistics> createState() => _StatisticsState();
}

class _StatisticsState extends State<Statistics> {
  late List<ChartData> data;

  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    data = [
      ChartData(
        income: 2500,
        expenses: 1450,
        chartData: [
          FlSpot(1, 3),
          FlSpot(2, 1),
          FlSpot(3, 5),
          FlSpot(4, 2),
          FlSpot(5, 5),
          FlSpot(6, 6),
          FlSpot(7, 9),
        ],
      ),
      ChartData(
        income: 1800,
        expenses: 900,
        chartData: [
          FlSpot(1, 2),
          FlSpot(2, 3),
          FlSpot(3, 4),
          FlSpot(4, 3),
          FlSpot(5, 2),
          FlSpot(6, 3),
          FlSpot(7, 4),
        ],
      ),
      ChartData(
        income: 3000,
        expenses: 2000,
        chartData: [
          FlSpot(1, 4),
          FlSpot(2, 5),
          FlSpot(3, 6),
          FlSpot(4, 7),
          FlSpot(5, 6),
          FlSpot(6, 5),
          FlSpot(7, 4),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, 
      appBar: AppBar(
          toolbarHeight: 30,
          backgroundColor: Colors.transparent, // Couleur transparente
          elevation: 0, // Supprimer l'ombre de l'AppBar
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Color(0xffffffff),
            ),
            onPressed: () {
              Navigator.pop(context); // Action de retour
            },
          ),
        ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(
                  97, 194, 100, 00), // Your existing dark green color
              Color.fromARGB(0, 71, 3, 80), // A slightly lighter shade of green
            ],
          ),
        ),
        child: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 20),
              _menu(),
              const SizedBox(height: 20),
              _total(),
              const SizedBox(height: 20),
              _chart(),
              const SizedBox(height: 20),
              _statistic(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _statistic() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Statistics',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              RotatedBox(
                quarterTurns: 3,
                child: Icon(
                  Icons.tune,
                  color: Colors.white54,
                  size: 32,
                ),
              )
            ],
          ),
          Container(
            margin: const EdgeInsets.only(top: 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: const Color.fromARGB(255, 185, 170, 147),
            ),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.all(24),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.black12,
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.black12,
                    ),
                    child: const Center(
                      child: Text(
                        '55%',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Average Spend',
                      style: TextStyle(color: Colors.white54),
                    ),
                    const Text(
                      '4,100 TND',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white54,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: const [
                        Icon(
                          Icons.file_open,
                          color: Colors.white,
                          size: 18,
                        ),
                        SizedBox(width: 10),
                        Text(
                          'Report',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _chart() {
    return SizedBox(
      height: 240,
      child: LineChart(
        LineChartData(
          lineTouchData: LineTouchData(enabled: false),
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 32,
                getTitlesWidget: _bottomTitleWidgets,
              ),
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: data[_currentIndex].chartData,
              isCurved: true,
              curveSmoothness: 0.4,
              color: Color.fromARGB(255, 209, 142, 94),
              barWidth: 6,
              isStrokeCapRound: true,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(show: false),
            )
          ],
          minX: 0,
          maxX: 8,
          maxY: 10,
          minY: 0,
        ),
      ),
    );
  }

  Widget _bottomTitleWidgets(double value, TitleMeta meta) {
    const style =
        TextStyle(color: Color.fromARGB(255, 23, 69, 2), fontSize: 14);
    late Widget text;

    if (value == 1) {
      text = Text('Mon', style: style);
    } else if (value == 2) {
      text = Text('Tue', style: style);
    } else if (value == 3) {
      text = Text('Wed', style: style);
    } else if (value == 4) {
      text = Text('Thu', style: style);
    } else if (value == 5) {
      text = Text('Fri', style: style);
    } else if (value == 6) {
      text = Text('Sat', style: style);
    } else if (value == 7) {
      text = Text('Sun', style: style);
    } else {
      text = const Text('');
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }

  Widget _total() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 38),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Total Income',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Column(
                children: [
                  Text(
                    '${data[_currentIndex].income.toStringAsFixed(0) } TND',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            height: 40,
            child: VerticalDivider(color: Colors.white38),
          ),
          Column(
            children: [
              Text(
                'Expenses',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                '${data[_currentIndex].expenses.toStringAsFixed(0)} TND',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _menu() {
    return CarouselSlider(
      items: [
        _itemMenu(
          index: 0,
          color: Color.fromARGB(255, 6, 57, 5),
          icon: Icons.fastfood,
        ),
        _itemMenu(
          index: 1,
          color: Color.fromARGB(255, 6, 57, 5),
          icon: Icons.local_laundry_service,
        ),
        _itemMenu(
          index: 2,
          color: Color.fromARGB(255, 6, 57, 5),
          icon: Icons.tablet_mac,
        ),
      ],
      options: CarouselOptions(
        autoPlay: false,
        height: 100,
        enlargeCenterPage: true,
        viewportFraction: 0.3,
        initialPage: _currentIndex,
        onPageChanged: (i, reason) {
          setState(() {
            _currentIndex = i;
          });
        },
      ),
    );
  }

  Widget _itemMenu({
    required int index,
    required Color color,
    required IconData icon,
  }) {
    Color bgColor = index == _currentIndex ? color : Colors.transparent;
    return Container(
      width: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white54,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: bgColor,
        ),
        child: Icon(
          icon,
          color: bgColor == color ? Colors.white : color,
          size: 28,
        ),
      ),
    );
  }
}

class ChartData {
  final double income;
  final double expenses;
  final List<FlSpot> chartData;

  ChartData({
    required this.income,
    required this.expenses,
    required this.chartData,
  });
}
