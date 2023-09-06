import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/my_theme.dart';

import '../../../models/task_model.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({required this.taskModel, super.key});
  final TaskModel taskModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
              Text(
                taskModel.title!,
                style: GoogleFonts.poppins(
                    fontSize: 18, color: Apptheme.primaryColor),
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
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Apptheme.primaryColor,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Icon(
              Icons.check,
              size: 40,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
