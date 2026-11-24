import 'package:flutter/material.dart';
import 'package:jsonplaceholder/service/api_service.dart';
import 'package:jsonplaceholder/widget/async_data_view.dart';
import 'package:jsonplaceholder/widget/user_widget.dart';

class UsersTab extends StatelessWidget {
  final Function(int count)? onCountLoaded;
  const UsersTab({super.key, this.onCountLoaded});

  @override
  Widget build(BuildContext context) {
    return AsyncDataView(
      onFetch: () async {
        final users = await ApiService.fetchUsers();
        onCountLoaded?.call(users.length);
        return users;
      },
      itemBuilder: (context, users, index) {
        return UserWidget(users: users);
      },
      title: 'Users',
    );
  }
}
