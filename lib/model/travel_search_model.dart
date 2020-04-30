class TravelSearchModel {
  String keyword;
  ResponseStatus responseStatus;
  List<Result> result;

  TravelSearchModel({this.responseStatus, this.result});

  TravelSearchModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'] != null
        ? new ResponseStatus.fromJson(json['ResponseStatus'])
        : null;
    if (json['result'] != null) {
      result = new List<Result>();
      json['result'].forEach((v) {
        result.add(new Result.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responseStatus != null) {
      data['ResponseStatus'] = this.responseStatus.toJson();
    }
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ResponseStatus {
  String timestamp;
  String ack;
  List<Extension> extension;

  ResponseStatus({this.timestamp, this.ack, this.extension});

  ResponseStatus.fromJson(Map<String, dynamic> json) {
    timestamp = json['Timestamp'];
    ack = json['Ack'];
    if (json['Extension'] != null) {
      extension = new List<Extension>();
      json['Extension'].forEach((v) {
        extension.add(new Extension.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Timestamp'] = this.timestamp;
    data['Ack'] = this.ack;
    if (this.extension != null) {
      data['Extension'] = this.extension.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Extension {
  String id;
  String value;

  Extension({this.id, this.value});

  Extension.fromJson(Map<String, dynamic> json) {
    id = json['Id'];
    value = json['Value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Id'] = this.id;
    data['Value'] = this.value;
    return data;
  }
}

class Result {
  String moduleType;
  List<Items> items;

  Result({this.moduleType, this.items});

  Result.fromJson(Map<String, dynamic> json) {
    moduleType = json['moduleType'];
    if (json['items'] != null) {
      items = new List<Items>();
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moduleType'] = this.moduleType;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int id;
  String resourceType;
  String name;
  String title;
  String appUrl;
  String h5Url;
  String wxUrl;
  String mainWxUrl;
  String imageUrl;
  int followCount;
  int articleCount;

  Items(
      {this.id,
        this.resourceType,
        this.name,
        this.title,
        this.appUrl,
        this.h5Url,
        this.wxUrl,
        this.mainWxUrl,
        this.followCount,
        this.imageUrl,
        this.articleCount});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    resourceType = json['resourceType'];
    name = json['name'];
    title = json['title'];
    appUrl = json['appUrl'];
    h5Url = json['h5Url'];
    wxUrl = json['wxUrl'];
    mainWxUrl = json['mainWxUrl'];
    imageUrl = json['imageUrl'];
    followCount = json['followCount'];
    articleCount = json['articleCount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['resourceType'] = this.resourceType;
    data['name'] = this.name;
    data['title'] = this.title;
    data['appUrl'] = this.appUrl;
    data['h5Url'] = this.h5Url;
    data['wxUrl'] = this.wxUrl;
    data['mainWxUrl'] = this.mainWxUrl;
    data['followCount'] = this.followCount;
    data['imageUrl'] = this.imageUrl;
    data['articleCount'] = this.articleCount;
    return data;
  }
}