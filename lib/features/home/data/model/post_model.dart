class TradingPostModel {
  final String? userName;
  final String? date;
  final String? message;
  final String? userImage;
  final String? postTime;
  final int? likes;
  final String? time;
  TradingPostModel({
    this.userName,
    this.date,
    this.message,
    this.userImage,
    this.postTime,
    this.likes,
    this.time,
  });

  factory TradingPostModel.fromJson(Map<String, dynamic> json) {
    return TradingPostModel(
      time: json['time'] as String,
      userName: json['userName'] as String?,
      date: json['date'] as String?,
      message: json['message'] as String?,
      userImage: json['userImage'] as String?,
      postTime: json['postTime'] as String?,
      likes: json['likes'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'userName': userName,
      'date': date,
      'message': message,
      'userImage': userImage,
      'postTime': postTime,
      'likes': likes,
    };
  }

  @override
  String toString() {
    return 'TradingPostModel(userName: $userName, date: $date, message: $message, userImage: $userImage, postTime: $postTime, likes: $likes)';
  }
}
