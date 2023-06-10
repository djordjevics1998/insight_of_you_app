import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart' deferred as app_localizations_en;
import 'app_localizations_sr.dart' deferred as app_localizations_sr;

/// Callers can lookup localized strings with an instance of InsightOfYouAppLocalizations
/// returned by `InsightOfYouAppLocalizations.of(context)`.
///
/// Applications need to include `InsightOfYouAppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: InsightOfYouAppLocalizations.localizationsDelegates,
///   supportedLocales: InsightOfYouAppLocalizations.supportedLocales,
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
/// be consistent with the languages listed in the InsightOfYouAppLocalizations.supportedLocales
/// property.
abstract class InsightOfYouAppLocalizations {
  InsightOfYouAppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static InsightOfYouAppLocalizations? of(BuildContext context) {
    return Localizations.of<InsightOfYouAppLocalizations>(context, InsightOfYouAppLocalizations);
  }

  static const LocalizationsDelegate<InsightOfYouAppLocalizations> delegate = _InsightOfYouAppLocalizationsDelegate();

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
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('sr')
  ];

  /// No description provided for @app_title.
  ///
  /// In en, this message translates to:
  /// **'Insight of you'**
  String get app_title;

  /// No description provided for @web_enable_audio_video.
  ///
  /// In en, this message translates to:
  /// **'To play this web app you need to consent to play audio/video'**
  String get web_enable_audio_video;

  /// No description provided for @consent.
  ///
  /// In en, this message translates to:
  /// **'I consent, let me through!'**
  String get consent;

  /// No description provided for @over18_warning.
  ///
  /// In en, this message translates to:
  /// **'This game is 18+ only!'**
  String get over18_warning;

  /// No description provided for @over18_question.
  ///
  /// In en, this message translates to:
  /// **'Are you old enough?!'**
  String get over18_question;

  /// No description provided for @over18_yes.
  ///
  /// In en, this message translates to:
  /// **'Yes, Ma\'am, I am old enough!'**
  String get over18_yes;

  /// No description provided for @over18_no.
  ///
  /// In en, this message translates to:
  /// **'No, no, no! Get me out!'**
  String get over18_no;

  /// No description provided for @not_over_18.
  ///
  /// In en, this message translates to:
  /// **'CLOSE THIS APP AND GROW UP'**
  String get not_over_18;

  /// No description provided for @start.
  ///
  /// In en, this message translates to:
  /// **'Start'**
  String get start;

  /// No description provided for @load.
  ///
  /// In en, this message translates to:
  /// **'Load'**
  String get load;

  /// No description provided for @fullscreen.
  ///
  /// In en, this message translates to:
  /// **'Fullscreen'**
  String get fullscreen;
}

class _InsightOfYouAppLocalizationsDelegate extends LocalizationsDelegate<InsightOfYouAppLocalizations> {
  const _InsightOfYouAppLocalizationsDelegate();

  @override
  Future<InsightOfYouAppLocalizations> load(Locale locale) {
    return lookupInsightOfYouAppLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'sr'].contains(locale.languageCode);

  @override
  bool shouldReload(_InsightOfYouAppLocalizationsDelegate old) => false;
}

Future<InsightOfYouAppLocalizations> lookupInsightOfYouAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return app_localizations_en.loadLibrary().then((dynamic _) => app_localizations_en.InsightOfYouAppLocalizationsEn());
    case 'sr': return app_localizations_sr.loadLibrary().then((dynamic _) => app_localizations_sr.InsightOfYouAppLocalizationsSr());
  }

  throw FlutterError(
    'InsightOfYouAppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
