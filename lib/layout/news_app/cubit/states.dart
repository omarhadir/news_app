//
// abstract class NewsStates{}
// class NewsInitialStates extends NewsStates{}
// class NewsBottomNav extends NewsStates{}
// class NewsGetBusinessSuccessState extends NewsStates{}
// class NewsGetBusinessLoadingState extends NewsStates{}
// class NewsGetBusinessErrorState extends NewsStates
// {
//   final String error;
//
//   NewsGetBusinessErrorState(this.error);
// }
//
// class NewsGetSportSuccessState extends NewsStates{}
// class NewsGetSportLoadingState extends NewsStates{}
// class NewsGetSportErrorState extends NewsStates
// {
//   final String error;
//
//   NewsGetSportErrorState(this.error);
// }
//
// class NewsGetScienceSuccessState extends NewsStates{}
// class NewsGetScienceLoadingState extends NewsStates{}
// class NewsGetScienceErrorState extends NewsStates
// {
//   final String error;
//
//   NewsGetScienceErrorState(this.error);
// }
//
//
//
//
//
//
//

abstract class NewsStates{}
class NewsInitialStates extends NewsStates{}
class ChangeBottomNav  extends NewsStates{}

class NewsBusinessLoadingStates  extends NewsStates{}
class NewsBusinessSuccessStates  extends NewsStates{}
class NewsBusinessErrorStates  extends NewsStates{}


class NewsSportsLoadingStates  extends NewsStates{}
class NewsSportsSuccessStates  extends NewsStates{}
class NewsSportsErrorStates  extends NewsStates{
  final String error;

  NewsSportsErrorStates(this.error);
}


class NewsScienceLoadingStates  extends NewsStates{}
class NewsScienceSuccessStates  extends NewsStates{}
class NewsScienceErrorStates  extends NewsStates{}

class ChangeAppModeStates  extends NewsStates{}


class NewsSearchLoadingStates  extends NewsStates{}
class NewsSearchSuccessStates  extends NewsStates{}
class NewsSearchErrorStates  extends NewsStates{}

