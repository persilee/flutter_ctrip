class DestinationSearchModel {
  InputInfoType inputInfoType;
  SuggestTabType suggestTabType;
  SuggestHotDistrictType suggestHotDistrictType;
  SuggestPoiType suggestPoiType;
  SuggestRecommendType suggestRecommendType;
  List<String> orders;
  SuggestPreferType suggestPreferType;
  String keyword;


  DestinationSearchModel(
      {this.inputInfoType,
        this.suggestTabType,
        this.suggestHotDistrictType,
        this.suggestPoiType,
        this.suggestRecommendType,
        this.orders,
        this.suggestPreferType,
        this.keyword});

  DestinationSearchModel.fromJson(Map<String, dynamic> json) {
    inputInfoType = json['inputInfoType'] != null
        ? new InputInfoType.fromJson(json['inputInfoType'])
        : null;
    suggestTabType = json['suggestTabType'] != null
        ? new SuggestTabType.fromJson(json['suggestTabType'])
        : null;
    suggestHotDistrictType = json['suggestHotDistrictType'] != null
        ? new SuggestHotDistrictType.fromJson(json['suggestHotDistrictType'])
        : null;
    suggestPoiType = json['suggestPoiType'] != null
        ? new SuggestPoiType.fromJson(json['suggestPoiType'])
        : null;
    suggestRecommendType = json['suggestRecommendType'] != null
        ? new SuggestRecommendType.fromJson(json['suggestRecommendType'])
        : null;
    orders = json['orders'].cast<String>();
    suggestPreferType = json['suggestPreferType'] != null
        ? new SuggestPreferType.fromJson(json['suggestPreferType'])
        : null;
    keyword = json['keyword'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.inputInfoType != null) {
      data['inputInfoType'] = this.inputInfoType.toJson();
    }
    if (this.suggestTabType != null) {
      data['suggestTabType'] = this.suggestTabType.toJson();
    }
    if (this.suggestHotDistrictType != null) {
      data['suggestHotDistrictType'] = this.suggestHotDistrictType.toJson();
    }
    if (this.suggestPoiType != null) {
      data['suggestPoiType'] = this.suggestPoiType.toJson();
    }
    if (this.suggestRecommendType != null) {
      data['suggestRecommendType'] = this.suggestRecommendType.toJson();
    }
    data['orders'] = this.orders;
    if (this.suggestPreferType != null) {
      data['suggestPreferType'] = this.suggestPreferType.toJson();
    }
    data['keyword'] = this.keyword;
    return data;
  }
}

class InputInfoType {
  PoiInfoType poiInfoType;

  InputInfoType({this.poiInfoType});

  InputInfoType.fromJson(Map<String, dynamic> json) {
    poiInfoType = json['poiInfoType'] != null
        ? new PoiInfoType.fromJson(json['poiInfoType'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.poiInfoType != null) {
      data['poiInfoType'] = this.poiInfoType.toJson();
    }
    return data;
  }
}

class PoiInfoType {
  int poid;
  String displayName;
  String searchName;
  String dataType;
  String upperName;

  PoiInfoType(
      {this.poid,
        this.displayName,
        this.searchName,
        this.dataType,
        this.upperName});

  PoiInfoType.fromJson(Map<String, dynamic> json) {
    poid = json['poid'];
    displayName = json['displayName'];
    searchName = json['searchName'];
    dataType = json['dataType'];
    upperName = json['upperName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poid'] = this.poid;
    data['displayName'] = this.displayName;
    data['searchName'] = this.searchName;
    data['dataType'] = this.dataType;
    data['upperName'] = this.upperName;
    return data;
  }
}

class SuggestTabType {
  String title;
  List<TabInfoTypes> tabInfoTypes;

  SuggestTabType({this.title, this.tabInfoTypes});

