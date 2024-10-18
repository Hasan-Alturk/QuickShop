class OffersResponse {
  final bool status;
  final Offers data;

  OffersResponse({
    required this.status,
    required this.data,
  });

  factory OffersResponse.fromJson(Map<String, dynamic> json) {
    return OffersResponse(
      status: json['status'] as bool,
      data: Offers.fromJson(json['data']),
    );
  }
}

class Offers {
  final int currentPage;
  final List<Offer> data;
  final String firstPageUrl;
  final int from;
  final int lastPage;
  final String lastPageUrl;
  final List<LinksModel> linksList;
  final dynamic nextPageUrl;
  final String path;
  final int perPage;
  final dynamic prevPageUrl;
  final int to;
  final int total;

  Offers({
    required this.currentPage,
    required this.data,
    required this.firstPageUrl,
    required this.from,
    required this.lastPage,
    required this.lastPageUrl,
    required this.linksList,
    this.nextPageUrl,
    required this.path,
    required this.perPage,
    this.prevPageUrl,
    required this.to,
    required this.total,
  });

  factory Offers.fromJson(Map<String, dynamic> json) {
    return Offers(
      currentPage: json['current_page'] as int,
      data: List.from(json['data'].map((e) => Offer.fromJson(e))),
      firstPageUrl: json['first_page_url'] as String,
      from: json['from'] as int,
      lastPage: json['last_page'] as int,
      lastPageUrl: json['last_page_url'] as String,
      linksList: List.from(json['links'].map((e) => LinksModel.fromJson(e))),
      nextPageUrl: json['next_page_url'] as dynamic,
      path: json['path'] as String,
      perPage: json['per_page'] as int,
      prevPageUrl: json['prev_page_url'] as dynamic,
      to: json['to'] as int,
      total: json['total'] as int,
    );
  }
}

class Offer {
  final int id;
  final dynamic link;
  final String thumbnailUrl;
  final String xxlargeUrl;
  final String cutAlign;

  Offer({
    required this.id,
    this.link,
    required this.thumbnailUrl,
    required this.xxlargeUrl,
    required this.cutAlign,
  });

  factory Offer.fromJson(Map<String, dynamic> json) {
    return Offer(
      id: json['id'] as int,
      link: json['link'] as dynamic,
      thumbnailUrl: json['thumbnail_url'] as String,
      xxlargeUrl: json['xxlarge_url'] as String,
      cutAlign: json['cut_align'] as String,
    );
  }
}

class LinksModel {
  final dynamic url;
  final String label;
  final bool active;

  LinksModel({
    this.url,
    required this.label,
    required this.active,
  });

  factory LinksModel.fromJson(Map<String, dynamic> json) {
    return LinksModel(
      url: json['url'] as dynamic,
      label: json['label'] as String,
      active: json['active'] as bool,
    );
  }
}
