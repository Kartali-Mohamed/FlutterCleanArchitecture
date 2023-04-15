import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:clean_architecture_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_app/features/posts/domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllPostsUseCase {
  final PostRepository repositories;

  GetAllPostsUseCase(this.repositories);

  Future<Either<Failure, List<Post>>> call() async {
    return await repositories.getAllPosts();
  }
}
