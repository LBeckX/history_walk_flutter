import 'dart:developer';
import 'dart:io';

import 'package:pedometer/pedometer.dart';
import 'package:permission_handler/permission_handler.dart';

typedef CallbackFn = void Function(String step);

class StepModel {
  late String _status = '?', _steps = '?';

  CallbackFn? _onStepCallback;
  CallbackFn? _onStepErrorCallback;
  CallbackFn? _onPedestrianStatusCallback;
  CallbackFn? _onPedestrianStatusErrorCallback;

  void initStepCount({CallbackFn? onStep, CallbackFn? onStepError}) {
    log('Init step count');
    _onStepCallback = onStep;
    _onStepErrorCallback = onStepError;
    try {
      Pedometer.stepCountStream.listen(_onStep).onError(_onStepCountError);
    } catch (e) {
      log('error $e');
    }
  }

  void initPedestrianStatus(
      {CallbackFn? onPedestrianStatusCallback,
      CallbackFn? onPedestrianStatusError}) {
    log('Init pedestrian status');
    _onPedestrianStatusCallback = onPedestrianStatusCallback;
    _onPedestrianStatusErrorCallback = onPedestrianStatusError;
    Pedometer.pedestrianStatusStream
        .listen(_onPedestrianStatusChanged)
        .onError(_onPedestrianStatusError);
  }

  Future<bool> requestActivityPermissions() async {
    PermissionStatus result;

    if (Platform.isAndroid && await Permission.activityRecognition.isGranted) {
      return true;
    } else if (Platform.isIOS && await Permission.sensors.isGranted) {
      return true;
    }

    if (Platform.isAndroid) {
      result = await Permission.activityRecognition.request();
    } else {
      result = await Permission.sensors.request();
    }

    if (result.isGranted) {
      return true;
    }

    if ((Platform.isIOS || Platform.isAndroid) && result.isPermanentlyDenied) {
      openAppSettings();
      return false;
    }

    return false;
  }

  void _onStep(StepCount event) {
    _steps = event.steps.toString();
    _onStepCallback!(_steps);
  }

  void _onStepCountError(error) {
    _steps = 'Step Count not available';
    _onStepErrorCallback!(_steps);
  }

  void _onPedestrianStatusChanged(PedestrianStatus event) {
    _status = event.status;
    _onPedestrianStatusCallback!(_status);
  }

  void _onPedestrianStatusError(error) {
    _status = 'Pedestrian Status not available';
    _onPedestrianStatusErrorCallback!(_status);
  }
}
