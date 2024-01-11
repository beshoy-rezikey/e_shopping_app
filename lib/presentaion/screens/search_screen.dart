import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/logic/cubit/shop_cubit.dart';
import 'package:shop_app/presentaion/widgests/shared_widgets/text_form_field.dart';

import '../widgests/fav_screen/fav_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: cubit.searchKey,
              child: Column(
                children: [
                  shopFormFieldWidget(
                    controller: cubit.searchController,
                    type: TextInputType.text,
                    validate:( String ? value) {
                      if (value!.isEmpty)
                        return 'please enter text to search';
                    },
                    lable: 'search',
                    preFix: Icons.search,
                    context: context,
                    onSubmit: (value) {
                      cubit.searchData();
                    },
                  ),
                  SizedBox(height: 10,),
                  if (state is ShopLoadingSearchState)
                  LinearProgressIndicator(),
                  if(state is ShopSuccessSearchState)
                    Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) =>
                              favBuildWidegt(cubit.searchModel!.data!.data?[index],isSearch: false),
                          separatorBuilder: (context, index) =>
                              Divider(color: Colors.grey, height: 1),
                          itemCount: cubit.searchModel!.data!.data!.length ),
                    ) ,
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
