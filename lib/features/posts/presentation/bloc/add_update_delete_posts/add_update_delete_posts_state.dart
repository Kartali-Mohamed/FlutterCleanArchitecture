part of 'add_update_delete_posts_bloc.dart';

abstract class AddUpdateDeletePostsState extends Equatable {
  const AddUpdateDeletePostsState();

  @override
  List<Object> get props => [];
}

class AddUpdateDeletePostsInitial extends AddUpdateDeletePostsState {}

class LoadingPostsState extends AddUpdateDeletePostsState {}

class ErrorPostsState extends AddUpdateDeletePostsState {
  final String message;

  const ErrorPostsState({required this.message});

  @override
  List<Object> get props => [message];
}

class DoneMessagePostsState extends AddUpdateDeletePostsState {
  final String message;

  const DoneMessagePostsState({required this.message});

  @override
  List<Object> get props => [message];
}
