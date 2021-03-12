class Info {
  Info({this.results, this.page});

  Info.fromJson(Map<String, dynamic> js)
      : results = js['results'],
        page = js['page'];

  final dynamic results;
  final dynamic page;
}
