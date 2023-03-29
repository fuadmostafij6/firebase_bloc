

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

  final titleController =  TextEditingController();
  final descController =  TextEditingController();

 @override
  void initState() {
   context.read<PostBloc>().add(PostAll());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return
      Scaffold(
      body: BlocBuilder<PostBloc, PostState>(
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

                      Dismissible(

                        key: ValueKey<String>(data.postId!),
                        onDismissed: (value){
                          FirebaseServices().delete(data.postId!).then((value){
                            context.read<PostBloc>().add(PostAll());
                          });
                        },
                        child: ListTile(
                          title:Text(data.title!),
                          subtitle:Text(data.desc!) ,
                          trailing: IconButton(icon: Icon(Icons.edit),onPressed: (){
                          myShowDialog(data.postId!, data.title!, data.desc!);
                          },),
                        ),
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

   myShowDialog(String data, title, desc) {
     titleController.text = title;
     descController.text = desc;


   return
     showDialog(context: context, builder: (context)=>
       AlertDialog(
         title: Text("Edit"),
         content: Column(
           children: [
             TextField(
               controller:titleController ,
             ),
             SizedBox(height: 15,),
             TextField(
               controller:descController ,
             ),
             SizedBox(height: 15,),
             ElevatedButton(onPressed: (){

               FirebaseServices().update({
                 "title":titleController.text,
                 "desc":descController.text,
               }, data).then((value){
                 titleController.clear();
                 descController.clear();
                 Navigator.pop(context);
                 context.read<PostBloc>().add(PostAll());

               });
             }, child: Text("Edit"))
           ],
         ),
       )
   );
  }
}
