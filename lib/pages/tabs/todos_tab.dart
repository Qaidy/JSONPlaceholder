import 'package:flutter/material.dart';
import 'package:jsonplaceholder/service/api_service.dart';
import 'package:jsonplaceholder/widget/async_data_view.dart';
import 'package:jsonplaceholder/widget/todo_widget.dart';

class TodosTab extends StatelessWidget {
  final Function(int count)? onCountLoaded;
  const TodosTab({super.key, this.onCountLoaded});

  @override
  Widget build(BuildContext context) {
    return AsyncDataView(
      onFetch: () async {
        final todos = await ApiService.fetchTodos();
        onCountLoaded?.call(todos.length);
        return todos;
      },
      itemBuilder: (context, todos, index) {
        return TodoWidget(todos: todos);
      },
      title: 'Todos',
    );
  }
}
