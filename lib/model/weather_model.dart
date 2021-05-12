class Weather {
  final Map? coord;
  final List? weather;
  final String? base;
  final Map? main;
  final int? visibility;
  final Map? wind;
  final Map? clouds;
  final int? dt;
  final Map? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;

  Weather(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});

  factory Weather.fromJson(Map<dynamic, dynamic> json) {
    return Weather(
      coord: json['coord'],
      weather: json['weather'],
      base: json['base'],
      main: json['main'],
      visibility: json['visibility'],
      wind: json['wind'],
      clouds: json['clouds'],
      dt: json['dt'],
      sys: json['masysin'],
      timezone: json['timezone'],
      id: json['id'],
      name: json['name'],
      cod: json['cod'],
    );
  }
}
