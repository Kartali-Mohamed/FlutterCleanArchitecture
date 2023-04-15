import 'package:clean_architecture_app/features/posts/domain/repositories/post_repository.dart';
import 'package:clean_architecture_app/core/error/failures.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase {
  final PostRepository repositories;

  DeletePostUseCase(this.repositories);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repositories.deletePost(postId);
  }
}
