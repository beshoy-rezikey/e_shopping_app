class ChangeFavModel {
  bool? status;
  String? message;

  ChangeFavModel({
    required this.status,
    required this.message,
  });

  factory ChangeFavModel.fromJson(Map<String, dynamic> json) {
    return ChangeFavModel(
      status: json['status'],
      message: json['message'],
    );
  }
}
