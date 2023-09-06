class CommonEntity<T> {
  final bool? status;
  final String? message;
  final T? data;

  CommonEntity({
    this.status,
    this.message,
    this.data,
  });
}
