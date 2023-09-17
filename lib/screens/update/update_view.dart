import 'package:flutter/material.dart';
import 'package:todo_app/core/style/my_theme.dart';
import 'package:todo_app/models/task_model.dart';
import 'package:todo_app/shared/components/app_bar.dart';
import 'package:todo_app/shared/components/default_text_field.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class UpdateView extends StatefulWidget {
  static const String routeName = 'update_View';
  UpdateView({super.key});

  @override
  State<UpdateView> createState() => _UpdateViewState();
}

class _UpdateViewState extends State<UpdateView> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var localization = AppLocalizations.of(context)!;
    var data = ModalRoute.of(context)!.settings.arguments as TaskModel;
    return Scaffold(
      body: Stack(
        children: [
          CustomAppBar(title: localization.toDoList),
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
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(localization.editTask,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: mediaQuery.height / 24,
                      ),
                      Text(localization.title,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: mediaQuery.height / 30,
                      ),
                      CustomTextField(
                        initialValue: data.title,
                        onChanged: (value) {
                          data.title = value;
                        },
                      ),
                      SizedBox(
                        height: mediaQuery.height / 40,
                      ),
                      Text(localization.description,
                          style: const TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: mediaQuery.height / 30,
                      ),
                      CustomTextField(
                        initialValue: data.description,
                        onChanged: (value) {
                          data.description = value;
                        },
                      ),
                      SizedBox(
                        height: mediaQuery.height / 40,
                      ),
                      Text(
                        localization.selectDate,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: mediaQuery.height / 30,
                      ),
                      InkWell(
                        onTap: () async {
                          DateTime? chooseDate = await showDatePicker(
                              context: context,
                              firstDate: DateTime.now(),
                              lastDate:
                                  DateTime.now().add(const Duration(days: 365)),
                              initialDate: data.dateTime!);
                          if (chooseDate != null) {
                            data.dateTime = chooseDate;
                            setState(() {});
                          }
                        },
                        child: Text(
                          data.dateTime.toString().substring(0, 10),
                          textAlign: TextAlign.center,
                        ),
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
                          FirebaseFunction.updateTask(taskModel: data)
                              .then((value) => Navigator.of(context).pop())
                              .catchError((erroe) {
                            print('somrthing error.. $erroe');
                          });
                        },
                        child: Text(
                          localization.saveChange,
                          style: const TextStyle(
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
