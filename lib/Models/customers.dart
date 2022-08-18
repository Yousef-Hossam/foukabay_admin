// To parse this JSON data, do
//
//     final registerWorkshop = registerWorkshopFromMap(jsonString);

import 'dart:convert';

RegisterUsersWorkshop registerWorkshopFromMap(String str) =>
    RegisterUsersWorkshop.fromMap(json.decode(str));

String registerWorkshopToMap(RegisterUsersWorkshop data) =>
    json.encode(data.toMap());

class RegisterUsersWorkshop {
  RegisterUsersWorkshop({this.customer, this.eventId, this.eventBatchId});

  Customer? customer;
  int? eventId;
  int? eventBatchId;

  factory RegisterUsersWorkshop.fromMap(Map<String, dynamic> json) =>
      RegisterUsersWorkshop(
        customer: json["customer"] == null
            ? null
            : Customer.fromMap(json["customer"]),
        eventId: json["EventId"] == null ? null : json["EventId"],
        eventBatchId:
            json["EventBatchId"] == null ? null : json["EventBatchId"],
      );

  Map<String, dynamic> toMap() => {
        "customer": customer == null ? null : customer!.toMap(),
        "EventId": eventId == null ? null : eventId,
        "EventBatchId": eventBatchId == null ? null : eventBatchId,
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
  String? mobileNumber;
  String? unitNumber;
  String? email;
  int? noOfAttendancies;

  factory Customer.fromMap(Map<String, dynamic> json) => Customer(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        mobileNumber:
            json["mobilenumber"] == null ? null : json["mobilenumber"],
        unitNumber: json["unitNumber"] == null ? null : json["unitNumber"],
        email: json["email"] == null ? null : json["email"],
        noOfAttendancies:
            json["noOfAttendancies"] == null ? null : json["noOfAttendancies"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "mobilenumber": mobileNumber == null ? null : mobileNumber,
        "unitNumber": unitNumber == null ? null : unitNumber,
        "email": email == null ? null : email,
        "noOfAttendancies": noOfAttendancies == null ? null : noOfAttendancies,
      };
}
