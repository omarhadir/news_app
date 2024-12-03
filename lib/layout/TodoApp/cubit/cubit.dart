import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/layout/TodoApp/cubit/states.dart';
import 'package:untitled10/shared/network/local/cashe_helper.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit(): super(AppInitialStates());
  static AppCubit get(context)=>BlocProvider.of(context);

  bool isDark= false;

  void changeAppMode({bool? fromShared})
  {
   if(fromShared !=null)

       isDark=fromShared;
     else

         isDark= !isDark;

   
   CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
     emit(ChangeAppMode());
   });


  }

}