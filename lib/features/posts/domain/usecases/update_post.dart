import '../entities/post.dart';
import '../repositories/post_repository.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

class UpdatePostUseCase {
  final PostRepository repositories;

  UpdatePostUseCase(this.repositories);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repositories.updatePost(post);
  }
}
