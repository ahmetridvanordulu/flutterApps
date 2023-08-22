class burcModeli {
  String? _burcAdi;
  String? _burcTarihi;
  String? _burcDetay;
  String? _burcKucukResim;
  String? _burcBuyukResim;
  burcModeli(
    this._burcAdi,
    this._burcTarihi,
    this._burcDetay,
    this._burcKucukResim,
    this._burcBuyukResim,
  );

  get burcAdi => this._burcAdi;
  get burcTarihi => this._burcTarihi;
  get burcDetay => this._burcDetay;
  get burcKucukResim => this._burcKucukResim;
  get burcBuyukResim => this._burcBuyukResim;

  @override
  String toString() {
    // TODO: implement toString
    return "$_burcAdi";
  }
}
