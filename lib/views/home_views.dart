import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sample_task/main.dart';
import 'package:sample_task/utils/string_constant.dart';
import 'package:sizer/sizer.dart';

import '../utils/color_picker.dart';
import '../utils/model/dummy_response.dart';
import 'home_views_repository.dart';

class HomeViews extends StatefulWidget {
  const HomeViews({Key? key}) : super(key: key);

  @override
  State<HomeViews> createState() => _HomeViewsState();
}

class _HomeViewsState extends State<HomeViews> {
  List durationName = [
    StrConst.oneWeek,
    StrConst.oneMonth,
    StrConst.sixMonth,
    StrConst.oneYear,
    StrConst.fiveYear,
    StrConst.maxDuration
  ];

  List urlList = [
    StrConst.url1W,
    StrConst.url1M,
    StrConst.url6M,
    StrConst.url1Y,
    StrConst.url5Y,
    StrConst.urlMax
  ];
  List yAxisName = ['10', '5', '2.5', '0', '-2.5', '-5'];
  int initialIndex = 0;
  int initialBtnIndex = 0;

  int? id;
  int? column1;
  List<DummyResponse>? dummyData = [];
  bool isLoading = isTrue;
  List<FlSpot> spotData = [];
  String url = StrConst.url1W;

  @override
  void initState() {
    super.initState();
    print("************************************************");
    getData(url);
  }

  buildButton({required String btnName, required int index}) {
    return SizedBox(
      height: 3.h,
      width: 12.w,
      child: InkWell(
        onTap: () {
          setState(() {
            initialBtnIndex = index;
            getData(urlList[index]);
          });
        },
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: btnName == durationName[initialBtnIndex]
                ? ColorPicker.kMetfolio
                : Colors.white,
          ),
          child: Text(
            btnName,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              backgroundColor: btnName == durationName[initialBtnIndex]
                  ? ColorPicker.kMetfolio
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
      padding: EdgeInsets.symmetric(vertical: 1.5.h),
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
    for (var i = 0; i < (dummyData?.length ?? 0); i++) {
      var xValue = i;
      var yValue =
          dummyData?[i].column1;

      if (yValue != null) {
        spotData.add(FlSpot(xValue.toDouble(), yValue.toDouble()));
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(StrConst.title),
        leading: Padding(
          padding: const EdgeInsets.only(top: 05, left: 15),
          child: Stack(
            children: [
              Center(
                child: SvgPicture.asset(
                  "assets/images/svg_circle.svg",
                  height: 4.h,
                  width: 4.h,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned.fill(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.center,
                  child: Text(
                    "MC",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 10.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: SvgPicture.asset("assets/images/svg_book.svg"),
          )
        ],
        bottom: PreferredSize(
          preferredSize: Size(0, 2.h),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Divider(thickness: 0.5),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initialIndex,
        backgroundColor: Colors.blueGrey,
        useLegacyColorScheme: false,
        showSelectedLabels: false,
        elevation: 0,
        unselectedItemColor: Colors.grey,
        onTap: (int i) {
          setState(() {
            initialIndex = i;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/svg_first.svg",
              height: 4.5.h,
              width: 4.5.h,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/svg_second.svg",
              height: 3.h,
              width: 3.h,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/svg_third.svg",
              height: 3.5.h,
              width: 3.5.h,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              "assets/images/svg_forth.svg",
              height: 3.5.h,
              width: 25,
            ),
            label: '',
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20.0),
              height: 55.h,
              decoration: BoxDecoration(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            '+7.76%',
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 26.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Text(
                            'Last ${durationName[initialBtnIndex]}',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: StatefulBuilder(
                            builder: (context, stState) {
                              return LineChart(
                                LineChartData(
                                  baselineX: 5,
                                  borderData: FlBorderData(show: false),
                                  lineTouchData:
                                  LineTouchData(enabled: false),
                                  lineBarsData: [
                                    LineChartBarData(
                                      spots: spotData,
                                      isCurved: isTrue,
                                      belowBarData: BarAreaData(
                                        color: ColorPicker.kMetfolio.withOpacity(0.2),
                                        show: isTrue,
                                      ),
                                      color: ColorPicker.kMetfolio,
                                      barWidth: 3,
                                      dotData: FlDotData(show: false),
                                    ),
                                  ],
                                  minX: 0,
                                  maxX: (dummyData?.length.toDouble())! - 1,
                                  minY: -10,
                                  maxY: 100,
                                  titlesData: FlTitlesData(show: isFalse),
                                  gridData: FlGridData(show: isFalse),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    Positioned(
                      left: 0,
                      top: 12.h,
                      bottom: 0,
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(16)),
                          color: Colors.transparent,
                        ),
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
                        margin: EdgeInsets.symmetric(horizontal: 3.w),
                        height: 4.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(16),
                          ),
                          color: ColorPicker.kWhite,
                        ),
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
              child: Text(
                StrConst.homeViewContent,
                style: TextStyle(fontSize: 10.sp),
                textAlign: TextAlign.center,
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void getData(String commonUrl) async {
    setState(() {
      isLoading = true;
      dummyData = [];
      spotData.clear();
    });
    homeViewsRepository
        .fetchDummyData(commonUrl)
        .then((value) => {
      dummyData = value,
      setState(() {
        dummyData;
      })
    })
        .onError((error, stackTrace) => {})
        .whenComplete(() {
      setState(() => isLoading = false);
    });
  }
}
