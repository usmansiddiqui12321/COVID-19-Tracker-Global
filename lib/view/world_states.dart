
import 'package:covid_with_api/Model/WorldStatesModel.dart';
import 'package:covid_with_api/Services/StatesServices.dart';
import 'package:covid_with_api/view/Countries_List.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

// ignore: camel_case_types
class worldStatesScreen extends StatefulWidget {
  const worldStatesScreen({super.key});

  @override
  State<worldStatesScreen> createState() => _worldStatesScreenState();
}

// ignore: camel_case_types
class _worldStatesScreenState extends State<worldStatesScreen>
    with TickerProviderStateMixin {
  //yad sy with TickerProviderStateMixin likhna h
  late final AnimationController _controller =
      AnimationController(duration: const Duration(seconds: 3), vsync: this)
        ..repeat();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  final colorList = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1AA260),
    const Color(0xffde5246),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: size.height * 0.01),
              // ignore: prefer_const_constructors
              FutureBuilder(
                  future: statesServices.fetchworldStateRecords(),
                  builder: (context, AsyncSnapshot<WorldStatesModel> snapshot) {
                    if (!snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: SpinKitFadingCircle(
                          color: Colors.white,
                          size: 50,
                          controller: _controller,
                        ),
                      );
                    } else {
                      return Column(
                        children: [
                          PieChart(
                            // ignore: prefer_const_literals_to_create_immutables
                            dataMap: {
                              "Total":
                                  double.parse(snapshot.data!.cases.toString()),
                              "Recovered": double.parse(
                                  snapshot.data!.recovered.toString()),
                              "Deaths": double.parse(
                                  snapshot.data!.deaths.toString()),
                            },
                            chartValuesOptions: const ChartValuesOptions(
                                showChartValuesInPercentage: true),
                            chartRadius: size.width / 2.5,
                            legendOptions: const LegendOptions(
                                legendPosition: LegendPosition.left),
                            animationDuration:
                                const Duration(milliseconds: 1200),
                            chartType: ChartType.ring,
                            colorList: colorList,
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: size.height * 0.06, bottom: 10),
                            child: Card(
                              child: Column(
                                // ignore: prefer_const_literals_to_create_immutables
                                children: [
                                  ReusealeRow(
                                      title: "total",
                                      value: snapshot.data!.cases.toString()),
                                  ReusealeRow(
                                      title: "Deaths",
                                      value: snapshot.data!.deaths.toString()),
                                  ReusealeRow(
                                      title: "Recovered",
                                      value:
                                          snapshot.data!.recovered.toString()),
                                  ReusealeRow(
                                      title: "Active",
                                      value: snapshot.data!.active.toString()),
                                  ReusealeRow(
                                      title: "Critical",
                                      value:
                                          snapshot.data!.critical.toString()),
                                  ReusealeRow(
                                      title: "Today Deaths",
                                      value: snapshot.data!.todayDeaths
                                          .toString()),
                                  ReusealeRow(
                                      title: "Today Recoverd",
                                      value: snapshot.data!.todayRecovered
                                          .toString()),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const CountriesListScreen()));
                            },
                            child: Container(
                              height: 50,
                              // width: ,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff1aa260)),
                              child:
                                  const Center(child: Text("Country Tracker")),
                            ),
                          )
                        ],
                      );
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class ReusealeRow extends StatelessWidget {
  const ReusealeRow({super.key, required this.title, required this.value});
  final String title, value;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 5.0,
        left: 20,
        right: 10,
        top: 10,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title),
              Text(value),
            ],
          ),
          const SizedBox(height: 5),
          const Divider()
        ],
      ),
    );
  }
}
