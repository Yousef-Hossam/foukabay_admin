const baseUrl = "http://104.248.84.202:8080/";

class ApiRoutes {
  static const getEvent = "${baseUrl}event/";

  static const postWorkshop = "${baseUrl}event";

  static const postRegister = "${baseUrl}customer";

  static const EdirWorkshop = "${baseUrl}event";

  static const getCustomersByEventId =
      "${baseUrl}event/getEventCustomers?eventId={eventid}";
}
