// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:online_gym_trainer/config/styles.dart';
import 'package:online_gym_trainer/firebasefunctions.dart/functions.dart';
import 'package:online_gym_trainer/screeens/forgotpassword.dart';
import 'package:online_gym_trainer/screeens/register.dart';
import 'package:online_gym_trainer/screeens/verify.dart';
import 'package:online_gym_trainer/widgets/button.dart';
import 'package:online_gym_trainer/widgets/textbox.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailcotroller = TextEditingController();
  TextEditingController passwordcotroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Trainer Sign in",
                  style: Styles.title(context),
                ),
              ),
              Text(
                "Welcome back.Please sign in to",
                style: Styles.subtitlegrey(context),
              ),
              Text(
                "continue",
                style: Styles.subtitlegrey(context),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              Textbox(
                hideText: false,
                tcontroller: emailcotroller,
                type: TextInputType.emailAddress,
                hinttext: 'Email',
                icon: Icon(Icons.email,color:Theme.of(context). colorScheme.onPrimary,),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.013),
              Textbox(
                hideText: true,
                tcontroller: passwordcotroller,
                type: TextInputType.visiblePassword,
                hinttext: 'Password',
                icon:Icon(Icons.lock,color:Theme.of(context). colorScheme.onPrimary,),
              ),
                           SizedBox(height: MediaQuery.of(context).size.height * 0.013),
              SizedBox(height: MediaQuery.of(context).size.height * 0.013),

              
             
              CustomLoginButton(
                  text: "Sign in",
                  onPress: () async{
                  await  signin(emailcotroller.text.trim(), passwordcotroller.text.trim());
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const VerifyScreen(),
                      ),
                    );
                  }),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("don't have an account?"),
                      TextButton(onPressed: (){
                         Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => const RegisterScreen(),
                      ),
                    );
                      }, child: Text("Sign up", style: TextStyle(color: Theme.of(context).colorScheme.primary),))
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
