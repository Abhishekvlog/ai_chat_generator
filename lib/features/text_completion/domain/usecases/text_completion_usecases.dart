
import 'package:chat_generator/features/text_completion/domain/repositories/text_completion_repositorie.dart';

import '../../data/model/text_completion_model.dart';

class TextCompletionUseCases{
  final TextCompletionRepository repository;
  TextCompletionUseCases({required this.repository});

  Future<TextCompletionModel> call(String query) async{
    return repository.getTextCompletion(query);
  }
}