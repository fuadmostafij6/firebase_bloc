import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../model/post.dart';
import '../repo/firbaseData.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  List <PostModel> post =[];

  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) async{

   emit(PostLoading());

  post = (await FirebaseServices().get())!;

  if(post.isNotEmpty){
    emit(PostLoaded(post));
  }
   else{
    emit(PostError("Error"));
  }



    });
  }
}
