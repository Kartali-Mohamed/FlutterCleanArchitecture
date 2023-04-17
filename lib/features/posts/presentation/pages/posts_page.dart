import 'package:clean_architecture_app/core/widget/loading_widget.dart';
import 'package:clean_architecture_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:clean_architecture_app/features/posts/presentation/widgets/posts_page/message_display_widget.dart';
import 'package:clean_architecture_app/features/posts/presentation/widgets/posts_page/post_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'add_update_post_page.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Posts')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (_) => const AddUpdatePostPage(
                    isUpdatePost: false,
                  )));
        },
        child: const Icon(Icons.add),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocBuilder<PostsBloc, PostsState>(builder: ((context, state) {
          if (state is LoadingPostsState) {
            return const LoadingWidget();
          } else if (state is LoadedPostsState) {
            return RefreshIndicator(
                onRefresh: () {
                  return _onRefrech(context);
                },
                child: PostListWidget(posts: state.posts));
          } else if (state is ErrorPostsState) {
            return MessageDisplayWidget(message: state.message);
          }
          return const LoadingWidget();
        })),
      ),
    );
  }

  Future<void> _onRefrech(BuildContext context) async {
    BlocProvider.of<PostsBloc>(context).add(RefreshPostsEvent());
  }
}