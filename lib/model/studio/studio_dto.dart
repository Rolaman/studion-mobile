class StudioListRequest {
  final String cityId = 'moscow';
}

class StudioListResponse {
  final List<StudioItem> studios;

  StudioListResponse(this.studios);
}

class StudioItem {
  final String name;
  final String? imageUrl;

  StudioItem(this.name, this.imageUrl);
}
