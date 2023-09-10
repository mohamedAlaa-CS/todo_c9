import 'package:flutter/material.dart';
import 'package:todo_app/views/signup/signup.dart';

// ignore: must_be_immutable
class LoginView extends StatelessWidget {
  static const String routeName = 'loogin_view';
   LoginView({super.key});
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme =Theme.of(context);
    return Container(
      decoration:const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/background_auth.png',),fit: BoxFit.fill)
      ),
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
               const Text('Login',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
               const SizedBox(height: 20,),
                TextFormField(
                  textInputAction: TextInputAction.next,
                  controller: emailController,
                  validator: (data){
             if(data == null || data.isEmpty){
              return 'invaild email ..!';
             }
             return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: theme.primaryColor,
                        width: 1.5
                      )
                    ),
                    focusedBorder:OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: theme.primaryColor,
                        width: 1.5
                      )
                    ), 
                  ),
                ),
               const SizedBox(height: 10,),
                TextFormField(
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  obscuringCharacter: '*',
                  controller: passwordController,
                  validator: (data){
                    if(data == null || data.isEmpty){
                      return 'invaild password';
                    }else if(data.trim().length < 6){
                      return 'enter 6 characters';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                      borderSide: BorderSide(
                        color: theme.primaryColor,
                        width: 1.5
                      )
                    )
                  ),
                ),
               const SizedBox(height: 15,),
                 SizedBox(
                  height: 45,
                   child: ElevatedButton(
                    style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                    onPressed: (){
                      if(formKey.currentState!.validate()){
                   print('login');
                      }
                    },
                     child:const Text('Login',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                     ),
                 ),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text("Don't have an account ? ",style: TextStyle(fontSize: 18),),
                  TextButton(
                    onPressed: (){
                      Navigator.of(context).pushNamed(SignupView.routeName);
                    },
                     child:const Text('SINGUP',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),))
                 ],)
              ],
            ),
          ),
        ),
      ));
  }
}