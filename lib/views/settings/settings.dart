import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/provider/my_provider.dart';
import 'package:todo_app/shared/components/app_bar.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
   String? language;
   String ? mode;

  @override
  Widget build(BuildContext context) {
   var provider = Provider.of<MyProvider>(context);
   var theme =Theme.of(context);
     setState(() {
      provider.themeMode == ThemeMode.light ? mode ='Light':mode ='Dark';
    });
    return Column(
      children: [
       const CustomAppBar(title: 'Settings'),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Language',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold),),
              RadioListTile(
              
                title: Text('English',style: theme.textTheme.bodySmall,),
                value: 'English',
                 groupValue: language,
                  onChanged: (value){
                    setState(() {
                      language = value;
                    });
                  }),
                  RadioListTile(
                title: Text('Arabic',style: theme.textTheme.bodySmall),
                value: 'Arabic',
                 groupValue: language,
                  onChanged: (value){ 
                    setState(() {
                      language = value;
                    });
                  }),
                   Text('AppMode',style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.bold),),
              RadioListTile(
                title: Text('Dark',style:theme.textTheme.bodySmall,),
                value: 'Dark',
                 groupValue: mode,
                  onChanged: (value){
                    setState(() {
                      mode = value;
                      provider.changeMode(ThemeMode.dark);
                    });
                  }),
                  RadioListTile(
                    
                title: Text('Light',style: theme.textTheme.bodySmall,),
                value: 'Light',
                 groupValue: mode,
                  onChanged: (value){ 
                    setState(() {
                      mode = value;
                      provider.changeMode(ThemeMode.light);
                    });
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
