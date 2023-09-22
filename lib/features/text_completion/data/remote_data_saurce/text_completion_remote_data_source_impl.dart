import 'dart:convert';

import 'package:chat_generator/core/custom_exceptions.dart';
import 'package:chat_generator/core/open_ai_data.dart';
import 'package:chat_generator/features/text_completion/data/model/text_completion_model.dart';
import 'package:chat_generator/features/text_completion/data/remote_data_saurce/text_completion_remote_data_source.dart';
import 'package:http/http.dart' as http;

class TextCompletionRemoteDataSourceImpl implements TextCompletionRemoteDataSource {


  final http.Client httpClient;

  TextCompletionRemoteDataSourceImpl({required this.httpClient});

  String _endPoints(String endpoint) => "$baseUrl/$endpoint";

  Map<String, String> _headerBarerOption(String token) =>
      {
        "Contant-Type": "applicaiton/josn",
        'Aunthication': 'Bearer $token'
      };

  @override
  Future<TextCompletionModel> getTextCompletion(String query) async {
    final String endpoint = "completions";

    Map<String, String> rowParams = {
      "model": "text-davinci-003",
      "prompt": query,
    };

    final encodedParams = json.encode(rowParams);

    final response = await httpClient.post(
      Uri.parse(_endPoints(endpoint)),
      body: encodedParams,
      headers: _headerBarerOption(OPEN_API_AI),
    );

    if(response.statusCode == 200){
      return TextCompletionModel.fromJson(json.decode(response.body));
    }
    else{
      throw ServerException(message : "Text Completions Server Exception");
    }
  }

}