// lib/core/errors/failures.dart

abstract class Failure {
  final String message;
  const Failure(this.message);
}

class NetworkFailure extends Failure {
  const NetworkFailure([super.message = 'Sin conexión a internet']);
}

class ServerFailure extends Failure {
  final int? statusCode;
  const ServerFailure({String message = 'Error del servidor', this.statusCode})
      : super(message);
}

class NotFoundFailure extends Failure {
  const NotFoundFailure([super.message = 'Pokémon no encontrado']);
}

class CacheFailure extends Failure {
  const CacheFailure([super.message = 'Error al acceder a datos locales']);
}

class UnknownFailure extends Failure {
  const UnknownFailure([super.message = 'Ocurrió un error inesperado']);
}


// lib/core/errors/exceptions.dart

class NetworkException implements Exception {
  final String message;
  const NetworkException([this.message = 'Sin conexión a internet']);
}

class ServerException implements Exception {
  final String message;
  final int? statusCode;
  const ServerException({this.message = 'Error del servidor', this.statusCode});
}

class NotFoundException implements Exception {
  final String message;
  const NotFoundException([this.message = 'Pokémon no encontrado']);
}

class CacheException implements Exception {
  final String message;
  const CacheException([this.message = 'Error al acceder a datos locales']);
}
