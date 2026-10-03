/// Dynamic RCB Alerts domain layer.
///
/// Pure Dart entities, repository contracts, and use cases. Must not depend
/// on Flutter or on the `data` package.
library;

export 'src/di/domain_injection.dart';
export 'src/di/domain_injection.module.dart';
export 'src/error/api_error.dart';
export 'src/error/error_result.dart';
export 'src/model/request/incident/submit_report_request.dart';
export 'src/model/result/common/loading_status.dart';
export 'src/model/result/common/no_result.dart';
export 'src/model/result/incident/air_quality_level.dart';
export 'src/model/result/incident/air_reading.dart';
export 'src/model/result/incident/incident.dart';
export 'src/model/result/incident/incident_category.dart';
export 'src/model/result/incident/incident_layer.dart';
export 'src/model/result/incident/incident_severity.dart';
export 'src/model/result/incident/incident_source.dart';
export 'src/model/result/incident/incident_status.dart';
export 'src/model/result/location/geo_point.dart';
export 'src/model/result/location/user_location.dart';
export 'src/repository/auth_repository.dart';
export 'src/repository/incident_repository.dart';
export 'src/repository/location_repository.dart';
export 'src/usecase/auth/ensure_signed_in_use_case.dart';
export 'src/usecase/base_use_case.dart';
export 'src/usecase/incident/confirm_incident_use_case.dart';
export 'src/usecase/incident/submit_report_use_case.dart';
export 'src/usecase/incident/watch_incidents_use_case.dart';
export 'src/usecase/location/get_current_location_use_case.dart';
