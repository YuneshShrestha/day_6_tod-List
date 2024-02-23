import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:todo_list_day6/screen/add_screen.dart';
import 'package:todo_list_day6/widgets/themeBuilder.dart';
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

  bool showStarredItems = false;

  @override
  Widget build(BuildContext context) {
    final md = MediaQuery.of(context);

    var isLandScape = md.orientation == Orientation.landscape ? true : false;
    var appBar = AppBar(
      title: Text(
        "Todo App",
        style: Theme.of(context).textTheme.displayLarge,
      ),
      actions: [
        if (isLandScape)
          Switch.adaptive(
              value: showStarredItems,
              onChanged: (val) {
                setState(() {
                  showStarredItems = val;
                });
              }),
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

    final actualHeight =
        md.size.height - appBar.preferredSize.height - md.padding.top;
    return Scaffold(
      appBar: appBar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Starred Items
            if ((isLandScape && showStarredItems) || !isLandScape)
              Container(
                height: actualHeight / 4,
                color: Colors.amber,
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
            if ((isLandScape && !showStarredItems) || !isLandScape)
              Column(
                children: [
                  ...listOfTodoCard.map((mapOfItems) {
                    return TodoCard(
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
          ThemeBuilder.of(context).changeTheme();
        },
        child: const Icon(
          Icons.light_mode,
        ),
      ),
    );
  }
}
