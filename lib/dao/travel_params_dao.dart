import 'dart:async';
import 'dart:convert';
import 'package:flutter_ctrip/model/travel_params_model.dart';
import 'package:http/http.dart' as http;

//旅拍类别接口
class TravelParamsDao {
  static Future<TravelParamsModel> fetch() async {
    final response = await http
        .get('http://www.devio.org/io/flutter_app/json/travel_page.json');
    if (response.statusCode == 200) {
      Utf8Decoder utf8decoder = Utf8Decoder(); // fix 中文乱码
      var result = json.decode(utf8decoder.convert(response.bodyBytes));
      print(result);
      return TravelParamsModel.fromJson(result);
    } else {
      throw Exception('Failed to load travel_page.json');
    }
  }
}
