import 'package:api_app_mvvm_clean/core/error/failure.dart';
import 'package:api_app_mvvm_clean/features/posts/data/datasources/post_remote_datasource.dart';
import 'package:api_app_mvvm_clean/features/posts/data/models/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_repository.g.dart';

@riverpod
PostRepository postRepository(Ref ref) {
  final postRemoteDatasource = ref.watch(postRemoteDataSourceProvider);
  return PostRepository(postRemoteDatasource: postRemoteDatasource);
}

class PostRepository {
  final PostRemoteDatasource _postRemoteDatasource;

  PostRepository({required PostRemoteDatasource postRemoteDatasource})
    : _postRemoteDatasource = postRemoteDatasource;

  Future<Either<Failure, List<Post>>> fetchPosts() async {
    try {
      final posts = await _postRemoteDatasource.fetchPost();
      return Right(posts);
    } catch (e) {
      if (e is Failure) {
        return Left(e);
      }
      return Left(Failure(e.toString()));
    }
  }
}
