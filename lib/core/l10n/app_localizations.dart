import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_az.dart';
import 'app_localizations_en.dart';
import 'app_localizations_ru.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
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

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
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
    Locale('az'),
    Locale('en'),
    Locale('ru'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In az, this message translates to:
  /// **'Limak Depo'**
  String get appTitle;

  /// No description provided for @signInTitle.
  ///
  /// In az, this message translates to:
  /// **'Hesabınıza daxil olun'**
  String get signInTitle;

  /// No description provided for @username.
  ///
  /// In az, this message translates to:
  /// **'İstifadəçi adı'**
  String get username;

  /// No description provided for @password.
  ///
  /// In az, this message translates to:
  /// **'Şifrə'**
  String get password;

  /// No description provided for @signIn.
  ///
  /// In az, this message translates to:
  /// **'Daxil ol'**
  String get signIn;

  /// No description provided for @usernameEmpty.
  ///
  /// In az, this message translates to:
  /// **'İstifadəçi adı boş ola bilməz'**
  String get usernameEmpty;

  /// No description provided for @passwordEmpty.
  ///
  /// In az, this message translates to:
  /// **'Şifrə boş ola bilməz'**
  String get passwordEmpty;

  /// No description provided for @version.
  ///
  /// In az, this message translates to:
  /// **'v 1.0.0'**
  String get version;

  /// No description provided for @invalidCredentials.
  ///
  /// In az, this message translates to:
  /// **'Yanlış istifadəçi adı və ya şifrə'**
  String get invalidCredentials;

  /// No description provided for @loginFailed.
  ///
  /// In az, this message translates to:
  /// **'Giriş uğursuz oldu. Yenidən cəhd edin.'**
  String get loginFailed;

  /// No description provided for @welcomeToDashboard.
  ///
  /// In az, this message translates to:
  /// **'İdarə Panelinə Xoş Gəlmisiniz'**
  String get welcomeToDashboard;

  /// No description provided for @searchParcels.
  ///
  /// In az, this message translates to:
  /// **'Bağlamaları axtarın...'**
  String get searchParcels;

  /// No description provided for @assigned.
  ///
  /// In az, this message translates to:
  /// **'Təyin edilmiş'**
  String get assigned;

  /// No description provided for @accepted.
  ///
  /// In az, this message translates to:
  /// **'Qəbul edilmiş'**
  String get accepted;

  /// No description provided for @delivered.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılmış'**
  String get delivered;

  /// No description provided for @returned.
  ///
  /// In az, this message translates to:
  /// **'Qaytarıldı'**
  String get returned;

  /// No description provided for @error.
  ///
  /// In az, this message translates to:
  /// **'Xəta'**
  String get error;

  /// No description provided for @retry.
  ///
  /// In az, this message translates to:
  /// **'Yenidən cəhd et'**
  String get retry;

  /// No description provided for @dashboard.
  ///
  /// In az, this message translates to:
  /// **'İdarə Paneli'**
  String get dashboard;

  /// No description provided for @profile.
  ///
  /// In az, this message translates to:
  /// **'Profil'**
  String get profile;

  /// No description provided for @qrScanner.
  ///
  /// In az, this message translates to:
  /// **'QR Skaner'**
  String get qrScanner;

  /// No description provided for @noAssignedParcels.
  ///
  /// In az, this message translates to:
  /// **'Təyin edilmiş bağlama yoxdur'**
  String get noAssignedParcels;

  /// No description provided for @noAcceptedParcels.
  ///
  /// In az, this message translates to:
  /// **'Qəbul edilmiş bağlama yoxdur'**
  String get noAcceptedParcels;

  /// No description provided for @noDeliveredParcels.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılmış bağlama yoxdur'**
  String get noDeliveredParcels;

  /// No description provided for @noReturnedParcels.
  ///
  /// In az, this message translates to:
  /// **'Qaytarılmış bağlama yoxdur'**
  String get noReturnedParcels;

  /// No description provided for @trackingId.
  ///
  /// In az, this message translates to:
  /// **'İzləmə ID'**
  String get trackingId;

  /// No description provided for @customerName.
  ///
  /// In az, this message translates to:
  /// **'Müştəri adı'**
  String get customerName;

  /// No description provided for @customerPhone.
  ///
  /// In az, this message translates to:
  /// **'Müştəri telefonu'**
  String get customerPhone;

  /// No description provided for @customerAddress.
  ///
  /// In az, this message translates to:
  /// **'Müştəri ünvanı'**
  String get customerAddress;

  /// No description provided for @amount.
  ///
  /// In az, this message translates to:
  /// **'Məbləğ'**
  String get amount;

  /// No description provided for @accept.
  ///
  /// In az, this message translates to:
  /// **'Qəbul et'**
  String get accept;

  /// No description provided for @delivered_status.
  ///
  /// In az, this message translates to:
  /// **'Çatdırıldı'**
  String get delivered_status;

  /// No description provided for @returned_status.
  ///
  /// In az, this message translates to:
  /// **'Qaytarıldı'**
  String get returned_status;

  /// No description provided for @loading.
  ///
  /// In az, this message translates to:
  /// **'Yüklənir...'**
  String get loading;

  /// No description provided for @pullToRefresh.
  ///
  /// In az, this message translates to:
  /// **'Yeniləmək üçün aşağı çəkin'**
  String get pullToRefresh;

  /// No description provided for @save.
  ///
  /// In az, this message translates to:
  /// **'Saxla'**
  String get save;

  /// No description provided for @cancel.
  ///
  /// In az, this message translates to:
  /// **'Ləğv et'**
  String get cancel;

  /// No description provided for @confirm.
  ///
  /// In az, this message translates to:
  /// **'Təsdiq et'**
  String get confirm;

  /// No description provided for @yes.
  ///
  /// In az, this message translates to:
  /// **'Bəli'**
  String get yes;

  /// No description provided for @no.
  ///
  /// In az, this message translates to:
  /// **'Xeyr'**
  String get no;

  /// No description provided for @ok.
  ///
  /// In az, this message translates to:
  /// **'Tamam'**
  String get ok;

  /// No description provided for @close.
  ///
  /// In az, this message translates to:
  /// **'Bağla'**
  String get close;

  /// No description provided for @next.
  ///
  /// In az, this message translates to:
  /// **'Növbəti'**
  String get next;

  /// No description provided for @previous.
  ///
  /// In az, this message translates to:
  /// **'Əvvəlki'**
  String get previous;

  /// No description provided for @done.
  ///
  /// In az, this message translates to:
  /// **'Hazır'**
  String get done;

  /// No description provided for @settings.
  ///
  /// In az, this message translates to:
  /// **'Tənzimləmələr'**
  String get settings;

  /// No description provided for @logout.
  ///
  /// In az, this message translates to:
  /// **'Çıxış'**
  String get logout;

  /// No description provided for @language.
  ///
  /// In az, this message translates to:
  /// **'Dil'**
  String get language;

  /// No description provided for @updateStatus.
  ///
  /// In az, this message translates to:
  /// **'Statusu yenilə'**
  String get updateStatus;

  /// No description provided for @contactCustomer.
  ///
  /// In az, this message translates to:
  /// **'Müştəri ilə əlaqə'**
  String get contactCustomer;

  /// No description provided for @call.
  ///
  /// In az, this message translates to:
  /// **'Zəng et'**
  String get call;

  /// No description provided for @whatsApp.
  ///
  /// In az, this message translates to:
  /// **'WhatsApp'**
  String get whatsApp;

  /// No description provided for @selectStatus.
  ///
  /// In az, this message translates to:
  /// **'Status seçin'**
  String get selectStatus;

  /// No description provided for @selectNote.
  ///
  /// In az, this message translates to:
  /// **'Qeyd seçin (Qaytarma üçün tələb olunur)'**
  String get selectNote;

  /// No description provided for @chooseReturnReason.
  ///
  /// In az, this message translates to:
  /// **'Qaytarma səbəbini seçin...'**
  String get chooseReturnReason;

  /// No description provided for @courierSignature.
  ///
  /// In az, this message translates to:
  /// **'Kuryer imzası (Çatdırma üçün tələb olunur)'**
  String get courierSignature;

  /// No description provided for @signAbove.
  ///
  /// In az, this message translates to:
  /// **'Yuxarıda imzalayın'**
  String get signAbove;

  /// No description provided for @clear.
  ///
  /// In az, this message translates to:
  /// **'Təmizlə'**
  String get clear;

  /// No description provided for @addPhoto.
  ///
  /// In az, this message translates to:
  /// **'Foto əlavə et (Çatdırma üçün tələb olunur)'**
  String get addPhoto;

  /// No description provided for @addPhotoOptional.
  ///
  /// In az, this message translates to:
  /// **'Foto əlavə et (İstəyə bağlı)'**
  String get addPhotoOptional;

  /// No description provided for @changePhoto.
  ///
  /// In az, this message translates to:
  /// **'Fotonu dəyişdir'**
  String get changePhoto;

  /// No description provided for @selectImageSource.
  ///
  /// In az, this message translates to:
  /// **'Şəkil mənbəyini seçin'**
  String get selectImageSource;

  /// No description provided for @camera.
  ///
  /// In az, this message translates to:
  /// **'Kamera'**
  String get camera;

  /// No description provided for @takeNewPhoto.
  ///
  /// In az, this message translates to:
  /// **'Yeni foto çək'**
  String get takeNewPhoto;

  /// No description provided for @gallery.
  ///
  /// In az, this message translates to:
  /// **'Qalereya'**
  String get gallery;

  /// No description provided for @chooseFromGallery.
  ///
  /// In az, this message translates to:
  /// **'Qalereyadan Seç'**
  String get chooseFromGallery;

  /// No description provided for @parcelAcceptedSuccessfully.
  ///
  /// In az, this message translates to:
  /// **'Bağlama uğurla qəbul edildi'**
  String get parcelAcceptedSuccessfully;

  /// No description provided for @statusUpdatedSuccessfully.
  ///
  /// In az, this message translates to:
  /// **'Status uğurla yeniləndi'**
  String get statusUpdatedSuccessfully;

  /// No description provided for @failedToLoadDashboard.
  ///
  /// In az, this message translates to:
  /// **'İdarə paneli yüklənə bilmədi'**
  String get failedToLoadDashboard;

  /// No description provided for @pleaseSelectReturnReason.
  ///
  /// In az, this message translates to:
  /// **'Zəhmət olmasa qaytarma səbəbini seçin'**
  String get pleaseSelectReturnReason;

  /// No description provided for @pleaseProvideSignature.
  ///
  /// In az, this message translates to:
  /// **'Zəhmət olmasa çatdırma üçün kuryer imzası verin'**
  String get pleaseProvideSignature;

  /// No description provided for @pleaseTakePhoto.
  ///
  /// In az, this message translates to:
  /// **'Zəhmət olmasa çatdırma təsdiqi üçün foto çəkin'**
  String get pleaseTakePhoto;

  /// No description provided for @pleaseProvideNoteOrPhoto.
  ///
  /// In az, this message translates to:
  /// **'Zəhmət olmasa qeyd verin və ya foto çəkin'**
  String get pleaseProvideNoteOrPhoto;

  /// No description provided for @welcomeToProfile.
  ///
  /// In az, this message translates to:
  /// **'Profilə xoş gəlmisiniz'**
  String get welcomeToProfile;

  /// No description provided for @errorLoadingProfile.
  ///
  /// In az, this message translates to:
  /// **'Profil yüklənməsində xəta'**
  String get errorLoadingProfile;

  /// No description provided for @personalInformation.
  ///
  /// In az, this message translates to:
  /// **'Şəxsi məlumatlar'**
  String get personalInformation;

  /// No description provided for @email.
  ///
  /// In az, this message translates to:
  /// **'E-poçt'**
  String get email;

  /// No description provided for @phone.
  ///
  /// In az, this message translates to:
  /// **'Telefon'**
  String get phone;

  /// No description provided for @address.
  ///
  /// In az, this message translates to:
  /// **'Ünvan'**
  String get address;

  /// No description provided for @notProvided.
  ///
  /// In az, this message translates to:
  /// **'Verilməyib'**
  String get notProvided;

  /// No description provided for @accountActions.
  ///
  /// In az, this message translates to:
  /// **'Hesab əməliyyatları'**
  String get accountActions;

  /// No description provided for @deliveryStatistics.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma statistikası'**
  String get deliveryStatistics;

  /// No description provided for @inCourier.
  ///
  /// In az, this message translates to:
  /// **'Kuryerdə'**
  String get inCourier;

  /// No description provided for @returns.
  ///
  /// In az, this message translates to:
  /// **'Qaytarmalar'**
  String get returns;

  /// No description provided for @scanQRCode.
  ///
  /// In az, this message translates to:
  /// **'QR kodu skan edin'**
  String get scanQRCode;

  /// No description provided for @scanQRDescription.
  ///
  /// In az, this message translates to:
  /// **'Bağlama detallarını görmək üçün QR kodları və ya barkodları skan edin'**
  String get scanQRDescription;

  /// No description provided for @startScanning.
  ///
  /// In az, this message translates to:
  /// **'Skanlamaya başla'**
  String get startScanning;

  /// No description provided for @positionQRCode.
  ///
  /// In az, this message translates to:
  /// **'Skan etmək üçün QR kodu və ya barkodu çərçivə daxilində yerləşdirin'**
  String get positionQRCode;

  /// No description provided for @invalidQRFormat.
  ///
  /// In az, this message translates to:
  /// **'Yanlış QR kod formatı'**
  String get invalidQRFormat;

  /// No description provided for @acceptParcel.
  ///
  /// In az, this message translates to:
  /// **'Bağlamanı qəbul et'**
  String get acceptParcel;

  /// No description provided for @decline.
  ///
  /// In az, this message translates to:
  /// **'İmtina et'**
  String get decline;

  /// No description provided for @logoutConfirmation.
  ///
  /// In az, this message translates to:
  /// **'Çıxmaq istədiyinizə əminsiniz? Yenidən daxil olmalı olacaqsınız.'**
  String get logoutConfirmation;

  /// No description provided for @logoutFailed.
  ///
  /// In az, this message translates to:
  /// **'Çıxış uğursuz oldu'**
  String get logoutFailed;

  /// No description provided for @changeLanguage.
  ///
  /// In az, this message translates to:
  /// **'Dili dəyişdir'**
  String get changeLanguage;

  /// No description provided for @selectLanguage.
  ///
  /// In az, this message translates to:
  /// **'Dil seçin'**
  String get selectLanguage;

  /// No description provided for @azerbaijani.
  ///
  /// In az, this message translates to:
  /// **'Azərbaycan dili'**
  String get azerbaijani;

  /// No description provided for @english.
  ///
  /// In az, this message translates to:
  /// **'İngilis dili'**
  String get english;

  /// No description provided for @russian.
  ///
  /// In az, this message translates to:
  /// **'Rus dili'**
  String get russian;

  /// No description provided for @filterByRegion.
  ///
  /// In az, this message translates to:
  /// **'Bölgəyə görə filtrləyin'**
  String get filterByRegion;

  /// No description provided for @selectRegion.
  ///
  /// In az, this message translates to:
  /// **'Bölgə seçin'**
  String get selectRegion;

  /// No description provided for @allRegions.
  ///
  /// In az, this message translates to:
  /// **'Bütün bölgələr'**
  String get allRegions;

  /// No description provided for @noRegion.
  ///
  /// In az, this message translates to:
  /// **'Bölgə yoxdur'**
  String get noRegion;

  /// No description provided for @searchRegions.
  ///
  /// In az, this message translates to:
  /// **'Bölgələri axtarın'**
  String get searchRegions;

  /// No description provided for @noRegionsFound.
  ///
  /// In az, this message translates to:
  /// **'Heç bir bölgə tapılmadı'**
  String get noRegionsFound;

  /// No description provided for @undeliveredParcel.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılmamış Bağlama'**
  String get undeliveredParcel;

  /// No description provided for @reassignParcelToYourself.
  ///
  /// In az, this message translates to:
  /// **'Bu çatdırılmamış bağlamanı yenidən özünüzə təyin etmək istəyirsiniz?'**
  String get reassignParcelToYourself;

  /// No description provided for @reassignParcel.
  ///
  /// In az, this message translates to:
  /// **'Bağlamanı Yenidən Təyin Et'**
  String get reassignParcel;

  /// No description provided for @selectRegionDescription.
  ///
  /// In az, this message translates to:
  /// **'Anbara davam etmək üçün regionunuzu seçin'**
  String get selectRegionDescription;

  /// No description provided for @continueToWarehouse.
  ///
  /// In az, this message translates to:
  /// **'Anbara Davam Et'**
  String get continueToWarehouse;

  /// No description provided for @accountInformation.
  ///
  /// In az, this message translates to:
  /// **'Hesab Məlumatları'**
  String get accountInformation;

  /// No description provided for @accountName.
  ///
  /// In az, this message translates to:
  /// **'Hesab Adı'**
  String get accountName;

  /// No description provided for @accountBalance.
  ///
  /// In az, this message translates to:
  /// **'Balans'**
  String get accountBalance;

  /// No description provided for @accountType.
  ///
  /// In az, this message translates to:
  /// **'Hesab Növü'**
  String get accountType;

  /// No description provided for @regionInfo.
  ///
  /// In az, this message translates to:
  /// **'Region'**
  String get regionInfo;

  /// No description provided for @accountId.
  ///
  /// In az, this message translates to:
  /// **'Hesab ID'**
  String get accountId;

  /// No description provided for @position.
  ///
  /// In az, this message translates to:
  /// **'Mövqe'**
  String get position;

  /// No description provided for @cashierInfo.
  ///
  /// In az, this message translates to:
  /// **'Kassir ID'**
  String get cashierInfo;

  /// No description provided for @country.
  ///
  /// In az, this message translates to:
  /// **'Ölkə'**
  String get country;

  /// No description provided for @regionStatistics.
  ///
  /// In az, this message translates to:
  /// **'Region Statistikaları'**
  String get regionStatistics;

  /// No description provided for @depotsCount.
  ///
  /// In az, this message translates to:
  /// **'Depo Sayı'**
  String get depotsCount;

  /// No description provided for @emptyPlaces.
  ///
  /// In az, this message translates to:
  /// **'Boş Yerlər'**
  String get emptyPlaces;

  /// No description provided for @lmkShopInvoices.
  ///
  /// In az, this message translates to:
  /// **'LMK Mağaza Fakturları'**
  String get lmkShopInvoices;

  /// No description provided for @courierWaits.
  ///
  /// In az, this message translates to:
  /// **'Kuryer Gözləmələri'**
  String get courierWaits;

  /// No description provided for @inDepot15Days.
  ///
  /// In az, this message translates to:
  /// **'Depoda 15+ Gün'**
  String get inDepot15Days;

  /// No description provided for @enacted.
  ///
  /// In az, this message translates to:
  /// **'Qüvvəyə Minmiş'**
  String get enacted;

  /// No description provided for @inDepot45Days.
  ///
  /// In az, this message translates to:
  /// **'Depoda 45+ Gün'**
  String get inDepot45Days;

  /// No description provided for @accountDetails.
  ///
  /// In az, this message translates to:
  /// **'Hesab Təfərrüatları'**
  String get accountDetails;

  /// No description provided for @qr.
  ///
  /// In az, this message translates to:
  /// **'QR'**
  String get qr;

  /// No description provided for @scanStorageBarcode.
  ///
  /// In az, this message translates to:
  /// **'Anbar Barkodunu Skan Et'**
  String get scanStorageBarcode;

  /// No description provided for @scanInvoiceBarcode.
  ///
  /// In az, this message translates to:
  /// **'Faktura Barkodunu Skan Et'**
  String get scanInvoiceBarcode;

  /// No description provided for @storageFound.
  ///
  /// In az, this message translates to:
  /// **'Anbar Tapıldı'**
  String get storageFound;

  /// No description provided for @storageDetails.
  ///
  /// In az, this message translates to:
  /// **'Anbar Təfərrüatları'**
  String get storageDetails;

  /// No description provided for @storageId.
  ///
  /// In az, this message translates to:
  /// **'Anbar ID'**
  String get storageId;

  /// No description provided for @storageCapacity.
  ///
  /// In az, this message translates to:
  /// **'Tutum'**
  String get storageCapacity;

  /// No description provided for @storageSize.
  ///
  /// In az, this message translates to:
  /// **'Ölçü'**
  String get storageSize;

  /// No description provided for @storageBox.
  ///
  /// In az, this message translates to:
  /// **'Qutu'**
  String get storageBox;

  /// No description provided for @continueToInvoice.
  ///
  /// In az, this message translates to:
  /// **'Faktura Skanına Davam Et'**
  String get continueToInvoice;

  /// No description provided for @scanAgain.
  ///
  /// In az, this message translates to:
  /// **'Təkrar'**
  String get scanAgain;

  /// No description provided for @invoiceStored.
  ///
  /// In az, this message translates to:
  /// **'Faktura Uğurla Saxlanıldı'**
  String get invoiceStored;

  /// No description provided for @backToStorage.
  ///
  /// In az, this message translates to:
  /// **'Anbar Skanına Qayıt'**
  String get backToStorage;

  /// No description provided for @scanNewStorage.
  ///
  /// In az, this message translates to:
  /// **'Yeni Anbar Skan Et'**
  String get scanNewStorage;

  /// No description provided for @positionCamera.
  ///
  /// In az, this message translates to:
  /// **'Kameranı QR kod və ya barkod üzərinə yerləşdirin'**
  String get positionCamera;

  /// No description provided for @invalidBarcode.
  ///
  /// In az, this message translates to:
  /// **'Yanlış barkod formatı'**
  String get invalidBarcode;

  /// No description provided for @storageNotFound.
  ///
  /// In az, this message translates to:
  /// **'Anbar yeri tapılmadı'**
  String get storageNotFound;

  /// No description provided for @invoiceNotFound.
  ///
  /// In az, this message translates to:
  /// **'Faktura tapılmadı'**
  String get invoiceNotFound;

  /// No description provided for @packageSearch.
  ///
  /// In az, this message translates to:
  /// **'Paket Axtarışı'**
  String get packageSearch;

  /// No description provided for @uniqid.
  ///
  /// In az, this message translates to:
  /// **'Unikal ID'**
  String get uniqid;

  /// No description provided for @fullname.
  ///
  /// In az, this message translates to:
  /// **'Tam Ad'**
  String get fullname;

  /// No description provided for @fin.
  ///
  /// In az, this message translates to:
  /// **'FİN'**
  String get fin;

  /// No description provided for @purchaseNo.
  ///
  /// In az, this message translates to:
  /// **'Alış Nömrəsi'**
  String get purchaseNo;

  /// No description provided for @searchPackages.
  ///
  /// In az, this message translates to:
  /// **'Paketləri Axtar'**
  String get searchPackages;

  /// No description provided for @packageDetails.
  ///
  /// In az, this message translates to:
  /// **'Paket Təfərrüatları'**
  String get packageDetails;

  /// No description provided for @customerInfo.
  ///
  /// In az, this message translates to:
  /// **'Müştəri Məlumatları'**
  String get customerInfo;

  /// No description provided for @packageStock.
  ///
  /// In az, this message translates to:
  /// **'Paket Stoku'**
  String get packageStock;

  /// No description provided for @contacts.
  ///
  /// In az, this message translates to:
  /// **'Əlaqələr'**
  String get contacts;

  /// No description provided for @totalWeight.
  ///
  /// In az, this message translates to:
  /// **'Ümumi Çəki'**
  String get totalWeight;

  /// No description provided for @balance.
  ///
  /// In az, this message translates to:
  /// **'Balans'**
  String get balance;

  /// No description provided for @birthdate.
  ///
  /// In az, this message translates to:
  /// **'Doğum Tarixi'**
  String get birthdate;

  /// No description provided for @serialNumber.
  ///
  /// In az, this message translates to:
  /// **'Seriya Nömrəsi'**
  String get serialNumber;

  /// No description provided for @shopName.
  ///
  /// In az, this message translates to:
  /// **'Mağaza Adı'**
  String get shopName;

  /// No description provided for @productType.
  ///
  /// In az, this message translates to:
  /// **'Məhsul Növü'**
  String get productType;

  /// No description provided for @weight.
  ///
  /// In az, this message translates to:
  /// **'Çəki'**
  String get weight;

  /// No description provided for @price.
  ///
  /// In az, this message translates to:
  /// **'Qiymət'**
  String get price;

  /// No description provided for @shippingPrice.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma Qiyməti'**
  String get shippingPrice;

  /// No description provided for @quantity.
  ///
  /// In az, this message translates to:
  /// **'Miqdar'**
  String get quantity;

  /// No description provided for @status.
  ///
  /// In az, this message translates to:
  /// **'Status'**
  String get status;

  /// No description provided for @actionDate.
  ///
  /// In az, this message translates to:
  /// **'Əməliyyat Tarixi'**
  String get actionDate;

  /// No description provided for @noPackagesFound.
  ///
  /// In az, this message translates to:
  /// **'Heç bir paket tapılmadı'**
  String get noPackagesFound;

  /// No description provided for @searchHint.
  ///
  /// In az, this message translates to:
  /// **'Ən azı bir axtarış parametri daxil edin'**
  String get searchHint;

  /// No description provided for @deliverPackages.
  ///
  /// In az, this message translates to:
  /// **'Paketləri Çatdır'**
  String get deliverPackages;

  /// No description provided for @selectPackages.
  ///
  /// In az, this message translates to:
  /// **'Paketləri Seç'**
  String get selectPackages;

  /// No description provided for @selectAll.
  ///
  /// In az, this message translates to:
  /// **'Hamısını Seç'**
  String get selectAll;

  /// No description provided for @deselectAll.
  ///
  /// In az, this message translates to:
  /// **'Hamısını Ləğv Et'**
  String get deselectAll;

  /// No description provided for @selectedPackages.
  ///
  /// In az, this message translates to:
  /// **'Seçilmiş Paketlər'**
  String get selectedPackages;

  /// No description provided for @proveImage.
  ///
  /// In az, this message translates to:
  /// **'Sübut Şəkli'**
  String get proveImage;

  /// No description provided for @takePhoto.
  ///
  /// In az, this message translates to:
  /// **'Foto Çək'**
  String get takePhoto;

  /// No description provided for @imageRequired.
  ///
  /// In az, this message translates to:
  /// **'Zəhmət olmasa sübut şəkli seçin'**
  String get imageRequired;

  /// No description provided for @packagesRequired.
  ///
  /// In az, this message translates to:
  /// **'Zəhmət olmasa ən azı bir paket seçin'**
  String get packagesRequired;

  /// No description provided for @deliverySuccess.
  ///
  /// In az, this message translates to:
  /// **'Paketlər uğurla çatdırıldı'**
  String get deliverySuccess;

  /// No description provided for @deliveryFailed.
  ///
  /// In az, this message translates to:
  /// **'Çatdırılma uğursuz oldu'**
  String get deliveryFailed;

  /// No description provided for @selectImage.
  ///
  /// In az, this message translates to:
  /// **'Şəkil Seç'**
  String get selectImage;
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
      <String>['az', 'en', 'ru'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'az':
      return AppLocalizationsAz();
    case 'en':
      return AppLocalizationsEn();
    case 'ru':
      return AppLocalizationsRu();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
