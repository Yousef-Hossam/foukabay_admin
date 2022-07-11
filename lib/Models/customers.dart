class Customers {
  Customers(
      {this.firstName,
      this.lastName,
      this.mobileNumber,
      this.unitNumber,
      this.email,
      this.noOfAttendancies,
      this.id});

  String? firstName;
  String? lastName;
  String? mobileNumber;
  String? unitNumber;
  String? email;
  int? noOfAttendancies;
  int? id;

  factory Customers.fromMap(Map<String, dynamic> json) => Customers(
        firstName: json["firstName"] == null ? null : json["firstName"],
        lastName: json["lastName"] == null ? null : json["lastName"],
        mobileNumber:
            json["mobilenumber"] == null ? null : json["mobilenumber"],
        unitNumber: json["unitNumber"] == null ? null : json["unitNumber"],
        email: json["email"] == null ? null : json["email"],
        noOfAttendancies:
            json["noOfAttendancies"] == null ? null : json["noOfAttendancies"],
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toMap() => {
        "firstName": firstName == null ? null : firstName,
        "lastName": lastName == null ? null : lastName,
        "mobilenumber": mobileNumber == null ? null : mobileNumber,
        "unitNumber": unitNumber == null ? null : unitNumber,
        "email": email == null ? null : email,
        "noOfAttendancies": noOfAttendancies == null ? null : noOfAttendancies,
        "id": id == null ? null : id,
      };
}
