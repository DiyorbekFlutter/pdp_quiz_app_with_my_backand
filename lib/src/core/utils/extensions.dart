extension Extensions on String {
  String get withSlash => "/$this";
  String childRoute(String child) => "$this/$child";

  String insert(int index, String text){
    return "${substring(0, index)}$text${substring(index)}";
  }
}
