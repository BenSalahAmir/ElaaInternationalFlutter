class Reservation {
  String serviceName;
  String userName;
  String userConfirmation;
  DateTime reservationDateTime;
  bool isConfirmed;

  Reservation({
    required this.serviceName,
    required this.userName,
    required this.userConfirmation,
    required this.reservationDateTime,
    required this.isConfirmed,
  });

  Map<String, dynamic> toJson() {
    return {
      'serviceName': serviceName,
      'userName': userName,
      'userConfirmation': userConfirmation,
      'reservationDateTime': reservationDateTime.toIso8601String(),
      'isConfirmed': isConfirmed,
    };
  }
  factory Reservation.fromJson(Map<String, dynamic> json) {
    return Reservation(
      serviceName: json['serviceName'],
      userName: json['userName'],
      userConfirmation: json['userConfirmation'],
      reservationDateTime: DateTime.parse(json['reservationDateTime']),
      isConfirmed: json['isConfirmed'],
    );
  }
}
