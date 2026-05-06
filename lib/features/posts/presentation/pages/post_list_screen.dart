import 'package:api_app_mvvm_clean/core/widgets/loader.dart';
import 'package:api_app_mvvm_clean/features/posts/presentation/pages/post_detail_screen.dart';
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
          return Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
            child: ListView.builder(
              itemCount: posts.length,
              itemBuilder: (_, index) {
                final post = posts[index];

                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 5),
                  child: ListTile(
                    title: Text(post.title),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    subtitle: Text(
                      "Tap to read more about this post...",
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PostDetailScreen(postId: post.id),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          );
        },
        error: (e, _) => Center(child: Text(e.toString())),
        loading: () => Loader(),
      ),
    );
  }
}
