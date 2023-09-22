import 'package:chat_generator/features/text_completion/data/model/text_completionData.dart';

class TextCompletionModel {
  final num created;
  final List<TextCompletionData> choice;

  TextCompletionModel({required this.choice, required this.created});

  factory TextCompletionModel.fromJson(Map<String, dynamic> json) {
    final textGenerateItem = json['choice'] as List;
    List<TextCompletionData> choice = textGenerateItem
        .map((singleItem) => TextCompletionData.fromJson(singleItem))
        .toList();

    return TextCompletionModel(
        choice: choice,
        created: json['created']
    );
  }
}
