import 'package:mvvm_architecture/models/suggestion_model.dart';
import 'package:dio/dio.dart';

class ApiService {
  Future<SuggestionModel> getSuggestion() async {
    try {
      final response =
          await Dio().get("https://www.boredapi.com/api/activity/");
      return SuggestionModel.fromJson(response.data);
    } catch (e) {
      throw Exception(e);
    }
  }
}
