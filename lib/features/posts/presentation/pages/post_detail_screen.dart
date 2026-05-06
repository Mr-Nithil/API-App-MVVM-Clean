import 'package:api_app_mvvm_clean/core/widgets/loader.dart';
import 'package:api_app_mvvm_clean/features/posts/presentation/viewmodels/post_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PostDetailScreen extends ConsumerStatefulWidget {
  final int postId;
  const PostDetailScreen({super.key, required this.postId});

  @override
  ConsumerState<PostDetailScreen> createState() => _PostDetailScreenState();
}

class _PostDetailScreenState extends ConsumerState<PostDetailScreen> {
  bool isEditing = false;

  late TextEditingController titleController;
  late TextEditingController bodyController;

  @override
  void dispose() {
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postState = ref.watch(postViewModelProvider);

    return Scaffold(
      appBar: AppBar(title: const Text('Post Details')),
      body: postState.when(
        data: (posts) {
          final post = posts.firstWhere((p) => p.id == widget.postId);

          titleController = TextEditingController(text: post.title);
          bodyController = TextEditingController(text: post.body);

          return Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                isEditing
                    ? TextField(controller: titleController, maxLines: null)
                    : Text(post.title),

                const SizedBox(height: 16),

                isEditing
                    ? TextField(controller: bodyController, maxLines: null)
                    : Text(post.body),

                const SizedBox(height: 20),

                ElevatedButton(
                  onPressed: () {
                    if (isEditing) {
                      final updated = post.copyWith(
                        title: titleController.text,
                        body: bodyController.text,
                      );

                      ref
                          .read(postViewModelProvider.notifier)
                          .updatePost(updated);
                    }

                    setState(() {
                      isEditing = !isEditing;
                    });
                  },
                  child: Text(isEditing ? 'Save' : 'Edit'),
                ),
              ],
            ),
          );
        },
        error: (e, _) => ErrorWidget(e.toString()),
        loading: () => Loader(),
      ),
    );
  }
}
