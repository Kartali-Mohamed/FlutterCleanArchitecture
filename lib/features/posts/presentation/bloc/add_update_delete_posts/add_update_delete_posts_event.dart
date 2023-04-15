part of 'add_update_delete_posts_bloc.dart';

abstract class AddUpdateDeletePostsEvent extends Equatable {
  const AddUpdateDeletePostsEvent();

  @override
  List<Object> get props => [];
}

class AddPostEvent extends AddUpdateDeletePostsEvent {
  final Post post;

  const AddPostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class UpdatePostEvent extends AddUpdateDeletePostsEvent {
  final Post post;

  const UpdatePostEvent({required this.post});

  @override
  List<Object> get props => [post];
}

class DeletePostEvent extends AddUpdateDeletePostsEvent {
  final int postId;

  const DeletePostEvent({required this.postId});

  @override
  List<Object> get props => [postId];
}
