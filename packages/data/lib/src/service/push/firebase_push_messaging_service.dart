import 'package:data/src/model/push/danger_alarm_dto.dart';
import 'package:data/src/service/push/push_messaging_service.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:injectable/injectable.dart';

/// FCM on mobile. Resolved lazily so web, which never initialises
/// Firebase, can still construct the graph.
@LazySingleton(as: PushMessagingService)
class FirebasePushMessagingService implements PushMessagingService {
  FirebaseMessaging get _messaging => FirebaseMessaging.instance;

  @override
  Future<void> requestPermission() async {
    await _messaging.requestPermission();
  }

  @override
  Future<String?> getToken() => _messaging.getToken();

  @override
  Stream<DangerAlarmDTO> foregroundMessages() =>
      FirebaseMessaging.onMessage.map(_toDTO);

  @override
  Stream<DangerAlarmDTO> openedMessages() =>
      FirebaseMessaging.onMessageOpenedApp.map(_toDTO);

  @override
  Future<DangerAlarmDTO?> initialMessage() async {
    final message = await _messaging.getInitialMessage();
    return message == null ? null : _toDTO(message);
  }

  static DangerAlarmDTO _toDTO(RemoteMessage message) =>
      DangerAlarmDTO.fromJson(message.data);
}
