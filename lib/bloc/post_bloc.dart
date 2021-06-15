import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/model/post.dart';

class PostEvent {}

abstract class PostState {}

class PostUninitialized extends PostState {}

class PostLoaded extends PostState {
  List<Post> posts = [];
  bool hasReachedMax = false;

  PostLoaded({required this.posts, required this.hasReachedMax});

  PostLoaded copyWith({
    required List<Post> posts,
    required bool hasReachedMax,
  }) {
    return PostLoaded(
      posts: this.posts,
      hasReachedMax: this.hasReachedMax,
    );
  }
}

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc(PostState initialState) : super(PostUninitialized());

  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    List<Post> posts;

    if (state is PostUninitialized) {
      posts = await Post.connectToApi(0, 10);
      yield PostLoaded(posts: posts, hasReachedMax: false);
    } else {
      PostLoaded postLoaded = state as PostLoaded;
      posts = await Post.connectToApi(postLoaded.posts.length, 10);

      yield (posts.isEmpty)
          ? postLoaded.copyWith(posts: postLoaded.posts, hasReachedMax: true)
          : PostLoaded(posts: postLoaded.posts + posts, hasReachedMax: false);
    }
  }
}
