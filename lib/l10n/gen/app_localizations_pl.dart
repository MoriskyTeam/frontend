// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get appTitle => 'CityShield';

  @override
  String get liveBadge => 'NA ŻYWO';

  @override
  String get layerInfrastructure => 'Awarie';

  @override
  String get layerAirQuality => 'Powietrze';

  @override
  String get layerWeather => 'Pogoda';

  @override
  String get layerNeighbours => 'Sąsiedzi';

  @override
  String get nearbyTitle => 'Najbliżej Ciebie';

  @override
  String get locationDemo => 'Rynek Główny · lokalizacja demo';

  @override
  String get locationDevice => 'Twoja lokalizacja';

  @override
  String get myLocation => 'Moja lokalizacja';

  @override
  String get airNow => 'Powietrze teraz';

  @override
  String get airVeryGood => 'Bardzo dobre';

  @override
  String get airGood => 'Dobre';

  @override
  String get airModerate => 'Umiarkowane';

  @override
  String get airSufficient => 'Dostateczne';

  @override
  String get airBad => 'Złe';

  @override
  String get airVeryBad => 'Bardzo złe';

  @override
  String get severityLow => 'Niskie zagrożenie';

  @override
  String get severityMedium => 'Średnie zagrożenie';

  @override
  String get severityHigh => 'Wysokie zagrożenie';

  @override
  String get statusReported => 'Nowe';

  @override
  String get statusConfirmed => 'Potwierdzone';

  @override
  String get statusResolved => 'Rozwiązane';

  @override
  String get sourceCity19115 => '19115 Kraków';

  @override
  String get sourceUtility => 'Operator sieci';

  @override
  String get sourceImgw => 'IMGW-PIB';

  @override
  String get sourceGios => 'GIOŚ';

  @override
  String get sourceResident => 'Mieszkaniec';

  @override
  String get categoryPowerOutage => 'Brak prądu';

  @override
  String get categoryWaterOutage => 'Brak wody';

  @override
  String get categoryHeating => 'Ciepło';

  @override
  String get categoryFlooding => 'Zalanie';

  @override
  String get categoryFallenTree => 'Powalone drzewo';

  @override
  String get categoryRoad => 'Uszkodzona droga';

  @override
  String get categoryTrafficLights => 'Sygnalizacja';

  @override
  String get categoryStreetLights => 'Oświetlenie';

  @override
  String get categoryAirQuality => 'Jakość powietrza';

  @override
  String get categoryStorm => 'Burza';

  @override
  String get categoryWind => 'Silny wiatr';

  @override
  String get categoryHeat => 'Upał';

  @override
  String get categorySmoke => 'Dym';

  @override
  String get categoryOther => 'Inne';

  @override
  String get timeNow => 'przed chwilą';

  @override
  String get weatherWarning => 'Ostrzeżenie IMGW';

  @override
  String get confirmAction => 'Też to widzę';

  @override
  String get reportAction => 'Zgłoś';

  @override
  String get close => 'Zamknij';

  @override
  String get show => 'Pokaż';

  @override
  String get retry => 'Spróbuj ponownie';

  @override
  String get loadFailed => 'Nie udało się pobrać danych z miasta.';

  @override
  String get allLayersOff => 'Wszystkie warstwy wyłączone';

  @override
  String get allLayersOffHint =>
      'Włącz warstwę, żeby zobaczyć, co dzieje się wokół.';

  @override
  String get enableAllLayers => 'Pokaż wszystkie warstwy';

  @override
  String get quietNearby =>
      'W promieniu 2 km spokojnie. Nic nie wymaga Twojej uwagi.';

  @override
  String get resolvedSection => 'Rozwiązane';

  @override
  String get mapAttribution => 'Mapa © autorzy OpenStreetMap';

  @override
  String get reportTitle => 'Nowe zgłoszenie';

  @override
  String get reportWhat => 'Co się dzieje?';

  @override
  String get reportPhoto => 'Zdjęcie';

  @override
  String get reportPhotoAdd => 'Dodaj zdjęcie';

  @override
  String get reportPhotoHint =>
      'Zdjęcie pomaga sąsiadom i służbom uwierzyć zgłoszeniu.';

  @override
  String get reportPhotoCamera => 'Zrób zdjęcie';

  @override
  String get reportPhotoGallery => 'Wybierz z galerii';

  @override
  String get reportPhotoRemove => 'Usuń zdjęcie';

  @override
  String get reportWhere => 'Gdzie?';

  @override
  String get reportWhereHint => 'Przesuń mapę, aby ustawić pinezkę';

  @override
  String get reportNote => 'Opis (opcjonalnie)';

  @override
  String get reportNoteHint => 'Np. woda po kostki, przejście zamknięte';

  @override
  String get reportSubmit => 'Wyślij zgłoszenie';

  @override
  String get reportSending => 'Wysyłanie…';

  @override
  String get reportSent => 'Zgłoszenie dodane. Sąsiedzi widzą je już na mapie.';

  @override
  String get reportFailed =>
      'Nie udało się wysłać. Sprawdź połączenie i spróbuj ponownie.';

  @override
  String get reportPickCategoryFirst => 'Wybierz, co się dzieje, aby wysłać';

  @override
  String get unitMicrograms => 'µg/m³';

  @override
  String get pm25 => 'PM2,5';

  @override
  String get pm10 => 'PM10';

  @override
  String get airStation => 'Stacja GIOŚ';

  @override
  String get warningArea => 'Obszar ostrzeżenia';

  @override
  String get updatedJustNow => 'aktualizacja przed chwilą';

  @override
  String activeNearby(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count aktywnych w promieniu 2 km',
      few: '$count aktywne w promieniu 2 km',
      one: '1 aktywne w promieniu 2 km',
      zero: 'Spokojnie w promieniu 2 km',
    );
    return '$_temp0';
  }

  @override
  String minutesAgo(int minutes) {
    return '$minutes min temu';
  }

  @override
  String hoursAgo(int hours) {
    return '$hours godz. temu';
  }

  @override
  String confirmations(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'Potwierdziło $count osób',
      few: 'Potwierdziły $count osoby',
      one: 'Potwierdziła 1 osoba',
      zero: 'Nikt jeszcze nie potwierdził',
    );
    return '$_temp0';
  }

  @override
  String newNearby(String title, String distance) {
    return 'Nowe: $title · $distance';
  }

  @override
  String updatedAgo(String ago) {
    return 'aktualizacja $ago';
  }

  @override
  String layerCount(String layer, int count) {
    return '$layer, $count pozycji';
  }

  @override
  String activeNearbyLabel(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: 'aktywnych w promieniu 2 km',
      few: 'aktywne w promieniu 2 km',
      one: 'aktywne w promieniu 2 km',
      zero: 'Spokojnie w promieniu 2 km',
    );
    return '$_temp0';
  }

  @override
  String get offlineStatus => 'Brak połączenia z danymi miasta';

  @override
  String get reportAddressLoading => 'Ustalanie adresu…';
}
