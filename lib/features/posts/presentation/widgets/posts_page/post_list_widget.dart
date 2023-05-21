import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../helpers/helper.dart';
import '../../../domain/entities/post.dart';
import '../../pages/detail_post_page.dart';

class PostListWidget extends StatelessWidget {
  final List<Post> posts;
  const PostListWidget({Key? key, required this.posts}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          leading: Text("${posts[index].id}"),
          title: Text(
            posts[index].title,
            style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            posts[index].body,
            style: TextStyle(fontSize: 14.sp),
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 10.h),
          onTap: () {
            context.push(DetailPostPage(post: posts[index]));
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          thickness: 1,
        );
      },
    );
  }
}
