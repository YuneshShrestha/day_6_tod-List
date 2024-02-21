import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_day6/screen/add_screen.dart';
import 'package:todo_list_day6/widgets/todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const route = "/";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // String title = "default";
  List listOfTodoCard = [];

  void delete(String id) {
    setState(() {
      listOfTodoCard.removeWhere((element) {
        return element['id'] == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // print("Screen Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Todo App"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AddScreen.route).then((value) {
                setState(() {
                  listOfTodoCard.add(
                    {
                      "id": DateTime.now().toString(),
                      "title": value,
                    },
                  );
                });
              });
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Starred Items
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Chip(
                      label: Text("Hello"),
                    ),
                  ],
                ),
              ),
            ),
            //  List of items

            ...listOfTodoCard.map((mapOfItems) {
              return TodoCard(
                title: mapOfItems['title'],
                id: mapOfItems['id'],
                delete: delete,
              );
            }),
          ],
        ),
      ),
    );
  }
}
