import 'dart:math';

import 'package:flutter/material.dart';

class TodoCard extends StatefulWidget {
  const TodoCard(
      {super.key, required this.title, required this.delete, required this.id});
  final String title;
  final Function(String) delete;
  final String id;

  @override
  State<TodoCard> createState() => _TodoCardState();
}

class _TodoCardState extends State<TodoCard> {
  List<Color> listOfCardColors = [
    Colors.redAccent, //0
    Colors.greenAccent, //1
    Colors.yellowAccent //2
  ];
  Color cardColour = Colors.blue;

  @override
  void initState() {
    cardColour = listOfCardColors[Random().nextInt(3) //3 (0-2)
        ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: cardColour,
      title: Text(widget.title),
      subtitle: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Description"),
          Wrap(
            spacing: 4.0,
            runSpacing: -2.0,
            children: [
              Chip(
                label: Text(
                  "data",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              Chip(
                label: Text(
                  "data",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              Chip(
                label: Text(
                  "data",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              Chip(
                label: Text(
                  "data",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
              Chip(
                label: Text(
                  "data",
                  style: TextStyle(
                    fontSize: 12.0,
                  ),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      // leading: Icon(Icons.access_alarm_rounded),
      trailing: SizedBox(
        width: 80,
        child: Row(
          children: [
            const Icon(Icons.star_border_outlined),
            const SizedBox(
              width: 2,
            ),
            IconButton(
              onPressed: () {
                widget.delete(widget.id);
              },
              icon: const Icon(Icons.delete),
            )
          ],
        ),
      ),
    );
  }
}
