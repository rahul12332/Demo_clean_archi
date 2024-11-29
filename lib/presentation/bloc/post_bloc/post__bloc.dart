import 'package:bloc/bloc.dart';
import 'package:demo/presentation/bloc/post_bloc/post__event.dart';
import 'package:demo/presentation/bloc/post_bloc/post__state.dart';

import '../../../data/models/post_model.dart';
import '../../../domain/entities/post_entities.dart';
import '../../../services/api_service.dart';
import '../../../services/local_storage_service.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final ApiService apiService = ApiService();
  final LocalStorageService localStorageService = LocalStorageService();

  PostBloc() : super(PostInitial()) {
    // Register event handlers
    on<FetchPostsEvent>(_onFetchPosts);
    on<MarkPostAsReadEvent>(_onMarkPostAsRead);
  }

  // Handler for FetchPostsEvent
  Future<void> _onFetchPosts(FetchPostsEvent event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      // Fetch posts from the API
      final response = await apiService.fetchPosts();
      final List<PostModel> postModels = response.map((e) => PostModel.fromJson(e)).toList();
      final List<PostEntity> postEntities = postModels.map((postModel) => postModel.toEntity()).toList();

      // Emit the loaded state with fetched posts
      emit(PostLoaded(postEntities));
    } catch (e) {
      emit(PostError(e.toString()));
    }
  }

  // Handler for MarkPostAsReadEvent
  void _onMarkPostAsRead(MarkPostAsReadEvent event, Emitter<PostState> emit) {
    if (state is PostLoaded) {
      final loadedState = state as PostLoaded;

      // Update the specific post's isRead property
      final updatedPosts = loadedState.posts.map((post) {
        if (post.id == event.postId) {
          return post.copyWith(isRead: true); // Mark as read
        }
        return post;
      }).toList();

      // Emit the updated state with modified posts
      emit(PostLoaded(updatedPosts));
    }
  }
}
