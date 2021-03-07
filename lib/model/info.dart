class Info {
  final int results;
  final int page;

  Info({this.results, this.page});

  Info.fromJson(Map<String, dynamic> js)
      : results = js['results'],
        page = js['page'];
}