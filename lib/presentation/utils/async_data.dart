class AsyncData<T> {
  Status status;
  T data;
  String message;

  AsyncData.loading({this.message}) : status = Status.LOADING;
  AsyncData.completed(this.data) : status = Status.COMPLETED;
  AsyncData.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }
