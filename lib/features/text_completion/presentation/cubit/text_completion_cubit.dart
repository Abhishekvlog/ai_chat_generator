import 'dart:io';

import 'package:chat_generator/core/custom_exceptions.dart';
import 'package:chat_generator/features/text_completion/data/model/text_completion_model.dart';
import 'package:chat_generator/features/text_completion/domain/usecases/text_completion_usecases.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'text_completion_state.dart';

class TextCompletionCubit extends Cubit<TextCompletionState> {
  final TextCompletionUseCases textCompletionUseCases;
  TextCompletionCubit({required this.textCompletionUseCases}) : super(TextCompletionInitial());

  Future<void> textCompletion({required String query}) async {
    emit(TextCompletionLoading());
    try{
      final textCompletionModelData = await textCompletionUseCases.call(query);
      emit(TextCompletionLoaded(textCompletionModelData: textCompletionModelData));
    }on SocketException catch(e){
      emit(TextCompletionFailure(errorMessage: e.message));
    } on ServerException catch(e){
      emit(TextCompletionFailure(errorMessage: e.message));
    }
  }
}
