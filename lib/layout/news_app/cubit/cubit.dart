//
//
//
//
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:untitled10/layout/news_app/cubit/states.dart';
// import 'package:untitled10/modules/business/buisiness_screen.dart';
// import 'package:untitled10/modules/science/science_screen.dart';
// import 'package:untitled10/modules/sport/sport_screen.dart';
// import 'package:untitled10/shared/network/remote/dio_helper.dart';
//
// class NewsCubit extends Cubit<NewsStates>{
//   NewsCubit() : super(NewsInitialStates());
//   static NewsCubit get(context)=>BlocProvider.of(context);
//   int currentIndex=0;
//
//   List<Widget> screen=[
//     BusinessScreen(),
//     SportScreen(),
//     ScienceScreen(),
//   ];
//   List<BottomNavigationBarItem> bottomNav=[
//     BottomNavigationBarItem(icon: Icon(Icons.business),label: 'Business'),
//     BottomNavigationBarItem(icon: Icon(Icons.sports),label: 'Sports'),
//     BottomNavigationBarItem(icon: Icon(Icons.science),label: 'Science'),
//   ];
//   void changeBottomNavBar(int index)
//   {
//     if(index==1)
//       getSportsData();
//     if(index==2)
//       getScienceData();
//     currentIndex=index;
//     emit(ChangeBottomNav());
//   }
//
//   List<dynamic> business=[];
//   void getBusinessData()
//   {
//     emit(NewsBusinessLoadingStates());
//     DioHelper.getData(url: 'v2/everything',
//     query: {
//       'q': 'tesla',
//       // 'from': '2024-08-16',
//       'sortBy': 'publishedAt',
//       'apiKey': 'fa12b747caef4706b4a614172b387ff0',
//
//     }).then((value) {
//       business=value.data['articles'];
//       print(business[0]['title']);
//       emit(NewsBusinessSuccessStates());
//
//     }).catchError((error){
//       print(error.toString());
//       emit(NewsBusinessErrorStates());
//     });
//   }
//
//
//   List<dynamic> sports=[];
//   void getSportsData()
//   {
//     emit(NewsSportsLoadingStates());
//     if(sports.length==0)
//     {
//       DioHelper.getData(url: 'v2/everything',
//           query: {
//             'q': 'sports',
//             // 'from': '2024-08-10',
//             'sortBy': 'publishedAt',
//             'apiKey': 'fa12b747caef4706b4a614172b387ff0',
//
//           }).then((value) {
//         sports=value.data['articles'];
//         print(business[0]['title']);
//         emit(NewsSportsSuccessStates());
//
//       }).catchError((error){
//         print(error.toString());
//         emit(NewsSportsErrorStates(error));
//       });
//
//     }else
//       {
//         emit(NewsSportsSuccessStates());
//       }
//
//   }
//
//
//   List<dynamic> science=[];
//   void getScienceData()
//   {
//     emit(NewsScienceLoadingStates());
//     if(science.length==0)
//       {
//         DioHelper.getData(
//             url: 'v2/everything',
//             query: {
//               'q': 'apple',
//               // 'from': '2024-08-10',
//               'sortBy': 'publishedAt',
//               'apiKey': 'fa12b747caef4706b4a614172b387ff0',
//
//             }).then((value) {
//           science=value.data['articles'];
//           print(business[0]['title']);
//           emit(NewsScienceSuccessStates());
//
//         }).catchError((error){
//           print(error.toString());
//           emit(NewsScienceErrorStates());
//         });
//       }else
//         {
//           emit(NewsScienceSuccessStates());
//         }
//
//   }
//
//
//   List<dynamic> search=[];
//   void getSearchData(String? value)
//   {
//     emit(NewsSearchLoadingStates());
//     search=[];
//
//       DioHelper.getData(
//           url: 'v2/everything',
//           query: {
//             'q': '$value',
//             'apiKey': 'fa12b747caef4706b4a614172b387ff0',
//
//           }).then((value) {
//         search=value.data['articles'];
//         print(search[0]['title']);
//         emit(NewsSearchSuccessStates());
//
//       }).catchError((error){
//         print(error.toString());
//         emit(NewsSearchErrorStates());
//       });
//
//
//   }
//
//
//
// }
//

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/layout/news_app/cubit/states.dart';
import 'package:untitled10/modules/business/buisiness_screen.dart';
import 'package:untitled10/modules/science/science_screen.dart';
import 'package:untitled10/modules/sport/sport_screen.dart';
import 'package:untitled10/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates>{
  NewsCubit(): super(NewsInitialStates());
  static NewsCubit get(context)=> BlocProvider.of(context);
  int currentIndex=0;
  List<Widget>screen=[
    BusinessScreen(),
    SportScreen(),
    ScienceScreen(),
  ];

  List<BottomNavigationBarItem> bottomNav=[
    BottomNavigationBarItem(icon: Icon(Icons.business,),label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports,),label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science,),label: 'Science'),
  ];
  void changeBottomNav(int index)
  {
    if(index==1)
      getSportsData();
    if( index==2)
      getScienceData();

    currentIndex=index;
    emit(ChangeBottomNav());
  }
  List<dynamic> business=[];

  void getBusinessData()
  {
    emit(NewsBusinessLoadingStates());
    DioHelper.getData(url: 'v2/everything',
    query: {
      'q': 'tesla',
      // 'from': '2024-08-16',
      'sortBy': 'publishedAt',
      'apiKey': 'fa12b747caef4706b4a614172b387ff0',
    }
    ).then((value) {
      business=value.data['articles'];
      print(business[0]['title']);
      emit(NewsBusinessSuccessStates());
    }).catchError((error){
      print(error.toString());
      emit(NewsBusinessErrorStates());
    });
  }
  List<dynamic> sports=[];

  void getSportsData()
  {
    if(sports.length==0)
      {
        emit(NewsSportsLoadingStates());
        DioHelper.getData(url: 'v2/everything',
            query: {
              'q': 'sports',
              // 'from': '2024-08-16',
              'sortBy': 'publishedAt',
              'apiKey': 'fa12b747caef4706b4a614172b387ff0',
            }
        ).then((value) {
          sports=value.data['articles'];
          print(sports[0]['title']);
          emit(NewsSportsSuccessStates());
        }).catchError((error){
          print(error.toString());
          emit(NewsSportsErrorStates(error));
        });
      }

  }

  List<dynamic> science=[];

  void getScienceData()
  {
    if(science.length==0)
      {
        emit(NewsScienceLoadingStates());
        DioHelper.getData(url: 'v2/everything',
            query: {
              'q': 'apple',
              // 'from': '2024-08-16',
              'sortBy': 'publishedAt',
              'apiKey': 'fa12b747caef4706b4a614172b387ff0',
            }
        ).then((value) {
          science=value.data['articles'];
          print(science[0]['title']);
          emit(NewsScienceSuccessStates());
        }).catchError((error){
          print(error.toString());
          emit(NewsScienceErrorStates());
        });
      }

  }


  List<dynamic> search=[];

  void getSearchData(String value)
  {
      emit(NewsSearchLoadingStates());
      DioHelper.getData(url: 'v2/everything',
          query: {
            'q': '$value',
            'apiKey': 'fa12b747caef4706b4a614172b387ff0',
          }
      ).then((value) {
        search=value.data['articles'];
        print(search[0]['title']);
        emit(NewsScienceSuccessStates());
      }).catchError((error){
        print(error.toString());
        emit(NewsSearchErrorStates());
      });


  }


}