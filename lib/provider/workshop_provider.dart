import 'package:flutter/cupertino.dart';
import 'package:foukabay_admin/Models/customers.dart';
import 'package:foukabay_admin/Models/events_model.dart';
import 'package:foukabay_admin/Models/register_workshop.dart';
import 'package:foukabay_admin/Network/get_dio.dart';
import 'package:foukabay_admin/Repository/workshop_services.dart';

class WorkShopProvider extends ChangeNotifier {
  WorkShopServices workShopServices = new WorkShopServices(GetDio().getDio());

  List<Events> listWorkshops = [];
  List<Customers> listRegisteredCustomers = [];
  late Events events;

  Future getAllEvents() async {
    return await workShopServices.getWorkShops().then((value) async {
      if (value.statusCode == 200) {
        listWorkshops =
            List<Events>.from(value.data.map((x) => Events.fromMap(x)));
        listWorkshops.sort((a, b) => a.datetime!.compareTo(b.datetime!));
        //  listRegisteredCustomers.removeWhere((element) => false)
        notifyListeners();
        return listWorkshops;
      } else {
        return [];
      }
    }).catchError((error) {
      throw error.toString();
    });
  }

  Future getAllCustomersByEventId() async {
    return await workShopServices
        .getCustomersRegistered(events.id!)
        .then((value) async {
      if (value.statusCode == 200) {
        listRegisteredCustomers =
            List<Customers>.from(value.data.map((x) => Customers.fromMap(x)));
        notifyListeners();
        return listRegisteredCustomers;
      } else {
        return [];
      }
    }).catchError((error) {
      throw error.toString();
    });
  }

  setSelectedEvent(selectedEventValue) {
    events = selectedEventValue;
    notifyListeners();
  }

  Future userWorkshopRegister(RegisterWorkshop registerWorkshop) async {
    return await workShopServices
        .userRegisterWorkshop(registerWorkshop)
        .then((value) async {
      if (value.statusCode == 200) {
        return value;
      } else {
        return 'Error';
      }
    }).catchError((error) {
      throw error.toString();
    });
  }

  Future adminWorkshopRegister(Events events) async {
    return await workShopServices.adminAddWorkshop(events).then((value) async {
      if (value.statusCode == 200) {
        return value;
      } else {
        return 'Error';
      }
    }).catchError((error) {
      throw error.toString();
    });
  }

  Future adminEditWorkshop(Events events) async {
    return await workShopServices.adminEditWorkshop(events).then((value) async {
      if (value.statusCode == 200) {
        return value;
      } else {
        return 'Error';
      }
    }).catchError((error) {
      throw error.toString();
    });
  }
}
