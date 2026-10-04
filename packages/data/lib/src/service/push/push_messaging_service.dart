import 'package:data/src/model/push/danger_alarm_dto.dart';

abstract class PushMessagingService {
  /// Shows the system permission prompt the first time; afterwards the
  /// system answers from the resident's earlier choice.
  Future<void> requestPermission();

  Future<String?> getToken();

  /// Messages received while the app is in the foreground.
  Stream<DangerAlarmDTO> foregroundMessages();

  /// Messages whose system notification the resident tapped.
  Stream<DangerAlarmDTO> openedMessages();

  /// The message whose notification launched the app, if any.
  Future<DangerAlarmDTO?> initialMessage();
}
