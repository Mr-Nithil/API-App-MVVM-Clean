import 'package:api_app_mvvm_clean/core/widgets/loader.dart';
import 'package:api_app_mvvm_clean/features/posts/presentation/viewmodels/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostListScreen extends ConsumerWidget {
  const PostListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postState = ref.watch(postViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Post List")),
      body: postState.when(
        data: (posts) {
          return ListView.builder(
            itemCount: posts.length,
            itemBuilder: (_, index) {
              final post = posts[index];

              return ListTile(title: Text(post.title), onTap: () {});
            },
          );
        },
        error: (e, _) => Center(child: Text(e.toString())),
        loading: () => Loader(),
      ),
    );
  }
}
