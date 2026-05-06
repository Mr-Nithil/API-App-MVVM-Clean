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
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "Title",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8),
                isEditing
                    ? TextField(
                        controller: titleController,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Enter post title",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 8,
                          ),
                        ),
                      )
                    : Text(post.title, style: const TextStyle(fontSize: 16)),

                const SizedBox(height: 24),

                Text(
                  "Body",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 8),
                isEditing
                    ? TextField(
                        controller: bodyController,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: "Write your content here...",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      )
                    : Text(
                        post.body,
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),

                const SizedBox(height: 32),

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    backgroundColor: Colors.grey[700],
                    foregroundColor: Colors.white,
                  ),
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
                  child: Text(
                    isEditing ? 'Save Changes' : 'Edit Post',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
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
