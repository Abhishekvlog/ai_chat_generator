import 'package:chat_generator/features/text_completion/data/remote_data_saurce/text_completion_remote_data_source.dart';
import 'package:chat_generator/features/text_completion/data/remote_data_saurce/text_completion_remote_data_source_impl.dart';
import 'package:chat_generator/features/text_completion/data/repositories/text_completin_repositorey_impl.dart';
import 'package:chat_generator/features/text_completion/domain/repositories/text_completion_repositorie.dart';
import 'package:chat_generator/features/text_completion/domain/usecases/text_completion_usecases.dart';
import 'package:chat_generator/features/text_completion/presentation/cubit/text_completion_cubit.dart';
import 'package:chat_generator/injection_container.dart';

Future<void> textCompletionInjectionContainer() async {

  // future bloc
  sl.registerFactory<TextCompletionCubit>(
      () => TextCompletionCubit(textCompletionUseCases: sl.call()));

  // useCase
  sl.registerLazySingleton<TextCompletionUseCases>(
      () => TextCompletionUseCases(repository: sl.call()));

  // repository
  sl.registerLazySingleton<TextCompletionRepository>(
      () => TextCompletionRepositoryImpl(
            remoteDataSource: sl.call(),
          ));

  // remote data
  sl.registerLazySingleton<TextCompletionRemoteDataSource>(
      () => TextCompletionRemoteDataSourceImpl(
            httpClient: sl.call(),
          ));
}
