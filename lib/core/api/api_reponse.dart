class ApiResponse<T> {
  final T? data;
  final String? error;
  final bool success;
  final int? statusCode;
  final Map<String, dynamic>? metadata;

  ApiResponse._({
    this.data,
    this.error,
    this.success = false,
    this.statusCode,
    this.metadata,
  });

  factory ApiResponse.success(
    T data, {
    int? statusCode,
    Map<String, dynamic>? metadata,
  }) {
    return ApiResponse._(
      data: data,
      success: true,
      statusCode: statusCode ?? 200,
      metadata: metadata,
    );
  }

  factory ApiResponse.error(
    String error, {
    int? statusCode,
    Map<String, dynamic>? metadata,
  }) {
    return ApiResponse._(
      error: error,
      success: false,
      statusCode: statusCode ?? 400,
      metadata: metadata,
    );
  }

  bool get hasData => data != null;

  bool get hasError => error != null;
}
