import 'package:clean_architecture_app/features/posts/domain/entities/post.dart';
import 'package:clean_architecture_app/features/posts/domain/repositories/post_repository.dart';
import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUseCase {
  final PostRepository repositories;

  UpdatePostUseCase(this.repositories);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repositories.updatePost(post);
  }
}
