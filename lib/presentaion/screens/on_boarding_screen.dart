import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/logic/cubit/shop_cubit.dart';
import 'package:shop_app/presentaion/widgests/on%20_borading%20_screen/floatingActionButton.dart';
import 'package:shop_app/presentaion/widgests/on%20_borading%20_screen/indicator_widget.dart';

import '../widgests/on _borading _screen/itemWidget.dart';
import '../widgests/on _borading _screen/page_view_builder.dart';
import '../widgests/on _borading _screen/skipp_button.dart';
import 'login_screen.dart';

class OnBoardingScreen extends StatelessWidget {
  OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {

        ShopCubit cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            actions: [
              shopSkipButton(
                text: 'Skip',
                onPressed: () => cubit.submit(context: context, widget: LoginScreen())
              )
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(children: [
              Expanded(
                child: boardingPageViewBuilder(
                  itemCount: cubit.boardingModel.length,
                  onPageChanged: (index) {
                    cubit.index = index;
                  },
                  controller: cubit.pageController,
                  itemBuilder: (context, index) => boardingItemWidget(
                      boardingModel: cubit.boardingModel[index]),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  boardingIdndicatorWidget(
                      controller: cubit.pageController,
                      count: cubit.boardingModel.length),
                  Spacer(),
                  boardingFloatingActionButton(
                    onPressed: () {
                      cubit.changePageIndicator(context);
                    },
                  ),
                ],
              )
            ]),
          ),
        );
      },
    );
  }
}
