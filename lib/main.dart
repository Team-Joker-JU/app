//@dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:ims/src/app/data/bluetooth/controllers/robot_controller.dart';
import 'package:ims/src/app/data/bluetooth/interactors/robot_interactor.dart';
import 'package:ims/src/app/views/navigation/navigation_view.dart';
import 'package:ims/src/app/views/remote/remote_view.dart';

import 'src/app/data/bluetooth/bluetooth_device_manager.dart';
import 'src/app/data/bluetooth/bluetooth_discover_manager.dart';
import 'src/app/views/bluetooth/bluetooth_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  GetIt.I.registerSingleton(BluetoothDiscoverManager());
  GetIt.I.registerSingleton(BluetoothDeviceManager<RobotInteractor, RobotController>());

  runApp(GetMaterialApp(
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Color.fromARGB(255, 14, 14, 14),
      accentColor: Colors.blue[400],
      scaffoldBackgroundColor: Color.fromARGB(255, 28, 28, 28),
      bottomAppBarColor: Color.fromARGB(255, 28, 28, 28),
      cardColor: Color.fromARGB(255, 28, 28, 28),

      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected))
            return Colors.blue[600];
        }),
        thumbColor: MaterialStateProperty.all(Colors.blue[400]),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (states.contains(MaterialState.focused))
                return Colors.blue[400];
              if (states.contains(MaterialState.hovered))
                return Colors.blue[400];
              if (states.contains(MaterialState.pressed))
                return Colors.blue[400];
              if (states.contains(MaterialState.disabled))
                return Colors.grey[700].withOpacity(0.4);
              return Colors.blue[700]; // Defer to the widget's default.
          }),
        ),
      ),

      textTheme: TextTheme(
        headline1: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        headline2: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
      ),
    ),
    home: BluetoothView(),
  ));
}
