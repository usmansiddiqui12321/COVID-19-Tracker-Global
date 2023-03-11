// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:covid_with_api/Model/WorldStatesModel.dart';
import 'package:covid_with_api/Services/Utilities/appUrl.dart';
import 'package:http/http.dart' as http;

class StatesServices {
  Future<WorldStatesModel> fetchworldStateRecords() async {
    //in {}
    final Response = await http.get(Uri.parse(appUrl.worldStatesApi));
    if (Response.statusCode == 200) {
      var data = jsonDecode(Response.body.toString());
      return WorldStatesModel.fromJson(data);
    } else {
      throw Exception('error');
    }
  }

  Future<List<dynamic>> countriesListApi() async {
    // in [{}] but handling dynamically
    // other way is defined in API integeration 
    var data;
    final Response = await http.get(Uri.parse(appUrl.cointriesList));
    if (Response.statusCode == 200) {
      data = jsonDecode(Response.body);
      return data;
    } else {
      throw Exception('error');
    }
  }
}
