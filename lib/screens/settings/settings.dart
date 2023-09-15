import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/provider/my_provider.dart';
import 'package:todo_app/shared/components/app_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../core/style/my_theme.dart';
import '../login/login_view.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  String? language;
  String? mode;

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    var theme = Theme.of(context);
    var localization = AppLocalizations.of(context)!;
    setState(() {
      provider.themeMode == ThemeMode.light ? mode = 'Light' : mode = 'Dark';
      provider.language == 'en' ? language = 'English' : language = 'Arabic';
    });
    return Column(
      children: [
        CustomAppBar(title: localization.setting),
        Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                localization.language,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RadioListTile(
                  title: Text(
                    localization.english,
                    style: theme.textTheme.bodySmall,
                  ),
                  value: 'English',
                  groupValue: language,
                  onChanged: (value) {
                    setState(() {
                      language = value;
                      provider.changeLanguage('en');
                    });
                  }),
              RadioListTile(
                  title: Text(localization.arabic,
                      style: theme.textTheme.bodySmall),
                  value: 'Arabic',
                  groupValue: language,
                  onChanged: (value) {
                    setState(() {
                      language = value;
                      provider.changeLanguage('ar');
                    });
                  }),
              Text(
                localization.appMode,
                style: GoogleFonts.poppins(
                    fontSize: 18, fontWeight: FontWeight.bold),
              ),
              RadioListTile(
                  title: Text(
                    localization.dark,
                    style: theme.textTheme.bodySmall,
                  ),
                  value: 'Dark',
                  groupValue: mode,
                  onChanged: (value) {
                    setState(() {
                      mode = value;
                      provider.changeMode(ThemeMode.dark);
                    });
                  }),
              RadioListTile(
                  title: Text(
                    localization.light,
                    style: theme.textTheme.bodySmall,
                  ),
                  value: 'Light',
                  groupValue: mode,
                  onChanged: (value) {
                    setState(() {
                      mode = value;
                      provider.changeMode(ThemeMode.light);
                    });
                  }),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 40,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Apptheme.primaryColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16)),
                    ),
                    onPressed: () async {
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: Text(localization.sureLogout),
                          content: Text(localization.logoutTheApp),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () async {
                                Navigator.pop(context, 'OK');
                                provider.saveUser(false);
                                await FirebaseAuth.instance.signOut();
                                // ignore: use_build_context_synchronously
                                Navigator.of(context)
                                    .pushReplacementNamed(LoginView.routeName);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    },
                    child: Text(
                      localization.logout,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
