  class Item{
  String? baslik;
  bool? yapildimi;

  Item({this.baslik, this.yapildimi = false});

   toogleDurumu(){
    yapildimi =! yapildimi!;
   }
}