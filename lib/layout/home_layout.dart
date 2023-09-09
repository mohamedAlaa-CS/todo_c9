import 'package:flutter/material.dart';
import 'package:todo_app/views/settings/settings.dart';
import 'package:todo_app/views/tasks/tasks_view.dart';

import 'widgets/bototm_sheet_body.dart';

class HomeLayoutView extends StatefulWidget {
  static const String routeName = 'home_layout';
  const HomeLayoutView({super.key});

  @override
  State<HomeLayoutView> createState() => _HomeLayoutViewState();
}

class _HomeLayoutViewState extends State<HomeLayoutView> {
  int selectedIndex = 0;
  List<Widget> screens = [TasksView(), Settings()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: screens[selectedIndex],
      floatingActionButton: Container(
          padding: const EdgeInsets.all(5),
          decoration:
              const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          child: FloatingActionButton(
              onPressed: () {
                bottomSheet();
              },
              child: const Icon(Icons.add))),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: BottomNavigationBar(
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: ''),
              BottomNavigationBarItem(icon: Icon(Icons.settings), label: ''),
            ]),
      ),
    );
  }

  bottomSheet() {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      isScrollControlled: true,
        context: context, builder: (context) => BototmSheetBody());
  }
}
