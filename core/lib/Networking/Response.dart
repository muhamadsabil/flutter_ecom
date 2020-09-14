class ResponseApi<T> {
  Status status;
  T data;
  String message;

  ResponseApi.loading(this.message) : status = Status.LOADING;
  ResponseApi.completed(this.data) : status = Status.COMPLETED;
  ResponseApi.error(this.message) : status = Status.ERROR;

  @override
  String toString() {
    return "Status : $status \n Message : $message \n Data : $data";
  }
}

enum Status { LOADING, COMPLETED, ERROR }