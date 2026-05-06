import 'dart:convert';

import 'package:api_app_mvvm_clean/core/error/failure.dart';
import 'package:api_app_mvvm_clean/features/posts/data/models/post.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'post_remote_datasource.g.dart';

@riverpod
PostRemoteDatasource postRemoteDataSource(Ref ref) {
  return PostRemoteDatasource();
}

class PostRemoteDatasource {
  Future<List<Post>> fetchPost() async {
    try {
      final response = await http.get(
        Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=15'),
      );

      if (response.statusCode != 200) {
        throw Failure();
      }

      final List<dynamic> decoded = jsonDecode(response.body);

      return decoded
          .map((e) => Post.fromMap(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      throw Failure(e.toString());
    }
  }
}
