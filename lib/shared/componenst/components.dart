

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled10/modules/search/search_screen.dart';
import 'package:untitled10/modules/webview/webview_screen.dart';

Widget BuildArticleItem(aricle,context)=> InkWell(
  onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=>WebViewScreen(aricle['url'])));
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

      children: [

        Container(

            height: 120.0,

            width: 120.0,

            child: Image(image: NetworkImage('${aricle['urlToImage']}'),fit: BoxFit.cover,)),

        SizedBox(

          width: 10.0,

        ),

        Expanded(

          child: Container(

            height: 120.0,

            width: double.infinity,

            child: Column(

              crossAxisAlignment: CrossAxisAlignment.start,

              children: [

                Expanded(

                  child: Text('${aricle['title']}',

                    maxLines: 3,

                    overflow: TextOverflow.ellipsis,

                    style: Theme.of(context).textTheme.bodyText1,

                  ),

                ),

                Text('${aricle['publishedAt']}',

                  style:TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0,color: Colors.grey) ,),

              ],

            ),

          ),

        ),

      ],

    ),

  ),
);
Widget MyDivider()=>Padding(
  padding: const EdgeInsets.all(20.0),
  child: Container(height: 1.0,width: double.infinity,color: Colors.grey[400],),
);
Widget BuildList(list)=>ListView.separated(itemBuilder: (context,index)=>BuildArticleItem(list[index],context),
    separatorBuilder: (context,index)=>MyDivider(),
    itemCount:list.length);
Widget buildConditionalBuilder(list,{isSearch=false})=>ConditionalBuilder(
  condition: list.length>0,
  builder: (context)=>BuildList(list),
  fallback: (context)=>isSearch? Container():Center(child: CircularProgressIndicator()),
);

