class DestinationModel {
  List<NavigationPopList> navigationPopList;

  DestinationModel({this.navigationPopList});

  DestinationModel.fromJson(Map<String, dynamic> json) {
    if (json['navigationPopList'] != null) {
      navigationPopList = new List<NavigationPopList>();
      json['navigationPopList'].forEach((v) {
        navigationPopList.add(new NavigationPopList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.navigationPopList != null) {
      data['navigationPopList'] =
          this.navigationPopList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class NavigationPopList {
  int category;
  String categoryName;
  List<DestAreaList> destAreaList;

  NavigationPopList({this.category, this.categoryName, this.destAreaList});

  NavigationPopList.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    categoryName = json['categoryName'];
    if (json['destAreaList'] != null) {
      destAreaList = new List<DestAreaList>();
      json['destAreaList'].forEach((v) {
        destAreaList.add(new DestAreaList.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['category'] = this.category;
    data['categoryName'] = this.categoryName;
    if (this.destAreaList != null) {
      data['destAreaList'] = this.destAreaList.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DestAreaList {
  int id;
  String text;
  List<Child> child;

  DestAreaList({this.id, this.text, this.child});

  DestAreaList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    if (json['child'] != null) {
      child = new List<Child>();
      json['child'].forEach((v) {
        child.add(new Child.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    if (this.child != null) {
      data['child'] = this.child.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Child {
  int id;
  String text;
  String picUrl;
  String kwd;
  List<TagList> tagList;
  String poiType;

  Child(
      {this.id, this.text, this.picUrl, this.kwd, this.tagList, this.poiType});

  Child.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    text = json['text'];
    picUrl = json['picUrl'];
    kwd = json['kwd'];
    if (json['tagList'] != null) {
      tagList = new List<TagList>();
      json['tagList'].forEach((v) {
        tagList.add(new TagList.fromJson(v));
      });
    }
    poiType = json['poiType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['text'] = this.text;
    data['picUrl'] = this.picUrl;
    data['kwd'] = this.kwd;
    if (this.tagList != null) {
      data['tagList'] = this.tagList.map((v) => v.toJson()).toList();
    }
    data['poiType'] = this.poiType;
    return data;
  }
}

class TagList {
  int type;
  String tagName;

  TagList({this.type, this.tagName});

  TagList.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    tagName = json['tagName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['tagName'] = this.tagName;
    return data;
  }
}
