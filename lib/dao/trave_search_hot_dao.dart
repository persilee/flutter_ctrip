import 'dart:async';
import 'dart:convert';

import 'package:flutter_ctrip/model/travel_search_hot_model.dart';
import 'package:http/http.dart' as http;

//旅拍搜索接口

var Params = {"pageCode":"appSuggest","locationDistrictId":0,"lat":-180,"lon":-180,"head":{"cid":"09031043410934928682","ctok":"","cver":"1.0","lang":"01","sid":"8888","syscode":"09","auth":null,"extension":[{"name":"tecode","value":"h5"},{"name":"protocal","value":"https"}]},"contentType":"json"};
var Url = 'https://m.ctrip.com/restapi/soa2/16189/json/moduleListSearch?_fxpcqlniredt=09031043410934928682&__gw_appid=99999999&__gw_ver=1.0&__gw_from=10650016495&__gw_platform=H5';


class TravelSearchHotDao {
  static Future<TravelSearchHotModel> fetch() async {
    final response = await http.post(Url, body: jsonEncode(Params));
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      return TravelSearchHotModel.fromJson(result);
    } else {
      throw Exception('Failed to load travel');
    }
  }
}
