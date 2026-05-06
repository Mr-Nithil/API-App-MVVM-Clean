import 'package:api_app_mvvm_clean/features/posts/data/models/post.dart';
import 'package:api_app_mvvm_clean/features/posts/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_view_model.g.dart';

@riverpod
class PostViewModel extends _$PostViewModel {
  late PostRepository _postRepository;
  @override
  Future<List<Post>> build() async {
    _postRepository = ref.watch(postRepositoryProvider);
    final res = await _postRepository.fetchPosts();
    return res.fold((l) => throw Exception(l.message), (r) => r);
  }

  Future<void> updatePost(Post updatedPost) async {
    state.whenData((posts) {
      final updatedList = posts.map((post) {
        return post.id == updatedPost.id ? updatedPost : post;
      }).toList();

      state = AsyncValue.data(updatedList);
    });
  }
}
