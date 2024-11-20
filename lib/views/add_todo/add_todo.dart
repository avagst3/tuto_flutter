import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tuto/models/manage_todo.dart';
import 'package:tuto/models/todo_model.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State<AddTodo> createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  TextEditingController _titleControler = TextEditingController();
  TextEditingController _descriptionControler = TextEditingController();
  PriorityEnum priorityEnum = PriorityEnum.LOW;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
        elevation: 30,
      ),
      body: Center(
        child: Container(
          height: 500,
          width: 400,
          decoration: BoxDecoration(
              color: Colors.blueGrey.withOpacity(0.1),
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  "Add Todo",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    width: 300,
                    child: TextField(
                      controller: _titleControler,
                      decoration: InputDecoration(
                        hintText: "Title",
                        filled: true,
                        fillColor: Colors.white30,
                        hoverColor: Colors.white30,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 20),
                    width: 300,
                    child: TextField(
                      controller: _descriptionControler,
                      decoration: InputDecoration(
                        hintText: "Description",
                        filled: true,
                        fillColor: Colors.white30,
                        hoverColor: Colors.white30,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  DropdownButton<PriorityEnum>(
                    borderRadius: BorderRadius.circular(10),
                    items: PriorityEnum.values.map((PriorityEnum priority) {
                      return DropdownMenuItem<PriorityEnum>(
                        value: priority,
                        child: Text(priority.name),
                      );
                    }).toList(),
                    value: priorityEnum,
                    onChanged: (PriorityEnum? newPriority) {
                      setState(() {
                        priorityEnum = newPriority!;
                      });
                    },
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: FilledButton(
                  style: FilledButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    context.read<ManageTodo>().addItem(
                          TodoItem(
                              title: _titleControler.text,
                              description: _descriptionControler.text,
                              priority: priorityEnum,
                              isCompleted: false),
                        );
                    Navigator.pop(context);
                  },
                  child: Text(
                    "add todo",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
