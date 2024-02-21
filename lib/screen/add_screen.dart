import 'package:flutter/material.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});
  static const route = "/add";

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> key = GlobalKey<FormState>();
    TextEditingController controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Form(
        key: key,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextFormField(
                controller: controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Title",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please Enter Value';
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    if (key.currentState!.validate()) {
                      Navigator.of(context).pop(controller.value.text);
                    }
                  },
                  child: const Text("Save"))
            ],
          ),
        ),
      ),
    );
  }
}
