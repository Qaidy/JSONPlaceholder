import 'package:flutter/material.dart';
import 'package:jsonplaceholder/service/api_service.dart';
import 'package:jsonplaceholder/widget/async_data_view.dart';
import 'package:jsonplaceholder/widget/post_widget.dart';

class PostsTab extends StatelessWidget {
  final Function(int count)? onCountLoaded;
  const PostsTab({super.key, this.onCountLoaded});

  @override
  Widget build(BuildContext context) {
    return AsyncDataView(
      onFetch: () async {
        final posts = await ApiService.fetchPosts();
        onCountLoaded?.call(posts.length);
        return posts;
      },
      itemBuilder: (context, posts, index) {
        return PostWidget(posts: posts);
      },
      title: 'Posts',
    );
  }
}
