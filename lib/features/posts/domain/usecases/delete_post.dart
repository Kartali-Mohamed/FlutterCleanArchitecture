import '../repositories/post_repository.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

class DeletePostUseCase {
  final PostRepository repositories;

  DeletePostUseCase(this.repositories);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repositories.deletePost(postId);
  }
}
