

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/layout/TodoApp/cubit/cubit.dart';
import 'package:untitled10/layout/news_app/cubit/cubit.dart';
import 'package:untitled10/layout/news_app/cubit/states.dart';
import 'package:untitled10/modules/search/search_screen.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
     listener: (context,state){},
      builder: (context,state){
       var cubit=NewsCubit.get(context);
       return Scaffold(

         appBar: AppBar(
           title: Text('News App',
             style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold,),),
           actions: [
             IconButton(onPressed: (){
               Navigator.push(context, MaterialPageRoute(builder: (context)=>SearchScreen()));
             }, icon: Icon(Icons.search),),
             IconButton(onPressed: (){
               AppCubit.get(context).changeAppMode();

             }, icon: Icon(Icons.brightness_4_outlined),),
           ],
         ),
         body: cubit.screen[cubit.currentIndex],
         bottomNavigationBar: BottomNavigationBar(
           items: cubit.bottomNav,
           currentIndex: cubit.currentIndex,
           onTap: (index){
             cubit.changeBottomNav(index);

           },
         ),
       );
      },
    );
  }
}
