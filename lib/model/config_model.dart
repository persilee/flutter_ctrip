class ConfigModel {
  final String searchUrl;

  ConfigModel({this.searchUrl});

  factory ConfigModel.fromJson(Map<String, dynamic>json){
    return ConfigModel(searchUrl: json['searchUrl']);
  }
}
