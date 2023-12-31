import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/style/my_theme.dart';
import 'package:todo_app/core/provider/my_provider.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import '../../shared/components/app_bar.dart';
import 'widget/task_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  var selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var mediaquery = MediaQuery.of(context).size;
    var provider = Provider.of<MyProvider>(context);
    var localization = AppLocalizations.of(context)!;
    return Column(
      children: [
        Stack(
          children: [
            CustomAppBar(title: localization.toDoList),
            Padding(
              padding: EdgeInsets.only(top: mediaquery.height / 7),
              child: CalendarTimeline(
                initialDate: selectedDate,
                firstDate: DateTime.now().subtract(const Duration(days: 30)),
                lastDate: DateTime.now().add(const Duration(days: 360)),
                onDateSelected: (date) {
                  // ignore: avoid_print
                  print(date);
                  selectedDate = date;
                  setState(() {});
                },
                leftMargin: 20,
                monthColor: provider.themeMode == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                dayColor: provider.themeMode == ThemeMode.light
                    ? Colors.black
                    : Colors.white,
                activeDayColor: provider.themeMode == ThemeMode.light
                    ? Apptheme.primaryColor
                    : Colors.white,
                activeBackgroundDayColor: theme.canvasColor,
                dotsColor: const Color(0xFF333A47),
                //! for ios good 
               // locale: provider.language == 'ar' ? 'ar' : 'en_ISO',
               //!for android not good
                locale: 'en_ISO',
              ),
            ),
          ],
        ),
        SizedBox(
          height: mediaquery.height / 65,
        ),
        StreamBuilder(
            stream: FirebaseFunction.getData(selectedDate),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return const Text('something went wrong');
              }
              var tasks =
                  snapshot.data?.docs.map((e) => e.data()).toList() ?? [];
              if (tasks.isEmpty) {
                return const Text(
                  'NO TASKS',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                );
              }
              return Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
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