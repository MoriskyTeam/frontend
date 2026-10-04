// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'CityShield';

  @override
  String get liveBadge => 'LIVE';

  @override
  String get layerInfrastructure => 'Outages';

  @override
  String get layerAirQuality => 'Air';

  @override
  String get layerWeather => 'Weather';

  @override
  String get layerNeighbours => 'Neighbours';

  @override
  String get nearbyTitle => 'Closest to you';

  @override
  String get locationDemo => 'Rynek Główny · demo location';

  @override
  String get locationDevice => 'Your location';

  @override
  String get myLocation => 'My location';

  @override
  String get airNow => 'Air now';

  @override
  String get airVeryGood => 'Very good';

  @override
  String get airGood => 'Good';

  @override
  String get airModerate => 'Moderate';

  @override
  String get airSufficient => 'Sufficient';

  @override
  String get airBad => 'Bad';

  @override
  String get airVeryBad => 'Very bad';

  @override
  String get severityLow => 'Low risk';

  @override
  String get severityMedium => 'Medium risk';

  @override
  String get severityHigh => 'High risk';

  @override
  String get statusReported => 'New';

  @override
  String get statusConfirmed => 'Confirmed';

  @override
  String get statusResolved => 'Resolved';

  @override
  String get sourceCity19115 => '19115 Kraków';

  @override
  String get sourceUtility => 'Network operator';

  @override
  String get sourceImgw => 'IMGW-PIB';

  @override
  String get sourceGios => 'GIOŚ';

  @override
  String get sourceResident => 'Resident';

  @override
  String get categoryPowerOutage => 'Power outage';

  @override
  String get categoryWaterOutage => 'No water';

  @override
  String get categoryHeating => 'Heating';

  @override
  String get categoryFlooding => 'Flooding';

  @override
  String get categoryFallenTree => 'Fallen tree';

  @override
  String get categoryRoad => 'Road damage';

  @override
  String get categoryTrafficLights => 'Traffic lights';

  @override
  String get categoryStreetLights => 'Street lights';

  @override
  String get categoryAirQuality => 'Air quality';

  @override
  String get categoryStorm => 'Storm';

  @override
  String get categoryWind => 'Strong wind';

  @override
  String get categoryHeat => 'Heat';

  @override
  String get categorySmoke => 'Smoke';

  @override
  String get categoryOther => 'Other';

  @override
  String get timeNow => 'just now';

  @override
  String get weatherWarning => 'IMGW warning';

  @override
  String get confirmAction => 'I see it too';

  @override
  String get reportAction => 'Report';

  @override
  String get close => 'Close';

  @override
  String get show => 'Show';

  @override
  String get retry => 'Try again';

  @override
  String get loadFailed => 'Couldn\'t load the city feed.';

  @override
  String get allLayersOff => 'All layers are off';

  @override
  String get allLayersOffHint =>
      'Turn a layer on to see what\'s happening around you.';

  @override
  String get enableAllLayers => 'Show all layers';

  @override
  String get quietNearby => 'Calm within 2 km. Nothing needs your attention.';

  @override
  String get resolvedSection => 'Resolved';

  @override
  String get mapAttribution => 'Map © OpenStreetMap contributors';

  @override
  String get reportTitle => 'New report';

  @override
  String get reportWhat => 'What\'s happening?';

  @override
  String get reportPhoto => 'Photo';

  @override
  String get reportPhotoAdd => 'Add a photo';

  @override
  String get reportPhotoHint =>
      'A photo helps neighbours and services trust the report.';

  @override
  String get reportPhotoCamera => 'Take a photo';

  @override
  String get reportPhotoGallery => 'Choose from gallery';

  @override
  String get reportPhotoRemove => 'Remove photo';

  @override
  String get reportWhere => 'Where?';

  @override
  String get reportWhereHint => 'Drag the map to place the pin';

  @override
  String get reportNote => 'Note (optional)';

  @override
  String get reportNoteHint => 'E.g. water up to the ankles, underpass closed';

  @override
  String get reportSubmit => 'Send report';

  @override
  String get reportSending => 'Sending…';

  @override
  String get reportSent => 'Report added. Neighbours can see it on the map.';

  @override
  String get reportFailed =>
      'Couldn\'t send. Check your connection and try again.';

  @override
  String get reportPickCategoryFirst => 'Pick what\'s happening to send';

  @override
  String get unitMicrograms => 'µg/m³';

  @override
  String get pm25 => 'PM2.5';

  @override
  String get pm10 => 'PM10';

  @override
  String get airStation => 'GIOŚ station';

  @override
  String get warningArea => 'Warning area';

  @override
  String get updatedJustNow => 'updated just now';

  @override
  String activeNearby(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count active within 2 km',
      one: '1 active within 2 km',
      zero: 'Calm within 2 km',
    );
    return '$_temp0';
  }

  @override
  String minutesAgo(int minutes) {
    return '$minutes min ago';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours h ago';
  }

  @override
  String confirmations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Confirmed by $count people',
      one: 'Confirmed by 1 person',
      zero: 'No confirmations yet',
    );
    return '$_temp0';
  }

  @override
  String newNearby(String title, String distance) {
    return 'New: $title · $distance';
  }

  @override
  String updatedAgo(String ago) {
    return 'updated $ago';
  }

  @override
  String layerCount(String layer, int count) {
    return '$layer, $count items';
  }

  @override
  String activeNearbyLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'active within 2 km',
      one: 'active within 2 km',
      zero: 'Calm within 2 km',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'No connection to city data';

  @override
  String get reportAddressLoading => 'Finding the address…';

  @override
  String clusterLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count reports here, tap to zoom in',
      one: '1 report here, tap to zoom in',
    );
    return '$_temp0';
  }

  @override
  String get categoryWeatherStation => 'Weather station';

  @override
  String get weatherNow => 'Weather now';

  @override
  String get weatherTemperature => 'Temperature';

  @override
  String get weatherWind => 'Wind';

  @override
  String get weatherHumidity => 'Humidity';

  @override
  String get weatherPrecipitation => 'Precipitation';

  @override
  String get weatherCalm => 'calm';

  @override
  String weatherPressure(String value) {
    return 'Pressure $value hPa';
  }

  @override
  String weatherWindFrom(int degrees) {
    return 'Wind from $degrees°';
  }

  @override
  String get alarmEyebrow => 'CityShield alarm';

  @override
  String get alarmHeadline => 'Danger';

  @override
  String get alarmAcknowledge => 'I understand';

  @override
  String get alarmAcknowledgeHint => 'Stops the alarm and opens the map';

  @override
  String get alarmChannelName => 'Danger alarms';

  @override
  String get alarmChannelDescription =>
      'Wakes the phone when a serious danger is reported near you.';

  @override
  String get alarmSettingsBody =>
      'When a serious danger is reported near you, the phone wakes up, rings even on silent and flashes. It complements the official RCB Alert, it does not replace it.';

  @override
  String get alarmFullScreenTitle => 'Allow full-screen alarms';

  @override
  String get alarmFullScreenBody =>
      'Needed to wake a locked phone on Android 14 and newer.';

  @override
  String get alarmTestAction => 'Test the alarm';

  @override
  String get alarmTestTitle => 'Test alarm';

  @override
  String get alarmTestBody =>
      'This is how a danger alarm looks and sounds. Nothing is happening.';

  @override
  String get alarmFullScreenGranted => 'Full-screen alarms allowed';

  @override
  String get alarmFullScreenGrantedBody =>
      'A locked phone will wake up for an alarm.';
}