  SuggestTabType.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['tabInfoTypes'] != null) {
      tabInfoTypes = new List<TabInfoTypes>();
      json['tabInfoTypes'].forEach((v) {
        tabInfoTypes.add(new TabInfoTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.tabInfoTypes != null) {
      data['tabInfoTypes'] = this.tabInfoTypes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class TabInfoTypes {
  String tabId;
  String tabName;
  String type;

  TabInfoTypes({this.tabId, this.tabName, this.type});

  TabInfoTypes.fromJson(Map<String, dynamic> json) {
    tabId = json['tabId'];
    tabName = json['tabName'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tabId'] = this.tabId;
    data['tabName'] = this.tabName;
    data['type'] = this.type;
    return data;
  }
}

class SuggestHotDistrictType {
  String title;
  List<HotPoiTypes> hotPoiTypes;

  SuggestHotDistrictType({this.title, this.hotPoiTypes});

  SuggestHotDistrictType.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['hotPoiTypes'] != null) {
      hotPoiTypes = new List<HotPoiTypes>();
      json['hotPoiTypes'].forEach((v) {
        hotPoiTypes.add(new HotPoiTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.hotPoiTypes != null) {
      data['hotPoiTypes'] = this.hotPoiTypes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class HotPoiTypes {
  int poid;
  String displayName;
  String searchName;

  HotPoiTypes({this.poid, this.displayName, this.searchName});

  HotPoiTypes.fromJson(Map<String, dynamic> json) {
    poid = json['poid'];
    displayName = json['displayName'];
    searchName = json['searchName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poid'] = this.poid;
    data['displayName'] = this.displayName;
    data['searchName'] = this.searchName;
    return data;
  }
}

class SuggestPoiType {
  List<PoiInfoTypes> poiInfoTypes;

  SuggestPoiType({this.poiInfoTypes});

  SuggestPoiType.fromJson(Map<String, dynamic> json) {
    if (json['poiInfoTypes'] != null) {
      poiInfoTypes = new List<PoiInfoTypes>();
      json['poiInfoTypes'].forEach((v) {
        poiInfoTypes.add(new PoiInfoTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.poiInfoTypes != null) {
      data['poiInfoTypes'] = this.poiInfoTypes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PoiInfoTypes {
  int poid;
  String displayName;
  String searchName;
  String dataType;
  String upperName;

  PoiInfoTypes({this.displayName, this.searchName});

  PoiInfoTypes.fromJson(Map<String, dynamic> json) {
    poid = json['poid'];
    displayName = json['displayName'];
    searchName = json['searchName'];
    dataType = json['dataType'];
    upperName = json['upperName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['poid'] = this.poid;
    data['displayName'] = this.displayName;
    data['searchName'] = this.searchName;
    data['dataType'] = this.dataType;
    data['upperName'] = this.upperName;
    return data;
  }
}

class SuggestRecommendType {
  String title;
  List<HotPoiTypes> hotPoiTypes;

  SuggestRecommendType({this.title, this.hotPoiTypes});

  SuggestRecommendType.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['hotPoiTypes'] != null) {
      hotPoiTypes = new List<HotPoiTypes>();
      json['hotPoiTypes'].forEach((v) {
        hotPoiTypes.add(new HotPoiTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.hotPoiTypes != null) {
      data['hotPoiTypes'] = this.hotPoiTypes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SuggestPreferType {
  String title;
  List<PreferInfoTypes> preferInfoTypes;

  SuggestPreferType({this.title, this.preferInfoTypes});

  SuggestPreferType.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['preferInfoTypes'] != null) {
      preferInfoTypes = new List<PreferInfoTypes>();
      json['preferInfoTypes'].forEach((v) {
        preferInfoTypes.add(new PreferInfoTypes.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.preferInfoTypes != null) {
      data['preferInfoTypes'] =
          this.preferInfoTypes.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PreferInfoTypes {
  String preferType;
  String preferName;
  String id;
  String name;

  PreferInfoTypes({this.preferType, this.preferName, this.id, this.name});

  PreferInfoTypes.fromJson(Map<String, dynamic> json) {
    preferType = json['preferType'];
    preferName = json['preferName'];
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['preferType'] = this.preferType;
    data['preferName'] = this.preferName;
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}
