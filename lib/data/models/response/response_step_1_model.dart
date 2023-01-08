class ResponseStep1 {
  bool? success;
  String? responseMessage;

  ResponseStep1({
    this.success = false,
    this.responseMessage = '',
  });

  factory ResponseStep1.fromJson(Map<String, dynamic> json) {
    return ResponseStep1(
      success: json['success'],
      responseMessage: json['msg']
    );
  }
}