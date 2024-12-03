import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:untitled10/layout/TodoApp/cubit/cubit.dart';
import 'package:untitled10/layout/TodoApp/cubit/states.dart';
import 'package:untitled10/layout/news_app/cubit/cubit.dart';
import 'package:untitled10/layout/news_app/cubit/states.dart';
import 'package:untitled10/shared/network/local/cashe_helper.dart';
import 'package:untitled10/shared/network/remote/dio_helper.dart';

import 'layout/news_app/news_layout.dart';

void main()async
{
  WidgetsFlutterBinding.ensureInitialized();
DioHelper.init();
 await CacheHelper.init();

 bool isDark=CacheHelper.getBoolean(key: 'isDark');
  runApp( MyApp(isDark));
}

class MyApp extends StatelessWidget {
  final bool isDark;
  MyApp(this.isDark);

  // const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider( create: (BuildContext context) =>NewsCubit()..getBusinessData()),
        BlocProvider(create: (BuildContext context) =>AppCubit()..changeAppMode(fromShared: isDark),)
      ],
      child: BlocConsumer<AppCubit,AppStates>(
       listener: (context,state){},
        builder: (context,state){
         return  MaterialApp(
           // title: 'Flutter Demo',
           theme: ThemeData(
             primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor: Colors.white,
             appBarTheme: AppBarTheme(

               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarColor: Colors.white,
                 statusBarIconBrightness: Brightness.dark,

               ),
               backgroundColor: Colors.white,
               titleTextStyle: TextStyle(
                   fontWeight: FontWeight.bold,fontSize: 20.0,color: Colors.black),
               elevation: 0.0,
               iconTheme: IconThemeData(
                 color: Colors.black,

               ),
               actionsIconTheme: IconThemeData(
                 color: Colors.black,

               ),


             ),
             floatingActionButtonTheme: FloatingActionButtonThemeData(
               backgroundColor: Colors.deepOrange,
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               selectedItemColor: Colors.deepOrange,
               type: BottomNavigationBarType.fixed,
               selectedIconTheme: IconThemeData(
                   color: Colors.deepOrange
               ),

             ),
             textTheme: TextTheme(
               bodyText1: TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.w600,
                 color: Colors.black,
               ),
             ),


           ),
           darkTheme: ThemeData(
             primarySwatch: Colors.deepOrange,
             scaffoldBackgroundColor: HexColor('333739'),
             appBarTheme: AppBarTheme(

               systemOverlayStyle: SystemUiOverlayStyle(
                 statusBarColor: HexColor('333739'),
                 statusBarIconBrightness: Brightness.light,

               ),
               backgroundColor: HexColor('333739'),
               titleTextStyle: TextStyle(
                   fontWeight: FontWeight.bold,fontSize: 20.0,
                   color: Colors.white),
               elevation: 0.0,
               iconTheme: IconThemeData(
                 color: Colors.white,

               ),
               actionsIconTheme: IconThemeData(
                 color: Colors.white,

               ),


             ),
             floatingActionButtonTheme: FloatingActionButtonThemeData(
               backgroundColor: Colors.deepOrange,
             ),
             bottomNavigationBarTheme: BottomNavigationBarThemeData(
               backgroundColor: HexColor('333739'),
               unselectedItemColor: Colors.grey,
               selectedItemColor: Colors.deepOrange,
               type: BottomNavigationBarType.fixed,
               selectedIconTheme: IconThemeData(
                   color: Colors.deepOrange
               ),

             ),
             textTheme: TextTheme(
               bodyText1: TextStyle(
                 fontSize: 20.0,
                 fontWeight: FontWeight.w600,
                 color: Colors.white,
               ),
             ),


           ),
           themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,


           home:NewsLayout(),
           debugShowCheckedModeBanner: false,
         );
        },
      ),
    );
  }
}
