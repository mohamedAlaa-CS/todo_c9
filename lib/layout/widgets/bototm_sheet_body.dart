import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/shared/components/default_text_field.dart';

import '../../models/task_model.dart';
import '../../shared/network/firebase/firebase_function.dart';

class BototmSheetBody extends StatefulWidget {
  @override
  State<BototmSheetBody> createState() => _BototmSheetBodyState();
}

class _BototmSheetBodyState extends State<BototmSheetBody> {
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;

    return Padding(
      padding: EdgeInsets.only(
          left: mediaQuery.width / 40,
          right: mediaQuery.width / 40,
          top: mediaQuery.height / 50,
          bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Form(
        key: formKey,
        child: SingleChildScrollView(
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
              SizedBox(height: mediaQuery.height / 70),
              Text(
                'title',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: mediaQuery.height / 80),
              CustomTextField(
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
              SizedBox(height: mediaQuery.height / 70),
              Text(
                'description',
                textAlign: TextAlign.start,
                style: GoogleFonts.poppins(
                    fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: mediaQuery.height / 80),
              CustomTextField(
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
              SizedBox(height: mediaQuery.height / 70),
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
              SizedBox(height: mediaQuery.height / 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      TaskModel taskModel = TaskModel(
                        title: titleController.text,
                        description: descriptionController.text,
                        isDone: false,
                        dateTime: DateTime.now(),
                      );
                      FirebaseFunction.addTask(taskModel);
                      Navigator.of(context).pop();
                      print('done ya man');
                    }
                  },
                  
                  child: const Text(
                    'Add task',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )),
                  SizedBox(height: mediaQuery.height/50,)
            ],
          ),
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
