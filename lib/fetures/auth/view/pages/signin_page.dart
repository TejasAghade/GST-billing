import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quickalert/quickalert.dart';
import 'package:shop_management/core/constants/sizes.dart';
import 'package:shop_management/core/theme/app_pallet.dart';
import 'package:shop_management/core/widgets/loader_widget.dart';
import 'package:shop_management/fetures/auth/view/widgets/custom_button.dart';
import 'package:shop_management/fetures/auth/view/widgets/custom_textfield.dart';
import 'package:shop_management/fetures/auth/viewmodel/auth_viewmodel.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final mobileController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    mobileController.dispose();
    passwordController.dispose();
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
              text: 'sss',
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
              height: size.width >=540? 450 : size.height,
              padding: const EdgeInsets.all(15),
              width: size.width <540? size.width : 450,
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "SIGN IN",
                      style: TextStyle(
                        fontSize: 46,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 35),

                    CustomAuthTextField(
                      hintText: "Mobile Number",
                      controller: mobileController,
                    ),
                    const SizedBox(height: 15),

                    CustomAuthTextField(
                      hintText: "Password",
                      controller: passwordController,
                      obscureText: true,
                      suffixIcon: const [Icon(CupertinoIcons.eye, size: 20,), Icon(CupertinoIcons.eye_slash, size: 20,)],
                    ),
                    const SizedBox(height: 20),

                    isLoading? const Loader() : CustomAuthButton(
                      text: "Sign in",
                      onPressed: () async{

                        if(!formKey.currentState!.validate()){
                          return;
                        }
                        formKey.currentState!.validate();
                        ref.read(authViewModelProvider.notifier).signInUser(
                          phoneNumber: mobileController.text,
                          password: passwordController.text,
                        );
                      },
                    ),
                    const SizedBox(height: 15),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: InkWell(
                        onTap: (){
                          context.go('/');
                        },
                        hoverColor: Pallet.transparent,
                        splashColor: Pallet.transparent,
                        highlightColor: Pallet.transparent,
                        child: RichText(
                          text: TextSpan(
                            text: "Don't have an accoun't? ",
                            style: Theme.of(context).textTheme.titleMedium,
                            children: const [
                              TextSpan(
                                text: "Sign up",
                                style: TextStyle(color: Pallet.primaryColor, fontSize: textRegular),
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
