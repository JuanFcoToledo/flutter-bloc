import 'package:equatable/equatable.dart';

/// Resource representa el resultado de una operación que puede fallar
abstract class Resource<T> extends Equatable {
  const Resource();

  @override
  List<Object?> get props => [];
}

class Loading<T> extends Resource<T> {
  const Loading();
}

class Success<T> extends Resource<T> {
  const Success(this.data);
  final T data;

  @override
  List<Object?> get props => [data];
}

class Error<T> extends Resource<T> {
  const Error(this.message, {this.code});
  final String message;
  final String? code;

  @override
  List<Object?> get props => [message, code];
}

/// Extension methods para facilitar el uso
extension ResourceExtensions<T> on Resource<T> {
  bool get isLoading => this is Loading<T>;
  bool get isSuccess => this is Success<T>;
  bool get isError => this is Error<T>;

  T? get data => this is Success<T> ? (this as Success<T>).data : null;
  String? get errorMessage =>
      this is Error<T> ? (this as Error<T>).message : null;
}
