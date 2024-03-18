class Trailer {
  int? _id;
  String? _name;
  String? _youtubeUrl;
  String? _url;

  Trailer(int id, String name, String youtubeUrl, String url) {
    _id = id;
    _name = name;
    _youtubeUrl = youtubeUrl;
    _url = url;
  }

  Trailer.empty() {
    _id = 0;
    _name = 'Undefined';
    _youtubeUrl = '';
    _url = '';
  }

  Trailer.fromArray(List<dynamic> myarray) {
    if (myarray.length == 3) {
      _name = myarray[0] as String?;
      _youtubeUrl = myarray[1] as String?;
      _url = myarray[2] as String?;
    }
  }

  factory Trailer.fromJson(Map<String, dynamic> json) {
    return Trailer(
      json['id'],
      json['name'],
      json['youtube_url'],
      json['url'],
    );
  }

  static List<Trailer> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => Trailer.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': _id,
      'name': _name,
      'youtube_url': _youtubeUrl,
      'url': _url,
    };
  }

  int? getId() {
    return _id;
  }

  String? getName() {
    return _name;
  }

  String? getYoutubeUrl() {
    return _youtubeUrl;
  }

  String? getUrl() {
    return _url;
  }

  void setName(String name) {
    _name = name;
  }

  @override
  String toString() {
    return '\n{id: $_id, name: $_name, youtubeUrl: $_youtubeUrl, url: $_url}\n';
  }
}