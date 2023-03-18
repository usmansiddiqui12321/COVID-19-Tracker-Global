import 'package:covid_with_api/Services/StatesServices.dart';
import 'package:covid_with_api/view/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    searchController;
    SystemChannels.textInput.invokeMethod('TextInput.hide');
  }

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
              child: SingleChildScrollView(
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
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: "Search with Country Name",
                      border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.black),
                          borderRadius: BorderRadius.circular(50.0))),
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<List<dynamic>>(
                future: statesServices.countriesListApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return ListView.builder(
                      itemBuilder: (context, index) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade700,
                        highlightColor: Colors.grey.shade100,
                        child: Column(
                          children: [
                            ListTile(
                              title: Container(
                                  height: 10, width: 89, color: Colors.white),
                              subtitle: Container(
                                  height: 10, width: 89, color: Colors.white),
                              leading: Container(
                                  height: 50, width: 50, color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                  final data = snapshot.data!;
                  return ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final name = data[index]['country'].toString();
                      final flagUrl =
                          data[index]['countryInfo']['flag'].toString();
                      final cases = data[index]['cases'].toString();
                      return name
                              .toLowerCase()
                              .contains(searchController.text.toLowerCase())
                          ? InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => detailedScreen(
                                      image: flagUrl,
                                      name: name,
                                      totalCases: cases,
                                      totalDeaths:
                                          data[index]['death'].toString(),
                                      active: data[index]['active'].toString(),
                                      test: data[index]['tests'].toString(),
                                      todayRecovered: data[index]
                                              ['todayRecovered']
                                          .toString(),
                                      totalRecovered:
                                          data[index]['recovered'].toString(),
                                      critical:
                                          data[index]['critical'].toString(),
                                    ),
                                  ),
                                );
                              },
                              child: ListTile(
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 16),
                                leading: CircleAvatar(
                                  radius: 28,
                                  backgroundImage: NetworkImage(flagUrl),
                                ),
                                title: Text(
                                  name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                                subtitle: Text(
                                  'Cases: $cases',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                trailing: const Icon(Icons.arrow_forward),
                              ),
                            )
                          : Container();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class ListContainer extends StatelessWidget {
//   ListContainer({super.key});
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;

//     return Container(
//       height: size.height * .3,
//       width: size.width * .8,
//       child: Row(
//         children: [
//           Image(
//               image:
//                   NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
//           Column(
//             children: [],
//           )
//         ],
//       ),
//     );
//   }
// }
