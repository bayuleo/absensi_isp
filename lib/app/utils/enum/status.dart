enum StatusRequest {
  all('All'),
  pending('Pending'),
  reject('Reject'),
  approve('Approve');

  final String value;
  const StatusRequest(this.value);

  static StatusRequest fromValue(String? value) {
    return values.firstWhere(
      (element) => element.value == value,
      orElse: () => StatusRequest.all,
    );
  }
}
