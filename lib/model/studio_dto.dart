class StudioListRequest {
  final String? cityId;
  final String? text;

  StudioListRequest({this.cityId, this.text});
}

class StudioListResponse {
  final List<StudioItem> studios;

  StudioListResponse(this.studios);
}

class StudioItem {
  final String id;
  final String name;
  final String? imageUrl;
  final List<String> imageUrls;
  final String? description;
  final String address;
  final List<String> equipments;

  StudioItem(
    this.id,
    this.name,
    this.imageUrl,
    this.imageUrls,
    this.description,
    this.address,
    this.equipments,
  );
}
