import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto/models/manage_todo.dart';
import 'package:tuto/views/add_todo/add_todo.dart';
import 'package:tuto/views/home/widgets/todo_tile.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        elevation: 30,
      ),
      body: Consumer<ManageTodo>(
        builder: (context, item, child) {
          return item.list.isNotEmpty
              ? ListView.builder(
                  itemCount: item.list.length,
                  itemBuilder: (BuildContext context, index) {
                    return TodoTile(item: item, index: index);
                  })
              : const Center(
                  child: Text("No todo"),
                );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddTodo()));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
