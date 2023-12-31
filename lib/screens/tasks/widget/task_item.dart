import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/style/my_theme.dart';
import 'package:todo_app/core/provider/my_provider.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import 'package:todo_app/screens/update/update_view.dart';

import '../../../models/task_model.dart';

class TaskItem extends StatefulWidget {
  const TaskItem({required this.taskModel, super.key});
  final TaskModel taskModel;

  @override
  State<TaskItem> createState() => _TaskItemState();
}

class _TaskItemState extends State<TaskItem> {
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);
    return Card(
      color: theme.canvasColor,
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      elevation: 8,
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          extentRatio: 0.2,
          children: [
            SlidableAction(
              borderRadius: provider.language == 'en'
                  ? const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      bottomLeft: Radius.circular(16))
                  : const BorderRadius.only(
                      topRight: Radius.circular(16),
                      bottomRight: Radius.circular(16)),
              flex: 2,
              onPressed: (context) {
                Navigator.of(context).pushNamed(UpdateView.routeName,
                    arguments: widget.taskModel);
              },
              backgroundColor: Colors.green,
              foregroundColor: Colors.white,
              icon: Icons.update,
              label: 'update',
            ),
          ],
        ),
        endActionPane: ActionPane(
            motion: const StretchMotion(),
            extentRatio: 0.2,
            children: [
              SlidableAction(
                borderRadius: provider.language == 'en'
                    ? const BorderRadius.only(
                        topRight: Radius.circular(16),
                        bottomRight: Radius.circular(16))
                    : const BorderRadius.only(
                        topLeft: Radius.circular(16),
                        bottomLeft: Radius.circular(16)),
                flex: 2,
                onPressed: (context) {
                  FirebaseFunction.deletTask(widget.taskModel.id);
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ]),
        child: Container(
          //margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: EdgeInsets.symmetric(
              horizontal: mediaQuery.width / 25,
              vertical: mediaQuery.width / 24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: theme.canvasColor,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: mediaQuery.height / 10,
                width: mediaQuery.width / 100,
                decoration: BoxDecoration(
                    color: widget.taskModel.isDone == false
                        ? Apptheme.primaryColor
                        : Colors.green,
                    borderRadius: BorderRadius.circular(4)),
              ),
              SizedBox(
                width: mediaQuery.width / 25,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.64,
                    child: Text(
                      widget.taskModel.title!,
                      style: GoogleFonts.poppins(
                          fontSize: 17,
                          color: widget.taskModel.isDone == false
                              ? Apptheme.primaryColor
                              : Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Text(
                      widget.taskModel.description!,
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        color: provider.themeMode == ThemeMode.light
                            ? Colors.black
                            : Colors.white,
                        Icons.timer_outlined,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4.8,
                      ),
                      Text('10:30 am', style: theme.textTheme.bodyMedium),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              InkWell(
                  onTap: () {
                    FirebaseFunction.updateIsDone(widget.taskModel);
                    setState(() {});
                  },
                  child: widget.taskModel.isDone == false
                      ? Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: mediaQuery.width / 24),
                          decoration: BoxDecoration(
                            color: Apptheme.primaryColor,
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: const Icon(
                            Icons.check,
                            size: 40,
                            color: Colors.white,
                          ),
                        )
                      : const Text(
                          'Done !',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        )),
            ],
          ),
        ),
      ),
    );
  }
}
