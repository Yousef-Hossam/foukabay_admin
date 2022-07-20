import 'package:dio/dio.dart';
import 'package:foukabay_admin/Models/events_model.dart';
import 'package:foukabay_admin/Models/register_workshop.dart';
import 'package:foukabay_admin/Network/urls.dart';

class WorkShopServices {
  Dio _dio;

  WorkShopServices(this._dio);

  Future<Response> getWorkShops() async {
    try {
      return await _dio.get(ApiRoutes.getEvent);
      //return ScannedNetworksResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getCustomersRegistered(int eventId) async {
    try {
      return await _dio.get(
          ApiRoutes.getCustomersByEventId.replaceAll("{eventid}", "$eventId"));
      //return ScannedNetworksResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> userRegisterWorkshop(
      RegisterWorkshop registerWorkshop) async {
    try {
      return await _dio.post(ApiRoutes.postRegister,
          data: registerWorkshop.toMap());
      //return ScannedNetworksResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> adminAddWorkshop(Events events) async {
    try {
      return await _dio.post(ApiRoutes.postWorkshop, data: events.toMap());
      //return ScannedNetworksResponse.fromJson(jsonDecode(response.data));
    } catch (e) {
      rethrow;
    }
  }
}
