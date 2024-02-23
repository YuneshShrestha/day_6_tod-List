import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_day6/screen/add_screen.dart';
import 'package:todo_list_day6/widgets/theme_builder.dart';
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
        var elementId = id;

        return element['id'] == elementId;
      });
    });
  }

  var showOnlyImportant = false;

  @override
  Widget build(BuildContext context) {
    bool isLandScape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    var appBar = AppBar(
      title: const Text("Todo App"),
      actions: [
        isLandScape
            ? Switch(
                value: showOnlyImportant,
                onChanged: (data) {
                  setState(() {
                    showOnlyImportant = data;
                  });
                },
              )
            : const SizedBox(),
        IconButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AddScreen.route).then((value) {
              if (value != null) {
                setState(() {
                  listOfTodoCard.add(
                    {
                      "id": DateTime.now().toString(),
                      "title": value,
                    },
                  );
                });
              }
            });
          },
          icon: const Icon(Icons.add),
        ),
      ],
    );
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Starred Items
            if ((isLandScape && showOnlyImportant) || !isLandScape)
              Container(
                color: Colors.yellow,
                height: (MediaQuery.of(context).size.height -
                        appBar.preferredSize.height -
                        MediaQuery.of(context).padding.top) /
                    2,
                child: const SingleChildScrollView(
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
              ),

            //  List of items
            if ((isLandScape && !showOnlyImportant) || !isLandScape)
              Column(
                children: [
                  ...listOfTodoCard.map((mapOfItems) {
                    return TodoCard(
                      key: ValueKey(mapOfItems['id']),
                      title: mapOfItems['title'],
                      id: mapOfItems['id'],
                      delete: delete,
                    );
                  }),
                ],
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Theme.of(context).set
          ThemeBuilder.of(context).changeTheme();
        },
        child: const Icon(Icons.light_mode),
      ),
    );
  }
}
