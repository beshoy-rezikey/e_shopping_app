part of 'shop_cubit.dart';

@immutable
abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopChangeIndicatorState extends ShopState {}

class ShopLoadingLoginState extends ShopState {}

class ShopSuccessLoginState extends ShopState {
  final LoginModel? loginModel;

  ShopSuccessLoginState(this.loginModel);
}

class ShopErrorLoginState extends ShopState {}

class ShopChangePasswordIcon extends ShopState {}

class ShopChangeBottomNavBar extends ShopState {}

class ShopLoadingHomeState extends ShopState {}

class ShopSuccessHomeState extends ShopState {}

class ShopErrorHomeState extends ShopState {}

class ShopLoadingCategoriesState extends ShopState {}

class ShopSuccessCategoriesState extends ShopState {}

class ShopErrorCategoriesState extends ShopState {}

class ShopSuccessFavouritesState extends ShopState {}

class ShopNotAuthorizedFavouritesState extends ShopState {
  final ChangeFavModel changeFavModel;

  ShopNotAuthorizedFavouritesState(this.changeFavModel);
}

class ShopErrorFavouritesState extends ShopState {}

class ShopLoadingGetFavState extends ShopState {}

class ShopSuccessGetFavState extends ShopState {}

class ShopErrorGetFavState extends ShopState {}

class ShopLoadingGetUserData extends ShopState {}

class ShopSuccessGetUserData extends ShopState {}

class ShopErrorGetUserData extends ShopState {}

class ShopLoadingRegisterState extends ShopState {}

class ShopSuccessRegisterState extends ShopState {
  final LoginModel? loginModel;

  ShopSuccessRegisterState(this.loginModel);
}

class ShopErrorRegisterState extends ShopState {}

class ShopLoadinUpdateUserState extends ShopState {}

class ShopSuccessUpdateUserState extends ShopState {
  // final LoginModel? loginModel;
  //
  // ShopSuccessLoginState(this.loginModel);
}

class ShopErrorUpdateUserState extends ShopState {}

class ShopLoadingSearchState extends ShopState {}

class ShopSuccessSearchState extends ShopState {}

class ShopErrorSearchState extends ShopState {}
