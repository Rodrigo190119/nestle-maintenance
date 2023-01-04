class RequestAttentionOrder {
  int? userId;
  int? orderId;

  RequestAttentionOrder({
    this.userId,
    this.orderId,
  });

  Map<String, dynamic> toJson() {
    return {
      'user_id': userId,
      'id': orderId,
      'state_simple': 'open'
    };
  }
}