import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../repositories/post_repository.dart';

class DeletePostUseCase {
  final PostRepository repositories;

  DeletePostUseCase(this.repositories);

  Future<Either<Failure, Unit>> call(int postId) async {
    return await repositories.deletePost(postId);
  }
}
