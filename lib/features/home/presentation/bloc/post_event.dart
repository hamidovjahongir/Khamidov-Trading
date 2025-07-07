part of 'post_bloc.dart';

@immutable
sealed class PostEvent {}

class GetPosts extends PostEvent {
  GetPosts();
}
