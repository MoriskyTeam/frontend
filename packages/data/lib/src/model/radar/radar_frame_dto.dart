import 'package:freezed_annotation/freezed_annotation.dart';

part 'radar_frame_dto.freezed.dart';
part 'radar_frame_dto.g.dart';

/// One entry of RainViewer's `radar.past` list.
@freezed
sealed class RadarFrameDTO with _$RadarFrameDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RadarFrameDTO({
    /// Unix seconds.
    required int? time,
    required String? path,
  }) = _RadarFrameDTO;

  factory RadarFrameDTO.fromJson(Map<String, dynamic> json) =>
      _$RadarFrameDTOFromJson(json);
}
