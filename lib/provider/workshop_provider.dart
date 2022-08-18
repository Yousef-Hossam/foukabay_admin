import 'package:flutter/cupertino.dart';
import 'package:foukabay_admin/Models/customers.dart';
import 'package:foukabay_admin/Models/events_model.dart';
import 'package:foukabay_admin/Models/register_workshop.dart';
import 'package:foukabay_admin/Network/get_dio.dart';
import 'package:foukabay_admin/Repository/workshop_services.dart';
import 'package:intl/intl.dart';

class WorkShopProvider extends ChangeNotifier {
  WorkShopServices workShopServices = new WorkShopServices(GetDio().getDio());

  List<Events> listWorkshops = [];
  List<RegisterUsersWorkshop> listRegisteredCustomers = [];
  late Events events;
  DateFormat dateFormat = new DateFormat('dd-MM-yyyy hh:mm a');

  Future getAllEvents() async {
    return await workShopServices.getWorkShops().then((value) async {
      if (value.statusCode == 200) {
        listWorkshops =
            List<Events>.from(value.data.map((x) => Events.fromMap(x)));
        listWorkshops.sort((a, b) => b.datetime!.compareTo(a.datetime!));
        // listWorkshops.reversed.toList();
        // listWorkshops.sort((a, b) =>
        //   listWorkshops.sortReversed();
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
        listRegisteredCustomers = List<RegisterUsersWorkshop>.from(
            value.data.map((x) => RegisterUsersWorkshop.fromMap(x)));
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
