abstract class Resource<T> {
  Resource();
}

class Init extends Resource {
  Init();
}

class Loading extends Resource {
  Loading();
}

class Success<T> extends Resource<T> {
  final T data;
  Success(this.data);
}

class Failure<T> extends Resource<T> {
  final String error;
  Failure(this.error);
}