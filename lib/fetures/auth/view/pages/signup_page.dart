import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shop_management/core/theme/app_pallet.dart';
import 'package:shop_management/core/widgets/loader_widget.dart';
import 'package:shop_management/fetures/auth/view/widgets/custom_button.dart';
import 'package:shop_management/fetures/auth/view/widgets/custom_textfield.dart';
import 'package:shop_management/fetures/auth/viewmodel/auth_viewmodel.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});

  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  void dispose() {
    fullNameController.dispose();
    mobileController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    final isLoading = ref.watch(authViewModelProvider.select((val)=>val?.isLoading == true));

    ref.listen(
      authViewModelProvider, 
      (_, next){
        next?.when(
          data: (data){
            QuickAlert.show(
              width: 300,
              context: context,
              type: QuickAlertType.success,
              text: 'Registration successfull!',
              onConfirmBtnTap: (){
                context.go('/signin');
              }
            );
          }, 
          error: (err, st){
            QuickAlert.show(
              width: 300,
              context: context,
              type: QuickAlertType.error,
              text: '$err',
            );
          }, 
          loading: (){}
        );
      }
    );

    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.only(top: 15, bottom: 15, right: 15, left: size.width>=450? 50 : 0),
          alignment: size.width>=450? Alignment.centerLeft : Alignment.center,
          decoration: BoxDecoration(
            image: size.width>=450? const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage("assets/images/laundry2.png")
            ) : null
          ),
          
          child: Card(
            surfaceTintColor: Pallet.white,
            color: Pallet.white,
            elevation: 0,

            child: Container(
              height: size.width >=540? 550 : size.height,
              padding: const EdgeInsets.all(15),
              width: size.width <540? size.width : 450,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "SIGN UP",
                      style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 35),
                
                    CustomAuthTextField(
                      hintText: "Full Name",
                      controller: fullNameController,
                    ),
                    const SizedBox(height: 15),
                
                    CustomAuthTextField(
                      hintText: "Mobile",
                      controller: mobileController,
                    ),
                    const SizedBox(height: 15),
                
                    CustomAuthTextField(
                      hintText: "Password",
                      controller: passwordController,
                      obscureText: true,
                      suffixIcon: const [Icon(CupertinoIcons.eye), Icon(CupertinoIcons.eye_slash)],
                    ),
                
                    const SizedBox(height: 15),
                    CustomAuthTextField(
                      hintText: "Re-Enter Password",
                      controller: rePasswordController,
                    ),
                    const SizedBox(height: 20),
                
                    isLoading? const Loader() : CustomAuthButton(
                      text: "Sign up",
                      onPressed: () async{
                        if(!formKey.currentState!.validate()){
                          return;
                        }
                       
                        await ref.read(authViewModelProvider.notifier).signUpUser(
                          phoneNumber: mobileController.text,
                          password: passwordController.text,
                          fullName: fullNameController.text,
                        );
                      },
                    ),
                    const SizedBox(height: 15),
                
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: (){
                          context.go('/signin');
                        },
                        hoverColor: Pallet.transparent,
                        splashColor: Pallet.transparent,
                        highlightColor: Pallet.transparent,
                        child: RichText(
                          text: TextSpan(
                            text: "Already have an accoun't? ",
                            style: Theme.of(context).textTheme.titleMedium,
                            children: const [
                              TextSpan(
                                text: "Sign In",
                                style: TextStyle(color: Pallet.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
