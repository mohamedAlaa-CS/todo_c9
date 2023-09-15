import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/core/provider/my_provider.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import 'package:todo_app/screens/signup/signup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  static const String routeName = 'loogin_view';
  LoginView({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<MyProvider>(context);
    var localization = AppLocalizations.of(context);
    return Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(
                  'assets/images/background_auth.png',
                ),
                fit: BoxFit.fill)),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    localization!.login,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: emailController,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'invaild email ..!';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: localization.email,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                              color: theme.primaryColor, width: 1.5)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                              color: theme.primaryColor, width: 1.5)),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.done,
                    obscureText: true,
                    obscuringCharacter: '*',
                    controller: passwordController,
                    validator: (data) {
                      if (data == null || data.isEmpty) {
                        return 'invaild password';
                      } else if (data.trim().length < 6) {
                        return 'enter 6 characters';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                        hintText: localization.password,
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                                color: theme.primaryColor, width: 1.5))),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16))),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          FirebaseFunction.sigIn(emailController.text,
                              passwordController.text, context);
                          provider.saveUser(true);
                        }
                      },
                      child: Text(
                        localization.login,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        localization.havenot,
                        style: const TextStyle(fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(SignupView.routeName);
                          },
                          child: Text(
                            localization.create,
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
