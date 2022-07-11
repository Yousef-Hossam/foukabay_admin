// To parse this JSON data, do
//
//     final registerWorkshop = registerWorkshopFromMap(jsonString);

import 'dart:convert';

RegisterWorkshop registerWorkshopFromMap(String str) =>
    RegisterWorkshop.fromMap(json.decode(str));

String registerWorkshopToMap(RegisterWorkshop data) =>
    json.encode(data.toMap());

class RegisterWorkshop {
  RegisterWorkshop({
    this.customer,
    this.eventId,
  });

  Customer? customer;
  int? eventId;

  factory RegisterWorkshop.fromMap(Map<String, dynamic> json) =>
      RegisterWorkshop(
        customer: json["customer"] == null
            ? null
            : Customer.fromMap(json["customer"]),
        eventId: json["EventId"] == null ? null : json["EventId"],
      );

  Map<String, dynamic> toMap() => {
        "customer": customer == null ? null : customer!.toMap(),
        "EventId": eventId == null ? null : eventId,
      };
}

class Customer {
  Customer({
    this.firstName,
    this.lastName,
    this.mobileNumber,
    this.unitNumber,
    this.email,
    this.noOfAttendancies,
  });

  String? firstName;
  String? lastName;
  int? mobileNumber;
  String? unitNumber;
  String? email;
  int? noOfAttendancies;

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        mobileNumber:
            json["mobileNumber"] == null ? null : json["mobileNumber"],
        unitNumber: json["unitNumber"] == null ? null : json["unitNumber"],
        email: json["email"] == null ? null : json["email"],
        noOfAttendancies:
            json["noOfAttendancies"] == null ? null : json["noOfAttendancies"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "mobileNumber": mobileNumber == null ? null : mobileNumber,
        "unitNumber": unitNumber == null ? null : unitNumber,
        "email": email == null ? null : email,
        "noOfAttendancies": noOfAttendancies == null ? null : noOfAttendancies,
      };
}
