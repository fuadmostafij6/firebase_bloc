part of 'post_bloc.dart';

@immutable
abstract class PostState extends Equatable {}

class PostInitial extends PostState  {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}


class PostLoading extends PostState  {
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class PostLoaded extends PostState  {
  final List <PostModel> post;
PostLoaded(this.post);

  @override
  // TODO: implement props
  List<Object?> get props => [post];

}


class PostError extends PostState  {
  final String postError;
  PostError(this.postError);

  @override
  // TODO: implement props
  List<Object?> get props => [postError];

}
