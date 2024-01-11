import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shop_app/dataSource/models/categoreis_model.dart';
import 'package:shop_app/dataSource/models/change_fav_model.dart';
import 'package:shop_app/dataSource/models/search_model.dart';
import 'package:shop_app/presentaion/screens/categories_screen.dart';
import 'package:shop_app/presentaion/screens/favouirtes_screen.dart';
import 'package:shop_app/presentaion/screens/producs_screen.dart';
import 'package:shop_app/presentaion/screens/setting_screen.dart';
import 'package:shop_app/shared/cash_helper.dart';
import 'package:shop_app/dataSource/models/login_model.dart';
import 'package:shop_app/dataSource/repo/repo.dart';
import 'package:shop_app/presentaion/screens/login_screen.dart';
import 'package:shop_app/shared/constants.dart';
import '../../dataSource/models/fav_model.dart';
import '../../dataSource/models/home_model.dart';
import '../../dataSource/models/Boarding_model.dart';
import '../../presentaion/screens/home_screen.dart';
part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this.shopRepo) : super(ShopInitial());
  final ShopRepo shopRepo;

  ///cubit
  static ShopCubit get(context) => BlocProvider.of(context);

  /// variables
  int index = 0;
  List<BoardingModel> boardingModel = [
    BoardingModel(
        image: 'images/shopping1.gif', body: 'body1', title: 'title1'),
    BoardingModel(
        image: 'images/shopping2.gif', body: 'body2', title: 'title2'),
    BoardingModel(
        image: 'images/shopping3.gif', body: 'body3', title: 'title3'),
  ];

  GlobalKey<FormState> loginKey = GlobalKey();
  GlobalKey<FormState> registerKey = GlobalKey();
  PageController pageController = PageController();
  bool isPasswordVisible = false;
  int navIndicator = 0;

  List<Widget> bottomScreen = [
    ProductScreen(),
    CategoriesScreen(),
    FavouirtesScreen(),
    SettingScreen(),
  ];
  IconData passwordIcon = Icons.visibility;
  HomeModel? homeModel;
  CategoriesModel? categoriesModel;
  Map<int, bool> favourites = {};
  ChangeFavModel? changeFavModel;
  FavoritesModel? favoritesModel;
  LoginModel? loginModel;
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  GlobalKey<FormState> settingFormKey = GlobalKey();
  SearchModel? searchModel;
  GlobalKey<FormState> searchKey = GlobalKey();
  TextEditingController searchController = TextEditingController();

  ///====================== 1- Boarding Screen ======================////

  void changePageIndicator(BuildContext context) {
    if (index == boardingModel.length - 1) {
      submit(context: context, widget: LoginScreen());

      emit(ShopChangeIndicatorState());
    } else {
      pageController.nextPage(
          duration: Duration(milliseconds: 10), curve: Curves.easeInOut);
      emit(ShopChangeIndicatorState());
    }
  }

  void submit({required BuildContext context, required Widget widget}) {
    CashHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value = true) navigateAndFinish(context: context, widget: widget);
    });
  }

  void navigateAndFinish(
      {required BuildContext context, required Widget widget}) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
      (route) => false,
    );
  }

  void navigateto({required BuildContext context, required Widget widget}) =>
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => widget,
        ),
      );

  ///====================== 2- register login logout ======================////
  void loginUser(BuildContext context) async {
    try {
      emit(ShopLoadingLoginState());
      final response = await shopRepo.loginUser(
        email: mailController.text ?? '',
        password: passwordController!.text ?? '',
      );
      loginModel = LoginModel.fromJson(response!.data);
      nameController.text = loginModel!.data!.name!;
      phoneController.text = loginModel!.data!.phone!;
      mailController.text = loginModel!.data!.email!;

      emit(ShopSuccessLoginState(loginModel));
    } catch (error) {
      emit(ShopErrorLoginState());
      print('===============error is : ${error.toString()}=================');
    }
  }

  void registerUser(BuildContext context) async {
    try {
      emit(ShopLoadingRegisterState());
      final response = await shopRepo.register(
        name: nameController.text,
        phone: phoneController.text,
        email: mailController.text,
        password: passwordController.text,
      );
      loginModel = LoginModel.fromJson(response?.data);
      emit(ShopSuccessRegisterState(loginModel));

      print(loginModel?.data?.name);
    } catch (error) {
      emit(ShopErrorRegisterState());

      print(
          '=============== reg error is : ${error.toString()}=================');
    }
  }

  void signedOut({required BuildContext context}) {
    navigateto(context: context, widget: LoginScreen());
    navIndicator = 0;
    mailController.clear();
    passwordController!.clear();
    mailController.clear();
    nameController.clear();
    phoneController.clear();
    CashHelper.removeData(key: 'token');
    token = '';
    print('===================== token :${token}===================');
    print(
        '=====================logon model phone : ${loginModel?.data?.phone}===================');
  }

  void changePaswwordVisbility() {
    isPasswordVisible = !isPasswordVisible;
    isPasswordVisible
        ? passwordIcon = Icons.visibility_outlined
        : passwordIcon = Icons.visibility_off;
    emit(ShopChangePasswordIcon());
  }

  void getUserData() async {
    try {
      emit(ShopLoadingGetUserData());
      final response = await shopRepo.getUserData();
      loginModel = LoginModel.fromJson(response!.data);
      nameController.text = loginModel!.data!.name!;
      phoneController.text = loginModel!.data!.phone!;

      emit(ShopSuccessGetUserData());
    } catch (error) {
      print(
          '================= user data error is :${error.toString()}===============');
      emit(ShopErrorGetUserData());
    }
  }

  void updateUser(BuildContext context) async {
    try {
      emit(ShopLoadinUpdateUserState());
      await shopRepo.update(
        name: nameController.text ?? '',
        phone: phoneController.text ?? '',
        email: mailController.text ?? '',
      );

      emit(ShopSuccessUpdateUserState());
    } catch (error) {
      emit(ShopErrorUpdateUserState());
      print('===============error is : ${error.toString()}=================');
    }
  }

  ///=======================home screen ===================================///

  void changeNavbar(int index) {
    navIndicator = index;
    emit(ShopChangeIndicatorState());
  }

  void getHomeData() async {
    emit(ShopLoadingHomeState());
    try {
      final response = await shopRepo.getHomeData();
      homeModel = HomeModel.fromJson(response?.data);
      homeModel!.data!.products!.forEach((product) {
        favourites.addAll({product.id: product.inFavorites});
      });
      print(favourites.toString());
      emit(ShopSuccessHomeState());
    } catch (error) {
      print('=================${error.toString()}===============');
      emit(ShopErrorHomeState());
    }
  }

  void getCategories() async {
    try {
      final response = await shopRepo.getCategories();
      categoriesModel = CategoriesModel.fromJson(response?.data);
      emit(ShopSuccessCategoriesState());
    } catch (error) {
      print('=================${error.toString()}===============');
      emit(ShopErrorCategoriesState());
    }
  }

  void changeFavorites(int productId) async {
    try {
      favourites[productId] = !favourites[productId]!;
      emit(ShopSuccessFavouritesState());
      final response = await shopRepo.changeFavorites(productId: productId);
      changeFavModel = ChangeFavModel.fromJson(response?.data);
      print(response!.data);
      print('================${changeFavModel!.status}');
      if (changeFavModel!.status != true) {
        favourites[productId] = !favourites[productId]!;
        emit(ShopNotAuthorizedFavouritesState(changeFavModel!));
      } else {
        getFavorites();
        emit(ShopSuccessFavouritesState());
      }
    } catch (error) {
      favourites[productId] = !favourites[productId]!;

      print('=================${error.toString()}===============');
      emit(ShopErrorFavouritesState());
    }
  }

  void getFavorites() async {
    try {
      emit(ShopLoadingGetFavState());
      final response = await shopRepo.getFavorites();
      favoritesModel = FavoritesModel.fromJson(response?.data);
      emit(ShopSuccessGetFavState());
    } catch (error) {
      print('=================${error.toString()}===============');
      emit(ShopErrorGetFavState());
    }
  }

  void searchData() async {
    try {
      emit(ShopLoadingSearchState());
      final response = await shopRepo.searchData(text: searchController.text);
      searchModel = SearchModel.fromJson(response?.data);
      print(searchModel);

      emit(ShopSuccessSearchState());
    } catch (error) {
      emit(ShopErrorSearchState());
      print(
          '===============error is : ${searchModel.toString()}=================');

      print('===============error is : ${error.toString()}=================');
    }
  }
}
