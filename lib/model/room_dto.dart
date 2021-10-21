class RoomListRequest {
  final String? cityId;
  final String? text;

  RoomListRequest({this.cityId, this.text});
}

class RoomListResponse {
  final List<RoomItem> rooms;

  RoomListResponse(this.rooms);
}

class RoomItem {
  final String id;
  final String name;
  final String? imageUrl;
  final String studioId;
  final List<String> imageUrls;
  final String? description;
  final int area;
  final int height;

  RoomItem(
    this.id,
    this.name,
    this.imageUrl,
    this.studioId,
    this.imageUrls,
    this.description,
    this.area,
    this.height,
  );
}
