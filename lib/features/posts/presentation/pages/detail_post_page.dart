import '../../../../core/util/snackbar_message.dart';
import '../../../../core/widget/loading_widget.dart';
import '../../domain/entities/post.dart';
import '../bloc/add_update_delete_posts/add_update_delete_posts_bloc.dart';
import 'add_update_post_page.dart';
import 'posts_page.dart';
import '../widgets/detail_post_page/delete_alert_dialog_widget.dart';
import '../widgets/detail_post_page/edit_delete_button_widget.dart';
import '../widgets/detail_post_page/title_body_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPostPage extends StatelessWidget {
  final Post post;
  const DetailPostPage({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Post Detail")),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TitleBodyWidget(text: post.title, isTitle: true),
              const Divider(
                thickness: 1,
              ),
              TitleBodyWidget(text: post.body, isTitle: false),
              const Divider(
                thickness: 1,
              ),
              EditDeleteButtonWidget(
                  onEdit: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => AddUpdatePostPage(
                                  isUpdatePost: true,
                                  post: post,
                                )));
                  },
                  onDelete: () => deleteDialog(context)),
            ],
          ),
        ),
      ),
    );
  }

  void deleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) {
          return BlocConsumer<AddUpdateDeletePostsBloc,
              AddUpdateDeletePostsState>(
            listener: (context, state) {
              if (state is DoneMessagePostsState) {
                SnackBarMessage().showSuccessSnackBar(
                    message: state.message, context: context);
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (_) => const PostsPage()),
                    (route) => false);
              } else if (state is ErrorPostsState) {
                Navigator.of(context).pop();
                SnackBarMessage().showErrorSnackBar(
                    message: state.message, context: context);
              }
            },
            builder: (context, state) {
              if (state is LoadingPostsState) {
                return const AlertDialog(
                  title: LoadingWidget(),
                );
              }
              return DeleteAlertDialogWidget(
                postId: post.id!,
              );
            },
          );
        });
  }
}
