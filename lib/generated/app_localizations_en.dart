import 'app_localizations.dart';

/// The translations for English (`en`).
class InsightOfYouAppLocalizationsEn extends InsightOfYouAppLocalizations {
  InsightOfYouAppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get app_title => 'Insight of you';

  @override
  String get web_enable_audio_video => 'To play this web app you need to consent to play audio/video';

  @override
  String get consent => 'I consent, let me through!';

  @override
  String get over18_warning => 'This game is 18+ only!';

  @override
  String get over18_question => 'Are you old enough?!';

  @override
  String get over18_yes => 'Yes, Ma\'am, I am old enough!';

  @override
  String get over18_no => 'No, no, no! Get me out!';

  @override
  String get not_over_18 => 'CLOSE THIS APP AND GROW UP';

  @override
  String get start => 'Start';

  @override
  String get load => 'Load';

  @override
  String get fullscreen => 'Fullscreen';
}
