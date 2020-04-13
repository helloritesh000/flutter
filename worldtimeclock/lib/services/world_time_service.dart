import 'dart:convert';

import 'package:http/http.dart';
import 'package:worldtimeclock/services/Logger.dart';

import '../CountryDetail.dart';

class WorldTimeService{
  String baseUrl = "http://restcountries.eu/rest/v2/";

  Future<List<dynamic>> getResponseBody(url) async {
    var response = await get(baseUrl + url);
    var data = jsonDecode(response.body);
    print(data.runtimeType);
    return data;
  }

  Future<List<CountryDetail>> getCountries() async {
    var data = (await getResponseBody("all"));
    List<CountryDetail> countryDetails = data.map((a) => CountryDetail.fromJson(a)).toList();
    return countryDetails;
  }

  Future<CountryDetail> getCountryByName(String name) async {
      var response = await get(baseUrl + 'name/$name?fullText=true');
      var data = jsonDecode(response.body) as List;
      List<CountryDetail> countryDetails = data.map((a) => CountryDetail.fromJson(a)).toList();
      print(countryDetails);
      return countryDetails.first;
  }
}
