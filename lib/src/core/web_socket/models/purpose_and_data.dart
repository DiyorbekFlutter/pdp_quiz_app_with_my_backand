import '../purposes.dart';

class PurposeAndData {
  final Purposes purpose;
  final Map<String, dynamic> data;

  const PurposeAndData({
    required this.purpose,
    required this.data
  });

  factory PurposeAndData.fromJson(Map<String, dynamic> json) => PurposeAndData(
    purpose: toPurposes(json["purpose"]),
    data: json["data"]
  );

  Map<String, dynamic> get toJson => {
    "purpose": purpose,
    "data": data
  };

  static Purposes toPurposes(String purpose) {
    switch(purpose){
      case "message": return Purposes.message;
      case "blocked": return Purposes.blocked;
      case "active": return Purposes.active;
      case "allMessages": return Purposes.allMessages;
      default: return Purposes.unknown;
    }
  }
}
