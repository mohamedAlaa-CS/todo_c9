import 'package:flutter/material.dart';
import 'package:todo_app/shared/network/firebase/firebase_function.dart';
import 'package:todo_app/screens/login/login_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

// ignore: must_be_immutable
class SignupView extends StatelessWidget {
  static const String routeName = 'singup_view';
  var nameController = TextEditingController();
  var ageController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  SignupView({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
     var localization =AppLocalizations.of(context)!;
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
                    localization.signup,
                    style:const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: nameController,
                    decoration: InputDecoration(
                      hintText: localization.name,
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
                    textInputAction: TextInputAction.next,
                    controller: ageController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: localization.age,
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
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                        FirebaseFunction.signUp(emailController.text, passwordController.text,context,nameController.text, ageController.text );
                        }
                      },
                      child:  Text(
                       localization.signup ,
                        style:const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                       Text(
                        localization.have,
                        style:const TextStyle(fontSize: 18),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(LoginView.routeName);
                          },
                          child:  Text(
                            localization.login,
                            style:const TextStyle(
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
