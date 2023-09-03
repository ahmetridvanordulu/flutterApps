class Item{
  String? baslik;
  bool? yapildimi = false;

  Item({this.baslik, this.yapildimi});

   toogleDurumu(){
    yapildimi =! yapildimi!;
   }
}