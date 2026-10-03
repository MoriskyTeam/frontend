/// Dynamic RCB Alerts data layer.
///
/// Supabase services, DTOs, mappers, and repository implementations. May
/// depend on `domain` only — never on the app layer.
library;

export 'src/client/supabase_module.dart';
export 'src/di/data_environment.dart';
export 'src/di/data_injection.dart';
export 'src/di/data_injection.module.dart';
export 'src/error/supabase_error_mapper.dart';
export 'src/local_storage/preferences_module.dart';
export 'src/mapper/geocoding_mappers.dart';
export 'src/mapper/incident_mappers.dart';
export 'src/mapper/location_mappers.dart';
export 'src/model/geocoding/address_dto.dart';
export 'src/model/incident/incident_dto.dart';
export 'src/model/incident/submit_report_dto.dart';
export 'src/model/location/location_dto.dart';
export 'src/repository/auth_repository_impl.dart';
export 'src/repository/incident_repository_impl.dart';
export 'src/repository/location_repository_impl.dart';
export 'src/service/auth/auth_service.dart';
export 'src/service/auth/mock_auth_service.dart';
export 'src/service/auth/supabase_auth_service.dart';
export 'src/service/geocoding/geocoding_service.dart';
export 'src/service/geocoding/nominatim_geocoding_service.dart';
export 'src/service/incident/incident_service.dart';
export 'src/service/incident/mock_incident_service.dart';
export 'src/service/incident/supabase_incident_service.dart';
export 'src/service/location/geolocator_location_service.dart';
export 'src/service/location/location_service.dart';
