class RoomCategory {
  static String SportsId = "sports";
  static String MusicId = "music";
  static String MoviesId = "movies";

   String id;
  late String name;
  late String image;

  RoomCategory({required this.id,required this.name,required this.image});

  RoomCategory.fromId( this.id ) {

    name = id;
    image = "assets/images/$id.png";
  }

  static List<RoomCategory> getCategories() {
    return [
      RoomCategory.fromId(SportsId),
      RoomCategory.fromId(MusicId),
      RoomCategory.fromId(MoviesId),
    ];
  }
}
