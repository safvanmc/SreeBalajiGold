
// import 'package:telephony/telephony.dart';
// import 'package:injectable/injectable.dart';

// @module
// abstract class AppInjectableModule {
//  @preResolve
//   Future<PermissionServeice> get permissionServeice => PermissionServeice.init();
// }



class PermissionServeice { 
  static Future<PermissionServeice> init() async {


    return PermissionServeice();
  }
}