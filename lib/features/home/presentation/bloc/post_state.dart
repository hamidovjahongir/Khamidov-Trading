part of 'post_bloc.dart';

@immutable
sealed class PostState {}

final class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostSuccess extends PostState {
  final List<TradingPostModel> posts;
  PostSuccess(this.posts);
}

class PostFailure extends PostState {
  final String message;
  PostFailure(this.message);
}
