class WorldStatesModel {
  int? updated;
  int? cases;
  int? todayCases;
  int? deaths;
  int? todayDeaths;
  int? recovered;
  int? todayRecovered;
  int? active;
  int? critical;
  int? casesPerOneMillion;
  int? deathsPerOneMillion;
  int? tests;
  double? testsPerOneMillion;
  int? population;
  int? oneCasePerPeople;
  int? oneDeathPerPeople;
  int? oneTestPerPeople;
  double? activePerOneMillion;
  double? recoveredPerOneMillion;
  double? criticalPerOneMillion;
  int? affectedCountries;

  WorldStatesModel(
      {this.updated,
      this.cases,
      this.todayCases,
      this.deaths,
      this.todayDeaths,
      this.recovered,
      this.todayRecovered,
      this.active,
      this.critical,
      this.casesPerOneMillion,
      this.deathsPerOneMillion,
      this.tests,
      this.testsPerOneMillion,
      this.population,
      this.oneCasePerPeople,
      this.oneDeathPerPeople,
      this.oneTestPerPeople,
      this.activePerOneMillion,
      this.recoveredPerOneMillion,
      this.criticalPerOneMillion,
      this.affectedCountries});

  WorldStatesModel.fromJson(Map<String, dynamic> json) {
    if (json["updated"] is int) {
      updated = json["updated"];
    }
    if (json["cases"] is int) {
      cases = json["cases"];
    }
    if (json["todayCases"] is int) {
      todayCases = json["todayCases"];
    }
    if (json["deaths"] is int) {
      deaths = json["deaths"];
    }
    if (json["todayDeaths"] is int) {
      todayDeaths = json["todayDeaths"];
    }
    if (json["recovered"] is int) {
      recovered = json["recovered"];
    }
    if (json["todayRecovered"] is int) {
      todayRecovered = json["todayRecovered"];
    }
    if (json["active"] is int) {
      active = json["active"];
    }
    if (json["critical"] is int) {
      critical = json["critical"];
    }
    if (json["casesPerOneMillion"] is int) {
      casesPerOneMillion = json["casesPerOneMillion"];
    }
    if (json["deathsPerOneMillion"] is int) {
      deathsPerOneMillion = json["deathsPerOneMillion"];
    }
    if (json["tests"] is int) {
      tests = json["tests"];
    }
    if (json["testsPerOneMillion"] is double) {
      testsPerOneMillion = json["testsPerOneMillion"];
    }
    if (json["population"] is int) {
      population = json["population"];
    }
    if (json["oneCasePerPeople"] is int) {
      oneCasePerPeople = json["oneCasePerPeople"];
    }
    if (json["oneDeathPerPeople"] is int) {
      oneDeathPerPeople = json["oneDeathPerPeople"];
    }
    if (json["oneTestPerPeople"] is int) {
      oneTestPerPeople = json["oneTestPerPeople"];
    }
    if (json["activePerOneMillion"] is double) {
      activePerOneMillion = json["activePerOneMillion"];
    }
    if (json["recoveredPerOneMillion"] is double) {
      recoveredPerOneMillion = json["recoveredPerOneMillion"];
    }
    if (json["criticalPerOneMillion"] is double) {
      criticalPerOneMillion = json["criticalPerOneMillion"];
    }
    if (json["affectedCountries"] is int) {
      affectedCountries = json["affectedCountries"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["updated"] = updated;
    _data["cases"] = cases;
    _data["todayCases"] = todayCases;
    _data["deaths"] = deaths;
    _data["todayDeaths"] = todayDeaths;
    _data["recovered"] = recovered;
    _data["todayRecovered"] = todayRecovered;
    _data["active"] = active;
    _data["critical"] = critical;
    _data["casesPerOneMillion"] = casesPerOneMillion;
    _data["deathsPerOneMillion"] = deathsPerOneMillion;
    _data["tests"] = tests;
    _data["testsPerOneMillion"] = testsPerOneMillion;
    _data["population"] = population;
    _data["oneCasePerPeople"] = oneCasePerPeople;
    _data["oneDeathPerPeople"] = oneDeathPerPeople;
    _data["oneTestPerPeople"] = oneTestPerPeople;
    _data["activePerOneMillion"] = activePerOneMillion;
    _data["recoveredPerOneMillion"] = recoveredPerOneMillion;
    _data["criticalPerOneMillion"] = criticalPerOneMillion;
    _data["affectedCountries"] = affectedCountries;
    return _data;
  }
}
