import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/presentaion/screens/login_screen.dart';
import 'package:shop_app/presentaion/widgests/login_screen/login_button.dart';
import 'package:shop_app/presentaion/widgests/login_screen/register_button.dart';
import 'package:shop_app/presentaion/widgests/shared_widgets/text_form_field.dart';
import 'package:shop_app/shared/colors.dart';

import '../../logic/cubit/shop_cubit.dart';
import '../../shared/cash_helper.dart';
import '../../shared/constants.dart';
import '../widgests/shared_widgets/toats_message.dart';
import 'home_screen.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
  listener: (context, state) {
    // TODO: implement listener
    if (state is ShopSuccessRegisterState) {
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
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              key: cubit.registerKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Register', style: Theme.of(context).textTheme.headline5,),
                  Text(
                    'Register now to browse our hot offeres',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: MyColors.orange),
                  ),
                  SizedBox(
                    height: 30,
                  ),shopFormFieldWidget(
                    controller: cubit.nameController,
                    type: TextInputType.name,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'value must not be empty';
                      }
                    },
                    lable: 'Name',
                    preFix: Icons.person,
                    context: context,
                  ),
                  SizedBox(height: 15,),

                  shopFormFieldWidget(
                    controller: cubit.mailController,
                    type: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) return 'Please enter your mail';
                    },
                    lable: 'E-mail',
                    preFix: Icons.email_sharp,
                    context: context,
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
                                  ),
                  SizedBox(height: 15,),
                  shopFormFieldWidget(
                    controller: cubit.phoneController,
                    type: TextInputType.phone,
                    validate: (value) {
                      if (value!.isEmpty) {
                        return 'value must not be empty';
                      }
                    },
                    lable: 'Phone',
                    preFix: Icons.phone_android_outlined,
                    context: context,
                  ),

                  SizedBox(
                    height: 15,
                  ),
                  ConditionalBuilder(
                    builder: (context) =>  loginButton(text: 'Register', onPressed: () {
                      if (cubit.registerKey.currentState!.validate()){
                        cubit.registerUser(context);
                      }
                    },context: context),
                    condition: state is! ShopLoadingRegisterState,
                    fallback: (context) => Center(child: CircularProgressIndicator(color:MyColors.orange )),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.center ,
                    children: [
                      Text('Already have an Account? '),
                      registerButton(text: 'Login', onPressed: () {
                        cubit.navigateto(context: context, widget: LoginScreen());
                        cubit.passwordController!.clear();
                        cubit.mailController.clear();
                        cubit.nameController.clear();
                        cubit.phoneController.clear();
                      }, ),
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

  
