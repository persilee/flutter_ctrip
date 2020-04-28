class TravelTabModel {
  ResponseStatus responseStatus;
  String abTestResult;
  District district;
  List<SubjectModules> subjectModules;
  String currentTime;

  TravelTabModel(
      {this.responseStatus,
        this.abTestResult,
        this.district,
        this.subjectModules,
        this.currentTime});

  TravelTabModel.fromJson(Map<String, dynamic> json) {
    responseStatus = json['ResponseStatus'] != null
        ? new ResponseStatus.fromJson(json['ResponseStatus'])
        : null;
    abTestResult = json['abTestResult'];
    district = json['district'] != null
        ? new District.fromJson(json['district'])
        : null;
    if (json['subjectModules'] != null) {
      subjectModules = new List<SubjectModules>();
      json['subjectModules'].forEach((v) {
        subjectModules.add(new SubjectModules.fromJson(v));
      });
    }
    currentTime = json['currentTime'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.responseStatus != null) {
      data['ResponseStatus'] = this.responseStatus.toJson();
    }
    data['abTestResult'] = this.abTestResult;
    if (this.district != null) {
      data['district'] = this.district.toJson();
    }
    if (this.subjectModules != null) {
      data['subjectModules'] =
          this.subjectModules.map((v) => v.toJson()).toList();
    }
    data['currentTime'] = this.currentTime;
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

class District {
  int districtId;
  String districtName;
  List<Groups> groups;

  District({this.districtId, this.districtName, this.groups});

  District.fromJson(Map<String, dynamic> json) {
    districtId = json['districtId'];
    districtName = json['districtName'];
    if (json['groups'] != null) {
      groups = new List<Groups>();
      json['groups'].forEach((v) {
        groups.add(new Groups.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['districtId'] = this.districtId;
    data['districtName'] = this.districtName;
    if (this.groups != null) {
      data['groups'] = this.groups.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Groups {
  String code;
  String name;
  String note;
  int type;

  Groups({this.code, this.name, this.note, this.type});

  Groups.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    name = json['name'];
    note = json['note'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['name'] = this.name;
    data['note'] = this.note;
    data['type'] = this.type;
    return data;
  }
}

class SubjectModules {
  int moduleType;
  int virtualType;
  SubjectOperationThemeItemDto subjectOperationThemeItemDto;

  SubjectModules(
      {this.moduleType, this.virtualType, this.subjectOperationThemeItemDto});

  SubjectModules.fromJson(Map<String, dynamic> json) {
    moduleType = json['moduleType'];
    virtualType = json['virtualType'];
    subjectOperationThemeItemDto = json['subjectOperationThemeItemDto'] != null
        ? new SubjectOperationThemeItemDto.fromJson(
        json['subjectOperationThemeItemDto'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moduleType'] = this.moduleType;
    data['virtualType'] = this.virtualType;
    if (this.subjectOperationThemeItemDto != null) {
      data['subjectOperationThemeItemDto'] =
          this.subjectOperationThemeItemDto.toJson();
    }
    return data;
  }
}

class SubjectOperationThemeItemDto {
  String title;
  int styleType;
  String moreTextForH5;
  String moreTextForApp;
  String moreTextForWx;
  String moreTextForMainWx;

  SubjectOperationThemeItemDto(
      {this.title,
        this.styleType,
        this.moreTextForH5,
        this.moreTextForApp,
        this.moreTextForWx,
        this.moreTextForMainWx});

  SubjectOperationThemeItemDto.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    styleType = json['styleType'];
    moreTextForH5 = json['moreTextForH5'];
    moreTextForApp = json['moreTextForApp'];
    moreTextForWx = json['moreTextForWx'];
    moreTextForMainWx = json['moreTextForMainWx'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['styleType'] = this.styleType;
    data['moreTextForH5'] = this.moreTextForH5;
    data['moreTextForApp'] = this.moreTextForApp;
    data['moreTextForWx'] = this.moreTextForWx;
    data['moreTextForMainWx'] = this.moreTextForMainWx;
    return data;
  }
}