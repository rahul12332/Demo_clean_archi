import '../../../domain/entities/post_entities.dart';

abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<PostEntity> posts;

  PostLoaded(this.posts);
}

class PostDetailLoaded extends PostState {
  final PostEntity post;

  PostDetailLoaded(this.post);
}

class PostError extends PostState {
  final String message;

  PostError(this.message);
}
