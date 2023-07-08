
class Room {
  static const String COLLECTION_NAME="Rooms";
  String id;
  String title;
  String desc;
  String cateId;

  Room({ this.id="",
    required this.title,
    required this.desc,
    required this.cateId});

  Room.fromJson(Map<String, dynamic>json) :this
      (
      id: json["id"],
      title: json["title"],
      desc: json["desc"],
      cateId: json["cateId"],

    );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "desc": desc,
      "cateId": cateId,


    };
  }
}