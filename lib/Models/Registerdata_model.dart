// To parse this JSON data, do
//
//     final registerEvent = registerEventFromMap(jsonString);

import 'dart:convert';

RegisterEvent registerEventFromMap(String str) =>
    RegisterEvent.fromMap(json.decode(str));

String registerEventToMap(RegisterEvent data) => json.encode(data.toMap());

class RegisterEvent {
  RegisterEvent({
    this.id,
    this.noOfAttendeienc,
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.unitNumber,
    this.registeredEvents,
    this.email,
  });

  int? id;
  int? noOfAttendeienc;
  String? firstName;
  String? lastName;
  int? mobileNumber;
  int? unitNumber;
  List<RegisteredEvent>? registeredEvents;
  String? email;

  factory RegisterEvent.fromMap(Map<String, dynamic> json) => RegisterEvent(
        id: json["id"] == null ? null : json["id"],
        noOfAttendeienc:
            json["noOfAttendeienc"] == null ? null : json["noOfAttendeienc"],
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        mobileNumber:
            json["mobileNumber"] == null ? null : json["mobileNumber"],
        unitNumber: json["unitNumber"] == null ? null : json["unitNumber"],
        registeredEvents: json["registeredEvents"] == null
            ? null
            : List<RegisteredEvent>.from(json["registeredEvents"]
                .map((x) => RegisteredEvent.fromMap(x))),
        email: json["email"] == null ? null : json["email"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "noOfAttendeienc": noOfAttendeienc == null ? null : noOfAttendeienc,
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "mobileNumber": mobileNumber == null ? null : mobileNumber,
        "unitNumber": unitNumber == null ? null : unitNumber,
        "registeredEvents": registeredEvents == null
            ? null
            : List<dynamic>.from(registeredEvents!.map((x) => x.toMap())),
        "email": email == null ? null : email,
      };
}

class RegisteredEvent {
  RegisteredEvent({
    this.id,
    this.eventName,
    this.eventType,
    this.noOfSeats,
    this.minAge,
    this.maxAge,
    this.imageUrl,
    this.available,
    this.registeredCustomers,
    this.description,
    this.datetime,
    this.durationHours,
  });

  int? id;
  String? eventName;
  String? eventType;
  int? noOfSeats;
  int? minAge;
  int? maxAge;
  String? imageUrl;
  bool? available;
  List<String>? registeredCustomers;
  String? description;
  DateTime? datetime;
  int? durationHours;

  factory RegisteredEvent.fromMap(Map<String, dynamic> json) => RegisteredEvent(
        id: json["id"] == null ? null : json["id"],
        eventName: json["eventName"] == null ? null : json["eventName"],
        eventType: json["eventType"] == null ? null : json["eventType"],
        noOfSeats: json["noOfSeats"] == null ? null : json["noOfSeats"],
        minAge: json["minAge"] == null ? null : json["minAge"],
        maxAge: json["maxAge"] == null ? null : json["maxAge"],
        imageUrl: json["imageUrl"] == null ? null : json["imageUrl"],
        available: json["available"] == null ? null : json["available"],
        registeredCustomers: json["registeredCustomers"] == null
            ? null
            : List<String>.from(json["registeredCustomers"].map((x) => x)),
        description: json["description"] == null ? null : json["description"],
        datetime:
            json["datetime"] == null ? null : DateTime.parse(json["datetime"]),
        durationHours:
            json["durationHours"] == null ? null : json["durationHours"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "eventName": eventName == null ? null : eventName,
        "eventType": eventType == null ? null : eventType,
        "noOfSeats": noOfSeats == null ? null : noOfSeats,
        "minAge": minAge == null ? null : minAge,
        "maxAge": maxAge == null ? null : maxAge,
        "imageUrl": imageUrl == null ? null : imageUrl,
        "available": available == null ? null : available,
        "registeredCustomers": registeredCustomers == null
            ? null
            : List<dynamic>.from(registeredCustomers!.map((x) => x)),
        "description": description == null ? null : description,
        "datetime": datetime == null ? null : datetime!.toIso8601String(),
        "durationHours": durationHours == null ? null : durationHours,
      };
}
