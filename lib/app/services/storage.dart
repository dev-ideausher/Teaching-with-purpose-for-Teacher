import 'dart:async';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class GetStorageService extends GetxService {
  static final _runData = GetStorage('runData');

  Future<GetStorageService> initState() async {
    await GetStorage.init('runData');
    return this;
  }

  bool get isLoggedIn => _runData.read('isLoggedIn') ?? false;

  set isLoggedIn(bool isLoggedIn) => _runData.write('isLoggedIn', isLoggedIn);

  String get token => _runData.read('token') ?? '';

  set token(String token) => _runData.write('token', token);

  String get name => _runData.read('name') ?? '';

  set name(String name) => _runData.write('name', name);

  String get id => _runData.read('id') ?? '';

  set id(String id) => _runData.write('id', id);

  String get clockInTime => _runData.read('clockInTime') ?? '';

  set clockInTime(String clockInTime) => _runData.write('clockInTime', clockInTime);

  String get clockOutTime => _runData.read('clockOutTime') ?? '';

  set clockOutTime(String clockOutTime) => _runData.write('clockOutTime', clockOutTime);

  String get markId => _runData.read('markId') ?? '';

  set markId(String markId) => _runData.write('markId', markId);


  

  void logout() {
    _runData.erase();
  }
}
