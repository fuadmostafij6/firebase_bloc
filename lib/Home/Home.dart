

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firbase/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/firbaseData.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

 @override
  void initState() {
   context.read<PostBloc>().add(PostAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    context.read<PostBloc>().add(PostAll());

    return
      Scaffold(
      body:

          BlocBuilder<PostBloc, PostState>(
            builder: (context, state){

              if(state is PostLoading){
                return const Center(child:  CircularProgressIndicator(),);
              }
              else if(state is PostLoaded){


                return
                  ListView.builder(
                      itemCount: state.post.length,
                      itemBuilder:(context, index){
                    var data = state.post[index];
                    return

                      ListTile(
                        title:Text(data.title!),
                        subtitle:Text(data.desc!) ,
                      );
                  });

              }

              else{
                return  Center(
                  child:  Text("No data"),
                );
              }
            },
          )
    );
  }
}
