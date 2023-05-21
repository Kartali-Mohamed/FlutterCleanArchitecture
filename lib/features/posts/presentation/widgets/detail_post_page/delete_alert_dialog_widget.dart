import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../helpers/helper.dart';
import '../../bloc/add_update_delete_posts/add_update_delete_posts_bloc.dart';

class DeleteAlertDialogWidget extends StatelessWidget {
  final int postId;
  const DeleteAlertDialogWidget({Key? key, required this.postId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Are you sure?"),
      actions: [
        TextButton(
            onPressed: () {
              context.pop();
            },
            child: const Text("No")),
        TextButton(
            onPressed: () {
              BlocProvider.of<AddUpdateDeletePostsBloc>(context)
                  .add(DeletePostEvent(postId: postId));
            },
            child: const Text("Yes")),
      ],
    );
  }
}
