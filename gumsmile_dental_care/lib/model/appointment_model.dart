class AppointmentModel {
  final int? id;
  final String doctorName;
  final String picture;
  final String treatmentType;
  final String date;
  final String time;

  AppointmentModel({
    this.id,
    required this.doctorName,
    required this.picture,
    required this.treatmentType,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'doctorName': doctorName,
      'picture': picture,
      'treatmentType': treatmentType,
      'date': date,
      'time': time,
    };
  }

  factory AppointmentModel.fromMap(Map<String, dynamic> map) {
    return AppointmentModel(
      id: map['id'],
      doctorName: map['doctorName'],
      picture: map['picture'],
      treatmentType: map['treatmentType'],
      date: map['date'],
      time: map['time'],
    );
  }
}
