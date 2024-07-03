import 'package:dartz/dartz.dart';
import 'package:sree_balagi_gold/general/core/failure/main_failure.dart';

typedef FutureResult<T> = Future<Either<MainFailure, T>>;

typedef StreamResult<T> = Stream<Either<MainFailure, T>>;

typedef UseResult<T> = Either<MainFailure, T>;
