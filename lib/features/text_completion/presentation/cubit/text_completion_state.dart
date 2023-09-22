part of 'text_completion_cubit.dart';

abstract class TextCompletionState extends Equatable{
  const TextCompletionState();
}
class TextCompletionInitial extends TextCompletionState{
  @override
  List<Object?> get props => [];
}

class TextCompletionLoading extends TextCompletionState{
  @override
  List<Object?> get props => [];
}

class TextCompletionLoaded extends TextCompletionState{
  final TextCompletionModel? textCompletionModelData;

  TextCompletionLoaded({this.textCompletionModelData});
  @override
  List<Object?> get props => [];
}
class TextCompletionFailure extends TextCompletionState{
  final String? errorMessage;
  TextCompletionFailure({this.errorMessage});
  @override
  List<Object?> get props => [];
}