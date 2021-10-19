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
  final String name;
  final String? imageUrl;
  final String studioId;

  RoomItem(this.name, this.imageUrl, this.studioId);
}
