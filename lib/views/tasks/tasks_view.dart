import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/style/my_theme.dart';
import 'package:todo_app/core/provider/my_provider.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import '../../shared/components/app_bar.dart';
import 'widget/task_item.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    var mediaquery =MediaQuery.of(context).size;
    var provider = Provider.of<MyProvider>(context);
    return Column(
      children: [
      Stack(
        children: [
          const CustomAppBar(title: 'To Do List'),
      
          Padding(
            padding:  EdgeInsets.only(top:mediaquery.height/7 ),
            child: CalendarTimeline(
            initialDate: DateTime.now(),
            firstDate: DateTime.now().subtract(const Duration(days: 30)),
            lastDate: DateTime.now().add(const Duration(days: 360)),
            onDateSelected: (date) => print(date),
            leftMargin: 20,
            monthColor:provider.themeMode ==ThemeMode.light ? Colors.black :Colors.white ,
            dayColor: provider.themeMode ==ThemeMode.light ? Colors.black :Colors.white,
            activeDayColor:provider.themeMode ==ThemeMode.light ? Apptheme.primaryColor :Colors.white ,
            activeBackgroundDayColor: theme.canvasColor,
            dotsColor: const Color(0xFF333A47),
            locale: 'en_ISO',
                  ),
          ),
        ],
      ),
       SizedBox(height: mediaquery.height/65,), 
        StreamBuilder(
            stream: FirebaseFunction.getData(),
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
                    physics:const BouncingScrollPhysics(),
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