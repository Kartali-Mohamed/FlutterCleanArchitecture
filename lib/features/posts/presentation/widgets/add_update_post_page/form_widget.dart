import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/post.dart';
import '../../bloc/add_update_delete_posts/add_update_delete_posts_bloc.dart';
import 'submit_button.dart';
import 'text_form_field_widget.dart';

class FormWidget extends StatefulWidget {
  final bool isUpdatePost;
  final Post? post;
  const FormWidget({Key? key, required this.isUpdatePost, this.post})
      : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    if (widget.isUpdatePost) {
      titleController.text = widget.post!.title;
      bodyController.text = widget.post!.body;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormFieldWidget(
              controller: titleController, name: "Title", multiLines: false),
          TextFormFieldWidget(
              controller: bodyController, name: "Body", multiLines: true),
          SubmitButton(
            onPressed: validateFormThenUpdateOrAddPost,
            isUpdatePost: widget.isUpdatePost,
          ),
        ],
      ),
    );
  }

  void validateFormThenUpdateOrAddPost() {
    final bool isValid = _formKey.currentState!.validate();

    if (isValid) {
      final post = Post(
          id: widget.isUpdatePost ? widget.post!.id : null,
          title: titleController.text,
          body: bodyController.text);

      if (widget.isUpdatePost) {
        BlocProvider.of<AddUpdateDeletePostsBloc>(context)
            .add(UpdatePostEvent(post: post));
      } else {
        BlocProvider.of<AddUpdateDeletePostsBloc>(context)
            .add(AddPostEvent(post: post));
      }
    }
  }
}
