import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto/models/manage_todo.dart';
import 'package:tuto/models/todo_model.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key,
    required this.item,
    required this.index,
  });
  final ManageTodo item;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        checkColor: Colors.green,
        value: item.list[index].isCompleted,
        onChanged: (_) => {
          //todo
        },
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            item.list[index].title,
            style: TextStyle(
              fontSize: 20,
              decoration: item.list[index].isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            item.list[index].description,
            style: TextStyle(
              fontSize: 15,
              decoration: item.list[index].isCompleted
                  ? TextDecoration.lineThrough
                  : TextDecoration.none,
            ),
          ),
        ],
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          //todo
        },
      ),
      tileColor: item.list[index].isCompleted
          ? Colors.grey
          : switch (item.list[index].priority) {
              PriorityEnum.LOW => Colors.greenAccent,
              PriorityEnum.MEDIUM => Colors.orangeAccent,
              PriorityEnum.HIGHT => Colors.redAccent
            },
    );
  }
}
