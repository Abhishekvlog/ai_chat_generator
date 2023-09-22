import '../../data/model/text_completion_model.dart';

abstract class TextCompletionRepository {
  Future<TextCompletionModel> getTextCompletion(String query);
}
