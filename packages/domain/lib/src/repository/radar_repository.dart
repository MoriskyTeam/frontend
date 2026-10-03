import 'package:domain/src/model/result/radar/radar_frame.dart';

abstract class RadarRepository {
  /// The most recent observed radar frame, or null when none is published.
  Future<RadarFrame?> getLatestFrame();
}
