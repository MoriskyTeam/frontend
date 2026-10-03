import 'package:data/src/model/radar/radar_frame_dto.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'radar_frames_dto.freezed.dart';
part 'radar_frames_dto.g.dart';

/// The `radar` object of RainViewer's `weather-maps.json`.
@freezed
sealed class RadarFramesDTO with _$RadarFramesDTO {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RadarFramesDTO({
    required List<RadarFrameDTO>? past,
  }) = _RadarFramesDTO;

  factory RadarFramesDTO.fromJson(Map<String, dynamic> json) =>
      _$RadarFramesDTOFromJson(json);
}
