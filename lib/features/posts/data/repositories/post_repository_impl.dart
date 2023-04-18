import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../datasources/post_local_datasource.dart';
import '../datasources/post_remote_datasource.dart';
import '../models/post_model.dart';
import '../../domain/entities/post.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/post_repository.dart';
import 'package:dartz/dartz.dart';

class PostRepositoryImpl implements PostRepository {
  final PostRemoteDataSource remoteDataSource;
  final PostLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  PostRepositoryImpl(
      {required this.remoteDataSource,
      required this.localDataSource,
      required this.networkInfo});

  @override
  Future<Either<Failure, List<Post>>> getAllPosts() async {
    if (await networkInfo.isConnected) {
      try {
        List<PostModel> remoteData = await remoteDataSource.getAllPosts();
        localDataSource.cachePosts(remoteData);
        return Right(remoteData);
      } on ServeurException {
        return Left(ServeurFailure());
      }
    } else {
      try {
        List<PostModel> localData = await localDataSource.getCachedPosts();
        return Right(localData);
      } on EmptyCacheException {
        return Left(EmptyCacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, Unit>> addPost(Post post) async {
    final PostModel postModel = PostModel(title: post.title, body: post.body);

    return await _getMessage(() {
      return remoteDataSource.addPost(postModel);
    });
  }

  @override
  Future<Either<Failure, Unit>> deletePost(int id) async {
    return await _getMessage(() {
      return remoteDataSource.deletePost(id);
    });
  }

  @override
  Future<Either<Failure, Unit>> updatePost(Post post) async {
    final PostModel postModel =
        PostModel(id: post.id, title: post.title, body: post.body);

    return await _getMessage(() {
      return remoteDataSource.updatePost(postModel);
    });
  }

  Future<Either<Failure, Unit>> _getMessage(
      Future<Unit> Function() addOrDeleteOrUpdatePost) async {
    if (await networkInfo.isConnected) {
      try {
        await addOrDeleteOrUpdatePost();
        return const Right(unit);
      } on ServeurException {
        return Left(ServeurFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
