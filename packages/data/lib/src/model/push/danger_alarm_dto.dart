import 'package:freezed_annotation/freezed_annotation.dart';

part 'danger_alarm_dto.freezed.dart';
part 'danger_alarm_dto.g.dart';

/// The `data` block of a `send-alarm` FCM message. Every value is a string;
/// contract in `docs/push_alarm_backend.md`.
@freezed
sealed class DangerAlarmDTO with _$DangerAlarmDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory DangerAlarmDTO({
    required String? kind,
    required String? sourceId,
    required String? incidentId,
    required String? title,
    required String? body,
    required String? lat,
    required String? lng,
  }) = _DangerAlarmDTO;

  factory DangerAlarmDTO.fromJson(Map<String, dynamic> json) =>
      _$DangerAlarmDTOFromJson(json);
}
