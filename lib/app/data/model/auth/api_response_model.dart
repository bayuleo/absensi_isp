class ApiResponse<T> {
  bool status;
  String message;
  T data;
  ApiResponse(
      {required this.status, required this.message, required this.data});

  factory ApiResponse.fromJson(
      Map<String, dynamic> json, Function(Map<String, dynamic>) create) {
    return ApiResponse<T>(
      status: json["status"],
      message: json["message"],
      data: create(json["data"]),
    );
  }
}
