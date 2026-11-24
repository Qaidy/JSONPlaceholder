import 'package:flutter/material.dart';
import 'package:jsonplaceholder/service/api_service.dart';
import 'package:jsonplaceholder/widget/async_data_view.dart';
import 'package:jsonplaceholder/widget/comment_widget.dart';

class CommentsTab extends StatelessWidget {
  final Function(int count)? onCountLoaded;
  const CommentsTab({super.key, this.onCountLoaded});

  @override
  Widget build(BuildContext context) {
    return AsyncDataView(
      onFetch: () async {
        final comments = await ApiService.fetchComments();
        onCountLoaded?.call(comments.length);
        return comments;
      },
      itemBuilder: (context, comments, index) {
        return CommentWidget(comments: comments);
      },
      title: 'Comments',
    );
  }
}
