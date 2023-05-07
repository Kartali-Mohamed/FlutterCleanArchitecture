import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/post.dart';
import '../repositories/post_repository.dart';

class GetAllPostsUseCase {
  final PostRepository repositories;

  GetAllPostsUseCase(this.repositories);

  Future<Either<Failure, List<Post>>> call() async {
    return await repositories.getAllPosts();
  }
}
