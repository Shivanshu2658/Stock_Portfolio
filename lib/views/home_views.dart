import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_task/main.dart';
import 'package:sample_task/utils/string_constant.dart';

import '../utils/color_picker.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({Key? key}) : super(key: key);

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  List durationName = ['1 W', '1 M', '6 M', '1 Y', '5 Y', 'MAX'];
  List yAxisName = ['10', '5', '2.5', '0', '-2.5', '-5'];
  int initialIndex = 0;
  int initialBtnIndex = 0;

  buildButton({required String btnName, required int index}) {
    return SizedBox(
      height: 20,
      width: 50,
      child: InkWell(
        onTap: () {
          setState(() {
            initialBtnIndex = index;
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: btnName == durationName[initialBtnIndex]
                ? const Color(0XFFE5B02C)
                : Colors.white,
          ),
          child: Text(
            btnName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              backgroundColor: btnName == durationName[initialBtnIndex]
                  ? const Color(0XFFE5B02C)
                  : Colors.white,
              color: btnName == durationName[initialBtnIndex]
                  ? Colors.white
                  : Colors.black,
            ),
          ),
        ),
      ),
    );
  }

  buildYAxisButton({required String btnName}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: SizedBox(
        height: 20,
        width: 30,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.blueGrey.shade100),
          child: Text(
            btnName,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(StrConst.title),
          leading: Padding(
            padding: const EdgeInsets.only(top: 15, left: 15),
            child: ConstrainedBox(
                constraints: const BoxConstraints.expand(width: 25, height: 25),
                child: Stack(
                  children: [
                    SvgPicture.asset(
                      "assets/images/svg_circle.svg",
                      height: 30,
                      width: 30,
                      fit: BoxFit.cover,
                    ),
                    const Positioned(
                      top: 7,
                      left: 7,
                      right: 0,
                      child: Text(
                        "MC",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: SvgPicture.asset("assets/images/svg_book.svg"),
            )
          ],
          bottom: const PreferredSize(
            preferredSize: Size(0, 10),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(thickness: 0.5),
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: initialIndex,
            backgroundColor: Colors.blueGrey,
            selectedItemColor: Colors.black,
            unselectedItemColor: Colors.grey,
            onTap: (int i) {
              setState(() {
                initialIndex = i;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/svg_first.svg",
                      height: 45, width: 45),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/svg_second.svg",
                      height: 25, width: 25),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/svg_third.svg",
                      height: 25, width: 25),
                  label: ''),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/images/svg_forth.svg",
                      height: 25, width: 25),
                  label: ''),
            ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                height: MediaQuery.of(context).size.height * 0.55,
                decoration: BoxDecoration(
                  // color: Colors.black,
                  border: Border.all(color: Colors.grey.shade300, width: 3),

                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 30),
                          Divider(
                            color: Colors.grey.shade300,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 15),
                            child: Text(
                              '+7.76%',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Text(
                              'Last ${durationName[initialBtnIndex]}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Expanded(
                            child: LineChart(
                              LineChartData(
                                  baselineX: 5,
                                  borderData: FlBorderData(show: false),
                                  lineTouchData: LineTouchData(enabled: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: [
                                        const FlSpot(-5, 2),
                                        const FlSpot(-1, -1),
                                        const FlSpot(2, 2),
                                        const FlSpot(4, 3),
                                        const FlSpot(5, -2.5),
                                        const FlSpot(7, 2),
                                        const FlSpot(8, -3),
                                        const FlSpot(9, 4),
                                        const FlSpot(10, 6),
                                        // Add more data points as needed
                                      ],
                                      isCurved: isTrue,
                                      belowBarData: BarAreaData(
                                          color:  Color(0XFFE5B02C).withOpacity(0.2),
                                          show: isTrue),
                                      color: const Color(0XFFE5B02C),
                                      barWidth: 3,
                                      dotData: FlDotData(show: false),
                                    ),
                                  ],
                                  minX: -5,
                                  maxX: 10,
                                  minY: -5,
                                  maxY: 10,
                                  titlesData: FlTitlesData(show: isFalse),
                                  gridData: FlGridData(show: isFalse)),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: 0,
                        top: 50,
                        bottom: 0,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          alignment: Alignment.center,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(16)),
                              color: Colors.transparent),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              for (int i = 0; i < yAxisName.length; i++)
                                buildYAxisButton(btnName: yAxisName[i]),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        bottom: 15,
                        right: 0,
                        left: 0,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(16)),
                              color: ColorPicker.kWhite),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              for (int i = 0; i < durationName.length; i++)
                                buildButton(btnName: durationName[i], index: i),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: const Text(
                  "The analytics above are displaying your net investment, excluding metfolio's fees",
                  style: TextStyle(fontSize: 16),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ));
  }
}
