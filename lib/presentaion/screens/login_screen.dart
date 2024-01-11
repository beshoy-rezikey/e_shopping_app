import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/shared/cash_helper.dart';
import 'package:shop_app/logic/cubit/shop_cubit.dart';
import 'package:shop_app/presentaion/screens/Resgister_screen.dart';
import 'package:shop_app/presentaion/screens/home_screen.dart';
import 'package:shop_app/presentaion/widgests/login_screen/login_button.dart';
import 'package:shop_app/presentaion/widgests/login_screen/register_button.dart';
import 'package:shop_app/presentaion/widgests/shared_widgets/text_form_field.dart';
import 'package:shop_app/presentaion/widgests/shared_widgets/toats_message.dart';
import 'package:shop_app/shared/colors.dart';
import 'package:shop_app/shared/constants.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        if (state is ShopSuccessLoginState) {
          if (state.loginModel!.status!) {
            CashHelper.saveData(key: 'token', value: state.loginModel?.data?.token).then((value) {
            });
            token = state.loginModel!.data!.token;
          ShopCubit.get(context).navigateAndFinish(context: context, widget: HomeScreen());


          } else {
            shopToastMessage(Message:  state.loginModel!.message!, state: ToastState.error);
          }
        }
      },
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);

        return Scaffold(
          appBar:AppBar(foregroundColor: Theme.of(context).scaffoldBackgroundColor) ,
          body: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: cubit.loginKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Login',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(
                        'Login now to browse our hot offeres',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: MyColors.orange),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      shopFormFieldWidget(
                        showCursor: true,
                        controller: cubit.mailController,
                        type: TextInputType.emailAddress,
                        validate: (String? value) {
                          if (value!.isEmpty) return 'Please enter your mail';
                        },
                        lable: 'E-mail',
                        preFix: Icons.email_sharp,
                        context: context,
                        onSubmit: (value) {},
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      shopFormFieldWidget(
                        showCursor: true,
                        isItPassword: cubit.isPasswordVisible,
                        suffixpressed: () {
                          cubit.changePaswwordVisbility();
                        },
                        controller: cubit.passwordController,
                        type: TextInputType.visiblePassword,
                        validate: (String? value) {
                          if (value!.isEmpty)
                            return 'Please enter a valid password';
                        },
                        lable: 'Password',
                        preFix: Icons.lock_clock_sharp,
                        suffix: cubit.passwordIcon,
                        context: context,
                        onSubmit: (p0) {
                          if (cubit.loginKey.currentState!.validate()) {
                            cubit.loginUser(context);
                          }
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      ConditionalBuilder(
                        builder: (context) => loginButton(
                            text: 'Login',
                            onPressed: () {
                              if (cubit.loginKey.currentState!.validate()) {
                                cubit.loginUser(context);
                              }
                            },
                            context: context),
                        condition: state is! ShopLoadingLoginState,
                        fallback: (context) => Center(
                            child: CircularProgressIndicator(
                                color: MyColors.orange)),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Don\'t have account  ? register now '),
                          registerButton(
                            text: 'Register',
                            onPressed: () {
                              cubit.navigateto(
                                  context: context, widget: RegisterScreen());
                              cubit.mailController.clear();
                              cubit.passwordController!.clear();
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
