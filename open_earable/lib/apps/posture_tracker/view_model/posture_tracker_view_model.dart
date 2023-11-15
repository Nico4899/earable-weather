import "package:flutter/material.dart";
import "package:open_earable/apps/posture_tracker/model/attitude.dart";
import 'package:open_earable/apps/posture_tracker/model/attitude_tracker.dart';

class PostureTrackerViewModel extends ChangeNotifier {
  Attitude _attitude = Attitude();
  Attitude get attitude => _attitude;

  bool get isTracking => _attitudeTracker.isTracking;
  bool get isAvailable => _attitudeTracker.isAvailable;

  AttitudeTracker _attitudeTracker;

  PostureTrackerViewModel(this._attitudeTracker) {
    _attitudeTracker.didChangeAvailability = (_) {
      notifyListeners();
    };

    _attitudeTracker.listen((attitude) {
      _attitude = Attitude(
        roll: -attitude.roll,
        pitch: attitude.pitch,
        yaw: attitude.yaw
      );
      notifyListeners();
    });
  }

  void startTracking() {
    _attitudeTracker.start();
    notifyListeners();
  }

  void stopTracking() {
    _attitudeTracker.stop();
    notifyListeners();
  }

  void calibrate() {
    _attitudeTracker.calibrateToCurrentAttitude();
  }

  @override
  void dispose() {
    _attitudeTracker.cancle();
    super.dispose();
  }
}