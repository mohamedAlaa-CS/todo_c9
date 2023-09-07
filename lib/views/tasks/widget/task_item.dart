import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/my_theme.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import 'package:todo_app/views/update/update_view.dart';

import '../../../models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({required this.taskModel, super.key});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 8,
      child: Slidable(
        key: const ValueKey(0),
        startActionPane: ActionPane(
          motion: const StretchMotion(),
          extentRatio: 0.2,
          children: [
            SlidableAction(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16)),
              flex: 2,
              onPressed: (context) {
                Navigator.of(context)
                    .pushNamed(UpdateView.routeName, arguments: taskModel);
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
                borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(16),
                    bottomRight: Radius.circular(16)),
                flex: 2,
                onPressed: (context) {
                  FirebaseFunction.deletTask(taskModel.id);
                },
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                icon: Icons.delete,
                label: 'Delete',
              ),
            ]),
        child: Container(
          //margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 4,
                decoration: BoxDecoration(
                    color: Apptheme.primaryColor,
                    borderRadius: BorderRadius.circular(4)),
              ),
              const SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.7,
                    child: Text(
                      taskModel.title!,
                      style: GoogleFonts.poppins(
                          fontSize: 20,
                          color: Apptheme.primaryColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.8,
                    child: Text(
                      taskModel.description!,
                      style: GoogleFonts.poppins(
                        fontSize: 17,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.timer_outlined,
                        size: 20,
                      ),
                      const SizedBox(
                        width: 4.8,
                      ),
                      Text(
                        '10:30 am',
                        style: GoogleFonts.roboto(
                            fontWeight: FontWeight.normal,
                            fontSize: 12,
                            color: Colors.black),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Apptheme.primaryColor,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Icon(
                  Icons.check,
                  size: 40,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
