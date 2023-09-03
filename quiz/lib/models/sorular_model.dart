class Soru {
  String? id;
  String? baslik;
  Map<String, bool>? ayar;

  Soru({required this.id, required this.baslik, required this.ayar});

  @override
  String toString() {
    // TODO: implement toString
    return "Sorular (id : $id, basliği : $baslik, ayarı $ayar)";
  }
}