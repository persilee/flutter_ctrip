class TravelSearchHotModel {
  List<HotResult> hotResult;

  TravelSearchHotModel({this.hotResult});

  TravelSearchHotModel.fromJson(Map<String, dynamic> json) {

    if (json['result'] != null) {
      hotResult = new List<HotResult>();
      json['result'].forEach((v) {
        hotResult.add(new HotResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.hotResult != null) {
      data['result'] = this.hotResult.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotResult {
  String name;
  String title;
  int template;
  List<ResourceItems> resourceItems;

  HotResult({this.name, this.title, this.template, this.resourceItems});

  HotResult.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    title = json['title'];
    template = json['template'];
    if (json['resourceItems'] != null) {
      resourceItems = new List<ResourceItems>();
      json['resourceItems'].forEach((v) {
        resourceItems.add(new ResourceItems.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['title'] = this.title;
    data['template'] = this.template;
    if (this.resourceItems != null) {
      data['resourceItems'] =
          this.resourceItems.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResourceItems {
  int id;
  String title;
  String iconUrl;
  String resourceType;
  String h5Url;
  String appUrl;
  String wxUrl;
  String mainWxUrl;

  ResourceItems(
      {this.id,
        this.title,
        this.iconUrl,
        this.resourceType,
        this.h5Url,
        this.appUrl,
        this.wxUrl,
        this.mainWxUrl});

  ResourceItems.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    iconUrl = json['iconUrl'];
    resourceType = json['resourceType'];
    h5Url = json['h5Url'];
    appUrl = json['appUrl'];
    wxUrl = json['wxUrl'];
    mainWxUrl = json['mainWxUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['iconUrl'] = this.iconUrl;
    data['resourceType'] = this.resourceType;
    data['h5Url'] = this.h5Url;
    data['appUrl'] = this.appUrl;
    data['wxUrl'] = this.wxUrl;
    data['mainWxUrl'] = this.mainWxUrl;
    return data;
  }
}
