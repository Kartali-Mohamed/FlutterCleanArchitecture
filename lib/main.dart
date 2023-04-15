import 'package:clean_architecture_app/core/app_theme.dart';
import 'package:clean_architecture_app/features/posts/presentation/bloc/add_update_delete_posts/add_update_delete_posts_bloc.dart';
import 'package:clean_architecture_app/features/posts/presentation/bloc/posts/posts_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => di.sl<PostsBloc>()),
          BlocProvider(create: (_) => di.sl<AddUpdateDeletePostsBloc>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: appTheme,
          title: 'Posts App',
          home: Scaffold(
            appBar: AppBar(
              title: const Text("Posts"),
            ),
            body: const Center(
              child: Text("Hello Word"),
            ),
          ),
        ));
  }
}
