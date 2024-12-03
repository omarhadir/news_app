

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/layout/news_app/cubit/cubit.dart';
import 'package:untitled10/layout/news_app/cubit/states.dart';
import 'package:untitled10/modules/webview/webview_screen.dart';
import 'package:untitled10/shared/componenst/components.dart';

class SearchScreen extends StatelessWidget {
  var searchController=TextEditingController();
  // var isSearch=true;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){
        var list=NewsCubit.get(context).search;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextFormField(
                  onChanged: (value){
                    NewsCubit.get(context).getSearchData(value);
                  },
                  keyboardType: TextInputType.text,
                  controller:searchController ,
                  validator: (String? value){
                    if(value!.isEmpty)
                      return 'Search don\'t be empty';
                  },
                  decoration: InputDecoration(
                    label: Text('Search'),
                     prefixIcon: Icon(Icons.search),
                     border: OutlineInputBorder()
                  ),
                ),
              ),
              SizedBox(height: 20.0,),
              Expanded(child: buildConditionalBuilder(list,isSearch: true)),




            ],
          ),
        );
      },
    );
  }
  Widget BuildListItem( article, context)=> InkWell(
    onTap: ()
    {
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(article['url'])));
    },



    child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        children: [
          Container(
              height: 120.0,
              width: 120.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Image(image: NetworkImage('${article['urlToImage']}'),fit: BoxFit.cover,)),
          SizedBox(width: 10.0,),
          Expanded(
            child: Container(
              height: 120.0,
              width: 120.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text('${article['title']}',maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style:Theme.of(context).textTheme.bodyText1 ,
                    ),

                  ),
                  Text('${article['publishedAt']}',
                    style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold,color: Colors.grey),),
                ],
              ),
            ),
          )

        ],
      ),
    ),
  );

}

