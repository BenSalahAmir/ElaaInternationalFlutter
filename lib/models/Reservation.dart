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
}
