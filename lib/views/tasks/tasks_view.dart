import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo_app/core/my_theme.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import 'widget/task_item.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.only(top: 40, left: 20),
          width: mediaQuery.width,
          height: mediaQuery.height * 0.18,
          color: Apptheme.primaryColor,
          child: Text(
            'To Do List',
            style: GoogleFonts.poppins(
                fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        CalendarTimeline(
          initialDate: DateTime.now(),
          firstDate: DateTime.now().subtract(const Duration(days: 30)),
          lastDate: DateTime.now().add(const Duration(days: 360)),
          onDateSelected: (date) => print(date),
          leftMargin: 20,
          monthColor: Colors.black,
          dayColor: Colors.black,
          activeDayColor: Apptheme.primaryColor,
          activeBackgroundDayColor: Colors.white,
          dotsColor: const Color(0xFF333A47),
          locale: 'en_ISO',
        ),
        StreamBuilder(
            stream: FirebaseFunction.getCollection()
                .orderBy('dateTime')
                .snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text('something went wrong');
              }
              var tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              return Expanded(
                  child: ListView.builder(
                      padding: const EdgeInsets.only(top: 10),
                      itemBuilder: (context, index) =>
                          TaskItem(taskModel: tasks[index]),
                      itemCount: tasks.length));
            }),
      ],
    );
  }
}
//    var tasks = snapshot.data?.docs.map((e)=> e.data()).toList() ?? [];
    // return Expanded(
    //   child: ListView.builder(
    //     itemBuilder: (context, index)=>TaskItem(taskModel: tasks[index]),
    //     itemCount: tasks.length,
    //     ));