import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:trading_app/features/home/data/model/post_model.dart';
import 'package:trading_app/features/home/data/repository/post_repository.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository repository;
  PostBloc(this.repository) : super(PostInitial()) {
    on<GetPosts>((event, emit) async {
      
      emit(PostLoading());
      final data = await repository.getPosts();
      emit(PostSuccess(data));
    });
  }
}
