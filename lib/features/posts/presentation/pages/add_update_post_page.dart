import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../helpers/helper.dart';
import '../../../../core/util/snackbar_message.dart';
import '../../../../core/widget/loading_widget.dart';
import '../../domain/entities/post.dart';
import '../bloc/add_update_delete_posts/add_update_delete_posts_bloc.dart';
import '../widgets/add_update_post_page/form_widget.dart';
import 'posts_page.dart';

class AddUpdatePostPage extends StatelessWidget {
  final bool isUpdatePost;
  final Post? post;
  const AddUpdatePostPage({Key? key, required this.isUpdatePost, this.post})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(isUpdatePost ? "Edit Post" : "Add Post")),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child:
              BlocConsumer<AddUpdateDeletePostsBloc, AddUpdateDeletePostsState>(
            listener: (context, state) {
              if (state is DoneMessagePostsState) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);
                context.pushAndRemoveUntil(const PostsPage());
              } else if (state is ErrorPostsState) {
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingPostsState) {
                return const LoadingWidget();
              }
              return FormWidget(
                isUpdatePost: isUpdatePost,
                post: isUpdatePost ? post : null,
              );
            },
          ),
        ));
  }
}
