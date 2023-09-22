import 'package:chat_generator/features/text_completion/data/model/text_completion_model.dart';
import 'package:chat_generator/features/text_completion/data/remote_data_saurce/text_completion_remote_data_source.dart';
import 'package:chat_generator/features/text_completion/domain/repositories/text_completion_repositorie.dart';

class TextCompletionRepositoryImpl implements TextCompletionRepository{
  final TextCompletionRemoteDataSource remoteDataSource;
  TextCompletionRepositoryImpl({required this.remoteDataSource});

  @override
  Future<TextCompletionModel> getTextCompletion(String query) async =>
    remoteDataSource.getTextCompletion(query);

}