import 'dart:async';
import 'dart:convert';

import 'package:flutter_ctrip/model/travel_search_model.dart';
import 'package:http/http.dart' as http;

//旅拍搜索接口

var Params = {
  "keyword": "五一",
  "locationDistrictId": 0,
  "lat": -180,
  "lon": -180,
  "head": {
    "cid": "09031043410934928682",
    "ctok": "",
    "cver": "1.0",
    "lang": "01",
    "sid": "8888",
    "syscode": "09",
    "auth": null,
    "extension": [
      {
        "name": "tecode",
        "value": "h5"
      },
      {
        "name": "protocal",
        "value": "https"
      }
    ]
  },
  "contentType": "json"
};



class TravelSearchDao {
  static Future<TravelSearchModel> fetch(
      String url, String keyword) async {
    Params['keyword'] = keyword;
    final response = await http.post(url, body: jsonEncode(Params));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      TravelSearchModel model = TravelSearchModel.fromJson(result);
      model.keyword = keyword;
      return model;
    } else {
      throw Exception('Failed to load travel');
    }
  }
}
