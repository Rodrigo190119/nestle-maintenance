class RequestHomeOrder {
  int? userId;

  RequestHomeOrder({this.userId});

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'state_simple': 'open'
    };
  }
}