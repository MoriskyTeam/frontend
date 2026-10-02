import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_pl.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('pl'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'CityShield'**
  String get appTitle;

  /// No description provided for @liveBadge.
  ///
  /// In en, this message translates to:
  /// **'LIVE'**
  String get liveBadge;

  /// No description provided for @demoBadge.
  ///
  /// In en, this message translates to:
  /// **'DEMO'**
  String get demoBadge;

  /// No description provided for @demoDataNote.
  ///
  /// In en, this message translates to:
  /// **'Demo data — incidents are synthetic'**
  String get demoDataNote;

  /// No description provided for @layerInfrastructure.
  ///
  /// In en, this message translates to:
  /// **'Outages'**
  String get layerInfrastructure;

  /// No description provided for @layerAirQuality.
  ///
  /// In en, this message translates to:
  /// **'Air'**
  String get layerAirQuality;

  /// No description provided for @layerWeather.
  ///
  /// In en, this message translates to:
  /// **'Weather'**
  String get layerWeather;

  /// No description provided for @layerNeighbours.
  ///
  /// In en, this message translates to:
  /// **'Neighbours'**
  String get layerNeighbours;

  /// No description provided for @nearbyTitle.
  ///
  /// In en, this message translates to:
  /// **'Closest to you'**
  String get nearbyTitle;

  /// No description provided for @locationDemo.
  ///
  /// In en, this message translates to:
  /// **'Rynek Główny · demo location'**
  String get locationDemo;

  /// No description provided for @locationDevice.
  ///
  /// In en, this message translates to:
  /// **'Your location'**
  String get locationDevice;

  /// No description provided for @myLocation.
  ///
  /// In en, this message translates to:
  /// **'My location'**
  String get myLocation;

  /// No description provided for @airNow.
  ///
  /// In en, this message translates to:
  /// **'Air now'**
  String get airNow;

  /// No description provided for @airVeryGood.
  ///
  /// In en, this message translates to:
  /// **'Very good'**
  String get airVeryGood;

  /// No description provided for @airGood.
  ///
  /// In en, this message translates to:
  /// **'Good'**
  String get airGood;

  /// No description provided for @airModerate.
  ///
  /// In en, this message translates to:
  /// **'Moderate'**
  String get airModerate;

  /// No description provided for @airSufficient.
  ///
  /// In en, this message translates to:
  /// **'Sufficient'**
  String get airSufficient;

  /// No description provided for @airBad.
  ///
  /// In en, this message translates to:
  /// **'Bad'**
  String get airBad;

  /// No description provided for @airVeryBad.
  ///
  /// In en, this message translates to:
  /// **'Very bad'**
  String get airVeryBad;

  /// No description provided for @severityLow.
  ///
  /// In en, this message translates to:
  /// **'Low risk'**
  String get severityLow;

  /// No description provided for @severityMedium.
  ///
  /// In en, this message translates to:
  /// **'Medium risk'**
  String get severityMedium;

  /// No description provided for @severityHigh.
  ///
  /// In en, this message translates to:
  /// **'High risk'**
  String get severityHigh;

  /// No description provided for @statusReported.
  ///
  /// In en, this message translates to:
  /// **'New'**
  String get statusReported;

  /// No description provided for @statusConfirmed.
  ///
  /// In en, this message translates to:
  /// **'Confirmed'**
  String get statusConfirmed;

  /// No description provided for @statusResolved.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get statusResolved;

  /// No description provided for @sourceCity19115.
  ///
  /// In en, this message translates to:
  /// **'19115 Kraków'**
  String get sourceCity19115;

  /// No description provided for @sourceUtility.
  ///
  /// In en, this message translates to:
  /// **'Network operator'**
  String get sourceUtility;

  /// No description provided for @sourceImgw.
  ///
  /// In en, this message translates to:
  /// **'IMGW-PIB'**
  String get sourceImgw;

  /// No description provided for @sourceGios.
  ///
  /// In en, this message translates to:
  /// **'GIOŚ'**
  String get sourceGios;

  /// No description provided for @sourceResident.
  ///
  /// In en, this message translates to:
  /// **'Resident'**
  String get sourceResident;

  /// No description provided for @categoryPowerOutage.
  ///
  /// In en, this message translates to:
  /// **'Power outage'**
  String get categoryPowerOutage;

  /// No description provided for @categoryWaterOutage.
  ///
  /// In en, this message translates to:
  /// **'No water'**
  String get categoryWaterOutage;

  /// No description provided for @categoryHeating.
  ///
  /// In en, this message translates to:
  /// **'Heating'**
  String get categoryHeating;

  /// No description provided for @categoryFlooding.
  ///
  /// In en, this message translates to:
  /// **'Flooding'**
  String get categoryFlooding;

  /// No description provided for @categoryFallenTree.
  ///
  /// In en, this message translates to:
  /// **'Fallen tree'**
  String get categoryFallenTree;

  /// No description provided for @categoryRoad.
  ///
  /// In en, this message translates to:
  /// **'Road damage'**
  String get categoryRoad;

  /// No description provided for @categoryTrafficLights.
  ///
  /// In en, this message translates to:
  /// **'Traffic lights'**
  String get categoryTrafficLights;

  /// No description provided for @categoryStreetLights.
  ///
  /// In en, this message translates to:
  /// **'Street lights'**
  String get categoryStreetLights;

  /// No description provided for @categoryAirQuality.
  ///
  /// In en, this message translates to:
  /// **'Air quality'**
  String get categoryAirQuality;

  /// No description provided for @categoryStorm.
  ///
  /// In en, this message translates to:
  /// **'Storm'**
  String get categoryStorm;

  /// No description provided for @categoryWind.
  ///
  /// In en, this message translates to:
  /// **'Strong wind'**
  String get categoryWind;

  /// No description provided for @categoryHeat.
  ///
  /// In en, this message translates to:
  /// **'Heat'**
  String get categoryHeat;

  /// No description provided for @categorySmoke.
  ///
  /// In en, this message translates to:
  /// **'Smoke'**
  String get categorySmoke;

  /// No description provided for @categoryOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get categoryOther;

  /// No description provided for @timeNow.
  ///
  /// In en, this message translates to:
  /// **'just now'**
  String get timeNow;

  /// No description provided for @weatherWarning.
  ///
  /// In en, this message translates to:
  /// **'IMGW warning'**
  String get weatherWarning;

  /// No description provided for @confirmAction.
  ///
  /// In en, this message translates to:
  /// **'I see it too'**
  String get confirmAction;

  /// No description provided for @reportAction.
  ///
  /// In en, this message translates to:
  /// **'Report'**
  String get reportAction;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @show.
  ///
  /// In en, this message translates to:
  /// **'Show'**
  String get show;

  /// No description provided for @retry.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get retry;

  /// No description provided for @loadFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t load the city feed.'**
  String get loadFailed;

  /// No description provided for @allLayersOff.
  ///
  /// In en, this message translates to:
  /// **'All layers are off'**
  String get allLayersOff;

  /// No description provided for @allLayersOffHint.
  ///
  /// In en, this message translates to:
  /// **'Turn a layer on to see what\'s happening around you.'**
  String get allLayersOffHint;

  /// No description provided for @enableAllLayers.
  ///
  /// In en, this message translates to:
  /// **'Show all layers'**
  String get enableAllLayers;

  /// No description provided for @quietNearby.
  ///
  /// In en, this message translates to:
  /// **'Calm within 2 km. Nothing needs your attention.'**
  String get quietNearby;

  /// No description provided for @resolvedSection.
  ///
  /// In en, this message translates to:
  /// **'Resolved'**
  String get resolvedSection;

  /// No description provided for @mapAttribution.
  ///
  /// In en, this message translates to:
  /// **'Map © OpenStreetMap contributors'**
  String get mapAttribution;

  /// No description provided for @reportTitle.
  ///
  /// In en, this message translates to:
  /// **'New report'**
  String get reportTitle;

  /// No description provided for @reportWhat.
  ///
  /// In en, this message translates to:
  /// **'What\'s happening?'**
  String get reportWhat;

  /// No description provided for @reportPhoto.
  ///
  /// In en, this message translates to:
  /// **'Photo'**
  String get reportPhoto;

  /// No description provided for @reportPhotoAdd.
  ///
  /// In en, this message translates to:
  /// **'Add a photo'**
  String get reportPhotoAdd;

  /// No description provided for @reportPhotoHint.
  ///
  /// In en, this message translates to:
  /// **'A photo helps neighbours and services trust the report.'**
  String get reportPhotoHint;

  /// No description provided for @reportPhotoCamera.
  ///
  /// In en, this message translates to:
  /// **'Take a photo'**
  String get reportPhotoCamera;

  /// No description provided for @reportPhotoGallery.
  ///
  /// In en, this message translates to:
  /// **'Choose from gallery'**
  String get reportPhotoGallery;

  /// No description provided for @reportPhotoRemove.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get reportPhotoRemove;

  /// No description provided for @reportWhere.
  ///
  /// In en, this message translates to:
  /// **'Where?'**
  String get reportWhere;

  /// No description provided for @reportWhereHint.
  ///
  /// In en, this message translates to:
  /// **'Drag the map to place the pin'**
  String get reportWhereHint;

  /// No description provided for @reportNote.
  ///
  /// In en, this message translates to:
  /// **'Note (optional)'**
  String get reportNote;

  /// No description provided for @reportNoteHint.
  ///
  /// In en, this message translates to:
  /// **'E.g. water up to the ankles, underpass closed'**
  String get reportNoteHint;

  /// No description provided for @reportSubmit.
  ///
  /// In en, this message translates to:
  /// **'Send report'**
  String get reportSubmit;

  /// No description provided for @reportSending.
  ///
  /// In en, this message translates to:
  /// **'Sending…'**
  String get reportSending;

  /// No description provided for @reportSent.
  ///
  /// In en, this message translates to:
  /// **'Report added. Neighbours can see it on the map.'**
  String get reportSent;

  /// No description provided for @reportFailed.
  ///
  /// In en, this message translates to:
  /// **'Couldn\'t send. Check your connection and try again.'**
  String get reportFailed;

  /// No description provided for @reportPickCategoryFirst.
  ///
  /// In en, this message translates to:
  /// **'Pick what\'s happening to send'**
  String get reportPickCategoryFirst;

  /// No description provided for @unitMicrograms.
  ///
  /// In en, this message translates to:
  /// **'µg/m³'**
  String get unitMicrograms;

  /// No description provided for @pm25.
  ///
  /// In en, this message translates to:
  /// **'PM2.5'**
  String get pm25;

  /// No description provided for @pm10.
  ///
  /// In en, this message translates to:
  /// **'PM10'**
  String get pm10;

  /// No description provided for @airStation.
  ///
  /// In en, this message translates to:
  /// **'GIOŚ station'**
  String get airStation;

  /// No description provided for @warningArea.
  ///
  /// In en, this message translates to:
  /// **'Warning area'**
  String get warningArea;

  /// No description provided for @updatedJustNow.
  ///
  /// In en, this message translates to:
  /// **'updated just now'**
  String get updatedJustNow;

  /// No description provided for @activeNearby.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Calm within 2 km} =1{1 active within 2 km} other{{count} active within 2 km}}'**
  String activeNearby(int count);

  /// No description provided for @minutesAgo.
  ///
  /// In en, this message translates to:
  /// **'{minutes} min ago'**
  String minutesAgo(int minutes);

  /// No description provided for @hoursAgo.
  ///
  /// In en, this message translates to:
  /// **'{hours} h ago'**
  String hoursAgo(int hours);

  /// No description provided for @confirmations.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No confirmations yet} =1{Confirmed by 1 person} other{Confirmed by {count} people}}'**
  String confirmations(int count);

  /// No description provided for @newNearby.
  ///
  /// In en, this message translates to:
  /// **'New: {title} · {distance}'**
  String newNearby(String title, String distance);

  /// No description provided for @updatedAgo.
  ///
  /// In en, this message translates to:
  /// **'updated {ago}'**
  String updatedAgo(String ago);

  /// No description provided for @layerCount.
  ///
  /// In en, this message translates to:
  /// **'{layer}, {count} items'**
  String layerCount(String layer, int count);

  /// No description provided for @activeNearbyLabel.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Calm within 2 km} =1{active within 2 km} other{active within 2 km}}'**
  String activeNearbyLabel(int count);
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'pl'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'pl':
      return AppLocalizationsPl();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
