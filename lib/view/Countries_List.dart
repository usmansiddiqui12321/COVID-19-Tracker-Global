import 'package:covid_with_api/Services/StatesServices.dart';
import 'package:covid_with_api/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatesServices statesServices = StatesServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {});
                },
                controller: searchController,
                decoration: InputDecoration(
                    hoverColor: Colors.black,
                    suffixIcon: IconButton(
                      icon: searchController.text.isEmpty
                          ? const Icon(Icons.search)
                          : const Icon(Icons.clear),
                      onPressed: () {
                        searchController.text = '';
                      },
                    ),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: "Search with Country Name",
                    border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(50.0))),
              ),
            ),
            Expanded(
              child: FutureBuilder(
                future: statesServices.countriesListApi(),
                builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: Column(
                          children: [
                            ListTile(
                              title: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 10,
                                width: 89,
                                color: Colors.white,
                              ),
                              leading: Container(
                                height: 50,
                                width: 50,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      );
                    });
                  } else {
                    return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        String name = snapshot.data![index]["country"];
                        if (searchController.text.isEmpty) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => detailedScreen(
                                                image: snapshot.data![index]
                                                        ['countryInfo']['flag']
                                                    .toString(),
                                                name: snapshot.data![index]
                                                        ['country']
                                                    .toString(),
                                                totalCases: snapshot
                                                    .data![index]['cases']
                                                    .toString(),
                                                totalDeaths: snapshot
                                                    .data![index]['death']
                                                    .toString(),
                                                active: snapshot.data![index]
                                                        ['active']
                                                    .toString(),
                                                test: snapshot.data![index]
                                                        ['tests']
                                                    .toString(),
                                                todayRecovered: snapshot
                                                    .data![index]
                                                        ['todayRecovered']
                                                    .toString(),
                                                totalRecovered: snapshot
                                                    .data![index]['recovered']
                                                    .toString(),
                                                critical: snapshot.data![index]
                                                        ['critical']
                                                    .toString(),
                                              )));
                                },
                                child: ListTile(
                                  title: Text(snapshot.data![index]["country"]),
                                  subtitle: Text(snapshot.data![index]["cases"]
                                      .toString()),
                                  leading: Image(
                                      height: 50,
                                      width: 50,
                                      image: NetworkImage(snapshot.data![index]
                                          ['countryInfo']['flag'])),
                                ),
                              ),
                            ],
                          );
                        } else if (name
                            .toLowerCase()
                            .contains(searchController.text.toLowerCase())) {
                          return Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => detailedScreen(
                                                image: snapshot.data![index]
                                                        ['countryInfo']['flag']
                                                    .toString(),
                                                name: snapshot.data![index]
                                                        ['country']
                                                    .toString(),
                                                totalCases: snapshot
                                                    .data![index]['cases']
                                                    .toString(),
                                                totalDeaths: snapshot
                                                    .data![index]['death']
                                                    .toString(),
                                                active: snapshot.data![index]
                                                        ['active']
                                                    .toString(),
                                                test: snapshot.data![index]
                                                        ['tests']
                                                    .toString(),
                                                todayRecovered: snapshot
                                                    .data![index]
                                                        ['todayRecovered']
                                                    .toString(),
                                                totalRecovered: snapshot
                                                    .data![index]['recovered']
                                                    .toString(),
                                                critical: snapshot.data![index]
                                                        ['critical']
                                                    .toString(),
                                              )));
                                },
                                child: Column(
                                  children: [
                                    ListTile(
                                      title: Text(
                                          snapshot.data![index]["country"]),
                                      subtitle: Text(snapshot.data![index]
                                              ["cases"]
                                          .toString()),
                                      leading: Image(
                                          height: 50,
                                          width: 50,
                                          image: NetworkImage(
                                              snapshot.data![index]
                                                  ['countryInfo']['flag'])),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Container();
                        }
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
