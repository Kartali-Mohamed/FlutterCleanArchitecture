import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import '../../../../../core/error/failures.dart';
import '../../../../../core/strings/failures.dart';
import '../../../../../core/strings/messages.dart';
import '../../../domain/entities/post.dart';
import '../../../domain/usecases/add_post.dart';
import '../../../domain/usecases/delete_post.dart';
import '../../../domain/usecases/update_post.dart';

part 'add_update_delete_posts_event.dart';
part 'add_update_delete_posts_state.dart';

class AddUpdateDeletePostsBloc
    extends Bloc<AddUpdateDeletePostsEvent, AddUpdateDeletePostsState> {
  final AddPostUseCase addPost;
  final UpdatePostUseCase updatePost;
  final DeletePostUseCase deletePost;
  AddUpdateDeletePostsBloc({
    required this.addPost,
    required this.updatePost,
    required this.deletePost,
  }) : super(AddUpdateDeletePostsInitial()) {
    on<AddUpdateDeletePostsEvent>((event, emit) async {
      if (event is AddPostEvent) {
        emit(LoadingPostsState());

        final response = await addPost(event.post);

        emit(
          _eitherDoneMessageOrErrorState(response, ADD_SUCCESS_MESSAGE),
        );
      } else if (event is UpdatePostEvent) {
        emit(LoadingPostsState());

        final response = await updatePost(event.post);

        emit(
          _eitherDoneMessageOrErrorState(response, UPDATE_SUCCESS_MESSAGE),
        );
      } else if (event is DeletePostEvent) {
        emit(LoadingPostsState());

        final response = await deletePost(event.postId);

        emit(
          _eitherDoneMessageOrErrorState(response, DELETE_SUCCESS_MESSAGE),
        );
      }
    });
  }

  AddUpdateDeletePostsState _eitherDoneMessageOrErrorState(
      Either<Failure, Unit> either, String message) {
    return either.fold(
      (failure) => ErrorPostsState(message: _mapFailureToMessage(failure)),
      (unit) => DoneMessagePostsState(message: message),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServeurFailure:
        return SERVER_FAILURE_MESSAGE;
      case OfflineFailure:
        return OFFLINE_FAILURE_MESSAGE;
      default:
        return "Unexpected Error , Please try again later";
    }
  }
}
