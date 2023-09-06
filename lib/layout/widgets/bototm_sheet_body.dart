import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/shared/components/default_text_field.dart';

import '../../models/task_model.dart';
import '../../shared/network/firebase/firebase_function.dart';

class BototmSheetBody extends StatelessWidget {
  const BototmSheetBody({super.key});

  @override
  Widget build(BuildContext context) {
    var titleController = TextEditingController();
    var descriptionController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 13),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Add new Task',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'title',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            DefalutTextField(
                textController: titleController,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'must title not empty';
                  } else if (value.trim().length < 5) {
                    return 'must value getter than 5';
                  } else {
                    return null;
                  }
                },
                hitText: 'add your title'),
            const SizedBox(height: 10),
            Text(
              'description',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            DefalutTextField(
              textController: descriptionController,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'must title not empty';
                } else {
                  return null;
                }
              },
              hitText: 'add your description',
              maxLines: 4,
            ),
            const SizedBox(height: 10),
            Text(
              'select time',
              textAlign: TextAlign.start,
              style: GoogleFonts.poppins(
                  fontSize: 20, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () {
                timeBiker(context);
              },
              child: Text(
                '30 april 2023',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    TaskModel taskModel = TaskModel(
                      title: titleController.text,
                      description: descriptionController.text,
                      isDone: false,
                      dateTime: DateTime.now(),
                    );
                    FirebaseFunction.addTask(taskModel);
                    print('done ya man');
                  }
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Add task',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }

  timeBiker(context) {
    showDatePicker(
        context: context,
        firstDate: DateTime.now(),
        lastDate: DateTime.now().add(const Duration(days: 364)),
        initialDate: DateTime.now());
  }
}
