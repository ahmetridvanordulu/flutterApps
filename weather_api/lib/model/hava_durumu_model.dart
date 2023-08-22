class havaDurumuSinifi {
  String? sehirAdi;
  double? sicaklik;
  double? ruzgar;
  int? nem;
  int? basinc;
  double? hissedilen;

  havaDurumuSinifi(this.sehirAdi, this.sicaklik, this.ruzgar, this.nem,
      this.basinc, this.hissedilen);

  havaDurumuSinifi.fromjson(Map<String, dynamic> json) {
    sehirAdi = json["name"];
    sicaklik = json["main"]["temp"];
    ruzgar = json["wind"]["speed"];
    nem = json["main"]["humidity"];
    basinc = json["main"]["pressure"];
    hissedilen = json["main"]["feels_like"];
  }
}
