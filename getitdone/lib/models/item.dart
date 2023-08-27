class Item {
  final String? title;
  bool isTrue;

  Item({this.title, this.isTrue = false});

  toggleStatus() {
    isTrue = !isTrue;
  }
}
