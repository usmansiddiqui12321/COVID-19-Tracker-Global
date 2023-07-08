
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class detailedScreen extends StatefulWidget {
  final String name, image;
  final String totalCases,
      totalDeaths,
      totalRecovered,
      active,
      critical,
      todayRecovered,
      test;
  const detailedScreen(
      {super.key,
      required this.name,
      required this.image,
      required this.totalCases,
      required this.totalDeaths,
      required this.totalRecovered,
      required this.active,
      required this.critical,
      required this.todayRecovered,
      required this.test});

  @override
  State<detailedScreen> createState() => _detailedScreenState();
}

class _detailedScreenState extends State<detailedScreen> {
  @override
  Widget build(BuildContext context) {
    DateTime today = DateTime.now();
    String dateStr = "${today.day}-${today.month}-${today.year}";

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          key: const Key('myAppBar'),
          automaticallyImplyLeading: true,
          title: Text(widget.name.toString()),
          elevation: 4,
          scrolledUnderElevation: 2,
          notificationPredicate: (notification) => true,
          shadowColor: Colors.black,
          surfaceTintColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
          backgroundColor: Colors.grey[800],
          foregroundColor: Colors.white,
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 24,
          ),
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
            size: 24,
          ),
          primary: true,
          centerTitle: true,
          // ignore: prefer_const_constructors
          excludeHeaderSemantics: false,
          systemOverlayStyle: SystemUiOverlayStyle.light,
          toolbarTextStyle: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).bodyMedium,
          titleTextStyle: const TextTheme(
            titleLarge: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ).titleLarge,
        ),
      )

      //widget.name.toString()
      ,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .067,
                      right: MediaQuery.of(context).size.height * .025,
                      left: MediaQuery.of(context).size.height * .025),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListView.separated(
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          vertical: 16, horizontal: 8),
                      itemBuilder: (context, index) {
                        return ReusableRow(
                          title: index == 0
                              ? 'Cases'
                              : index == 1
                                  ? 'Recovered'
                                  : index == 2
                                      ? 'Death on $dateStr'
                                      : index == 3
                                          ? 'Critical'
                                          : 'Today Recovered',
                          value: index == 0
                              ? widget.totalCases.toString()
                              : index == 1
                                  ? widget.totalRecovered.toString()
                                  : index == 2
                                      ? (widget.totalDeaths.toString() == 'null'
                                          ? '0'
                                          : widget.totalDeaths.toString())
                                      : index == 3
                                          ? widget.critical.toString()
                                          : widget.todayRecovered.toString(),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider(
                          thickness: 1,
                          height: 32,
                        );
                      },
                      itemCount: 5,
                    ),
                  )),
              Positioned(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage(widget.image),
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }
}

class ReusableRow extends StatelessWidget {
  String title, value;
  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [Text(title), Text(value)],
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
