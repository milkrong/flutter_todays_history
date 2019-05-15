class History {
  final int id;
  final String title;
  final String pic;
  final int year;
  final int month;
  final int day;
  final String des;
  final String lunar;

  History.fromJSON(Map<String, dynamic>json)
    : id = json["id"],
      title = json["title"],
      pic = json["pic"],
      year = json["year"],
      month = json["month"],
      day = json["day"],
      des = json["des"],
      lunar = json["lunar"];
}