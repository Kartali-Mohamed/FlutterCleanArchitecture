import '../entities/post.dart';
import '../repositories/post_repository.dart';
import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';

class AddPostUseCase {
  final PostRepository repositories;

  AddPostUseCase(this.repositories);

  Future<Either<Failure, Unit>> call(Post post) async {
    return await repositories.addPost(post);
  }
}
