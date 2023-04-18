import 'dart:convert';
import '../../../../core/error/exceptions.dart';
import '../models/post_model.dart';
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';

abstract class PostRemoteDataSource {
  Future<List<PostModel>> getAllPosts();
  Future<Unit> deletePost(int id);
  Future<Unit> addPost(PostModel postModel);
  Future<Unit> updatePost(PostModel postModel);
}

const String BASE_URL = "https://jsonplaceholder.typicode.com";

class PostRemoteDataSourceImpl implements PostRemoteDataSource {
  final client = RetryClient(http.Client());

  @override
  Future<List<PostModel>> getAllPosts() async {
    final response = await client.get(
      Uri.parse("$BASE_URL/posts"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      final List decodedJson = json.decode(response.body);
      final List<PostModel> postModels =
          decodedJson.map<PostModel>((e) => PostModel.fromJson(e)).toList();
      return Future.value(postModels);
    } else {
      throw ServeurException();
    }
  }

  @override
  Future<Unit> addPost(PostModel postModel) async {
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };

    final response = await client.post(
      Uri.parse("$BASE_URL/posts"),
      body: body,
    );

    if (response.statusCode == 201) {
      return Future.value(unit);
    } else {
      throw ServeurException();
    }
  }

  @override
  Future<Unit> deletePost(int id) async {
    final response = await client.delete(
      Uri.parse("$BASE_URL/posts/${id.toString()}"),
      headers: {"Content-Type": "application/json"},
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServeurException();
    }
  }

  @override
  Future<Unit> updatePost(PostModel postModel) async {
    final id = postModel.id.toString();
    final body = {
      "title": postModel.title,
      "body": postModel.body,
    };

    final response = await client.patch(
      Uri.parse("$BASE_URL/posts/$id"),
      body: body,
    );

    if (response.statusCode == 200) {
      return Future.value(unit);
    } else {
      throw ServeurException();
    }
  }
}
