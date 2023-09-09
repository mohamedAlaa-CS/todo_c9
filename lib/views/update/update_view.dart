import 'package:flutter/material.dart';
import 'package:todo_app/core/my_theme.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/shared/components/app_bar.dart';
import 'package:todo_app/shared/components/default_text_field.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';

class UpdateView extends StatelessWidget {
  static const String routeName = 'update_View';
  UpdateView({super.key});
  var titleController = TextEditingController();
  var descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var data = ModalRoute.of(context)!.settings.arguments as TaskModel;
    titleController.text = data.title!;
    descriptionController.text = data.description!;
    return Scaffold(
      body: Stack(
        children: [
          const CustomAppBar(title: 'To Do List'),
          Center(
            child: Container(
              margin: EdgeInsets.only(
                  top: mediaQuery.height / 6.5,
                  bottom: mediaQuery.height / 9.5,
                  left: mediaQuery.width / 13,
                  right: mediaQuery.width / 13),
              decoration: BoxDecoration(
                color: theme.canvasColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 24),
                child: SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Edit Task',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: mediaQuery.height / 24,
                      ),
                      const Text('title',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: mediaQuery.height / 30,
                      ),
                      CustomTextField(
                        textController: titleController,
                      ),
                      SizedBox(
                        height: mediaQuery.height / 40,
                      ),
                      const Text('description',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: mediaQuery.height / 30,
                      ),
                      CustomTextField(
                        textController: descriptionController,
                      ),
                      SizedBox(
                        height: mediaQuery.height / 40,
                      ),
                      const Text(
                        'Selected time',
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: mediaQuery.height / 30,
                      ),
                      const Text(
                        '27-6-2023',
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: mediaQuery.height / 20,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Apptheme.primaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16)),
                        ),
                        onPressed: () {
                          FirebaseFunction.updateTask(
                                  id: data.id!,
                                  title: titleController.text,
                                  description: descriptionController.text)
                              .then((value) => Navigator.of(context).pop())
                              .catchError((erroe) {
                            print('somrthing error.. $erroe');
                          });
                        },
                        child: const Text(
                          'Save Change',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: mediaQuery.height / 30,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
