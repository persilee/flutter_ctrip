class TravelHotKeywordModel {

  List<HotKeyword> hotKeyword;

  TravelHotKeywordModel({this.hotKeyword});

  TravelHotKeywordModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      hotKeyword = new List<HotKeyword>();
      json['result'].forEach((v) {
        hotKeyword.add(new HotKeyword.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotKeyword != null) {
      data['result'] = this.hotKeyword.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotKeyword {
  String prefix;
  String content;
  String h5Url;
  String appUrl;
  String wxUrl;
  String mainWxUrl;

  HotKeyword(
      {this.prefix,
        this.content,
        this.h5Url,
        this.appUrl,
        this.wxUrl,
        this.mainWxUrl});

  HotKeyword.fromJson(Map<String, dynamic> json) {
    prefix = json['prefix'];
    content = json['content'];
    h5Url = json['h5Url'];
    appUrl = json['appUrl'];
    wxUrl = json['wxUrl'];
    mainWxUrl = json['mainWxUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['prefix'] = this.prefix;
    data['content'] = this.content;
    data['h5Url'] = this.h5Url;
    data['appUrl'] = this.appUrl;
    data['wxUrl'] = this.wxUrl;
    data['mainWxUrl'] = this.mainWxUrl;
    return data;
  }
}
