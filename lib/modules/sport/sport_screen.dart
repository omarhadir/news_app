

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled10/layout/news_app/cubit/cubit.dart';
import 'package:untitled10/layout/news_app/cubit/states.dart';
import 'package:untitled10/shared/componenst/components.dart';

class SportScreen extends StatelessWidget {
  const SportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder: (context,state){

        var list=NewsCubit.get(context).sports;
        return buildConditionalBuilder(list);
      },
    );
  }
}
