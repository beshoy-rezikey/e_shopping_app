import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/logic/cubit/shop_cubit.dart';
import 'package:shop_app/presentaion/widgests/login_screen/login_button.dart';
import 'package:shop_app/presentaion/widgests/shared_widgets/text_form_field.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        print(
            '========================== loginmodel name : ${cubit.loginModel?.data?.name}=====================');

        return ConditionalBuilder(
          condition: cubit.loginModel != null,
          builder: (context) => Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: cubit.settingFormKey,
              child: Column(
                children: [
                  if (state is ShopLoadinUpdateUserState)
                    LinearProgressIndicator(),
                  SizedBox(height: 10),
                  shopFormFieldWidget(
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
                  SizedBox(
                    height: 10,
                  ),

                  SizedBox(
                    height: 10,
                  ),
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
                    height: 10,
                  ),
                  loginButton(
                      text: 'logout',
                      onPressed: () {
                        cubit.signedOut(context: context);
                      },
                      context: context),
                  SizedBox(
                    height: 10,
                  ),
                  loginButton(
                      text: 'update',
                      onPressed: () {
                        if (cubit.settingFormKey.currentState!.validate()) {
                          cubit.updateUser(context);
                        }
                      },
                      context: context),
                ],
              ),
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
