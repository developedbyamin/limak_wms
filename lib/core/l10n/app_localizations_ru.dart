// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get appTitle => 'Limak Depo';

  @override
  String get signInTitle => 'Войдите в свой аккаунт';

  @override
  String get username => 'Имя пользователя';

  @override
  String get password => 'Пароль';

  @override
  String get signIn => 'Войти';

  @override
  String get usernameEmpty => 'Имя пользователя не может быть пустым';

  @override
  String get passwordEmpty => 'Пароль не может быть пустым';

  @override
  String get version => 'v 1.0.0';

  @override
  String get invalidCredentials => 'Неверное имя пользователя или пароль';

  @override
  String get loginFailed => 'Ошибка входа. Попробуйте еще раз.';

  @override
  String get welcomeToDashboard => 'Добро пожаловать в панель управления';

  @override
  String get searchParcels => 'Поиск посылок...';

  @override
  String get assigned => 'Назначенные';

  @override
  String get accepted => 'Принятые';

  @override
  String get delivered => 'Доставлено';

  @override
  String get returned => 'Возвращено';

  @override
  String get error => 'Ошибка';

  @override
  String get retry => 'Повторить';

  @override
  String get dashboard => 'Панель управления';

  @override
  String get profile => 'Профиль';

  @override
  String get qrScanner => 'QR Сканер';

  @override
  String get noAssignedParcels => 'Нет назначенных посылок';

  @override
  String get noAcceptedParcels => 'Нет принятых посылок';

  @override
  String get noDeliveredParcels => 'Нет доставленных посылок';

  @override
  String get noReturnedParcels => 'Нет возвращенных посылок';

  @override
  String get trackingId => 'ID отслеживания';

  @override
  String get customerName => 'Имя клиента';

  @override
  String get customerPhone => 'Телефон клиента';

  @override
  String get customerAddress => 'Адрес клиента';

  @override
  String get amount => 'Сумма';

  @override
  String get accept => 'Принять';

  @override
  String get delivered_status => 'Доставлено';

  @override
  String get returned_status => 'Возвращено';

  @override
  String get loading => 'Загрузка...';

  @override
  String get pullToRefresh => 'Потяните для обновления';

  @override
  String get save => 'Сохранить';

  @override
  String get cancel => 'Отмена';

  @override
  String get confirm => 'Подтвердить';

  @override
  String get yes => 'Да';

  @override
  String get no => 'Нет';

  @override
  String get ok => 'ОК';

  @override
  String get close => 'Закрыть';

  @override
  String get next => 'Далее';

  @override
  String get previous => 'Назад';

  @override
  String get done => 'Готово';

  @override
  String get settings => 'Настройки';

  @override
  String get logout => 'Выйти';

  @override
  String get language => 'Язык';

  @override
  String get updateStatus => 'Обновить статус';

  @override
  String get contactCustomer => 'Связаться с клиентом';

  @override
  String get call => 'Позвонить';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get selectStatus => 'Выберите статус';

  @override
  String get selectNote => 'Выберите примечание (Обязательно для возврата)';

  @override
  String get chooseReturnReason => 'Выберите причину возврата...';

  @override
  String get courierSignature => 'Подпись курьера (Обязательно для доставки)';

  @override
  String get signAbove => 'Подпишите выше';

  @override
  String get clear => 'Очистить';

  @override
  String get addPhoto => 'Добавить фото (Обязательно для доставки)';

  @override
  String get addPhotoOptional => 'Добавить фото (По желанию)';

  @override
  String get changePhoto => 'Изменить фото';

  @override
  String get selectImageSource => 'Выберите источник изображения';

  @override
  String get camera => 'Камера';

  @override
  String get takeNewPhoto => 'Сделать новое фото';

  @override
  String get gallery => 'Галерея';

  @override
  String get chooseFromGallery => 'Выбрать из галереи';

  @override
  String get parcelAcceptedSuccessfully => 'Посылка успешно принята';

  @override
  String get statusUpdatedSuccessfully => 'Статус успешно обновлен';

  @override
  String get failedToLoadDashboard => 'Не удалось загрузить панель управления';

  @override
  String get pleaseSelectReturnReason =>
      'Пожалуйста, выберите причину возврата';

  @override
  String get pleaseProvideSignature =>
      'Пожалуйста, предоставьте подпись курьера для доставки';

  @override
  String get pleaseTakePhoto =>
      'Пожалуйста, сделайте фото для подтверждения доставки';

  @override
  String get pleaseProvideNoteOrPhoto =>
      'Пожалуйста, предоставьте примечание или сделайте фото';

  @override
  String get welcomeToProfile => 'Добро пожаловать в профиль';

  @override
  String get errorLoadingProfile => 'Ошибка загрузки профиля';

  @override
  String get personalInformation => 'Личная информация';

  @override
  String get email => 'Электронная Почта';

  @override
  String get phone => 'Телефон';

  @override
  String get address => 'Адрес';

  @override
  String get notProvided => 'Не указано';

  @override
  String get accountActions => 'Действия с аккаунтом';

  @override
  String get deliveryStatistics => 'Статистика доставки';

  @override
  String get inCourier => 'У курьера';

  @override
  String get returns => 'Возвраты';

  @override
  String get scanQRCode => 'Сканировать QR код';

  @override
  String get scanQRDescription =>
      'Сканируйте QR коды или штрих-коды для просмотра деталей посылки';

  @override
  String get startScanning => 'Начать сканирование';

  @override
  String get positionQRCode =>
      'Разместите QR код или штрих-код в рамке для сканирования';

  @override
  String get invalidQRFormat => 'Неверный формат QR кода';

  @override
  String get acceptParcel => 'Принять посылку';

  @override
  String get decline => 'Отклонить';

  @override
  String get logoutConfirmation =>
      'Вы уверены, что хотите выйти? Вам нужно будет войти снова.';

  @override
  String get logoutFailed => 'Не удалось выйти';

  @override
  String get changeLanguage => 'Изменить язык';

  @override
  String get selectLanguage => 'Выберите язык';

  @override
  String get azerbaijani => 'Азербайджанский';

  @override
  String get english => 'Английский';

  @override
  String get russian => 'Русский';

  @override
  String get filterByRegion => 'Фильтр по региону';

  @override
  String get selectRegion => 'Выберите регион';

  @override
  String get allRegions => 'Все регионы';

  @override
  String get noRegion => 'Без региона';

  @override
  String get searchRegions => 'Поиск регионов';

  @override
  String get noRegionsFound => 'Регионы не найдены';

  @override
  String get undeliveredParcel => 'Недоставленная Посылка';

  @override
  String get reassignParcelToYourself =>
      'Хотите ли вы назначить эту недоставленную посылку себе снова?';

  @override
  String get reassignParcel => 'Переназначить Посылку';

  @override
  String get selectRegionDescription =>
      'Пожалуйста, выберите ваш регион для перехода на склад';

  @override
  String get continueToWarehouse => 'Перейти на Склад';

  @override
  String get accountInformation => 'Информация о счете';

  @override
  String get accountName => 'Название счета';

  @override
  String get accountBalance => 'Баланс';

  @override
  String get accountType => 'Тип счета';

  @override
  String get regionInfo => 'Регион';

  @override
  String get accountId => 'ID счета';

  @override
  String get position => 'Позиция';

  @override
  String get cashierInfo => 'ID кассира';

  @override
  String get country => 'Страна';

  @override
  String get regionStatistics => 'Статистика региона';

  @override
  String get depotsCount => 'Количество депо';

  @override
  String get emptyPlaces => 'Пустые места';

  @override
  String get lmkShopInvoices => 'Счета LMK магазина';

  @override
  String get courierWaits => 'Ожидания курьера';

  @override
  String get inDepot15Days => 'В депо 15+ дней';

  @override
  String get enacted => 'Введено в действие';

  @override
  String get inDepot45Days => 'В депо 45+ дней';

  @override
  String get accountDetails => 'Детали счета';

  @override
  String get qr => 'QR';

  @override
  String get scanStorageBarcode => 'Сканировать штрихкод склада';

  @override
  String get scanInvoiceBarcode => 'Сканировать штрихкод накладной';

  @override
  String get storageFound => 'Склад найден';

  @override
  String get storageDetails => 'Детали склада';

  @override
  String get storageId => 'ID склада';

  @override
  String get storageCapacity => 'Вместимость';

  @override
  String get storageSize => 'Размер';

  @override
  String get storageBox => 'Коробка';

  @override
  String get continueToInvoice => 'Перейти к сканированию накладной';

  @override
  String get scanAgain => 'Снова';

  @override
  String get invoiceStored => 'Накладная успешно сохранена';

  @override
  String get backToStorage => 'Вернуться к сканированию склада';

  @override
  String get scanNewStorage => 'Сканировать новый склад';

  @override
  String get positionCamera => 'Наведите камеру на QR-код или штрихкод';

  @override
  String get invalidBarcode => 'Неверный формат штрихкода';

  @override
  String get storageNotFound => 'Место склада не найдено';

  @override
  String get invoiceNotFound => 'Накладная не найдена';

  @override
  String get packageSearch => 'Поиск Посылок';

  @override
  String get uniqid => 'Уникальный ID';

  @override
  String get fullname => 'Полное Имя';

  @override
  String get fin => 'ФИН';

  @override
  String get purchaseNo => 'Номер Покупки';

  @override
  String get searchPackages => 'Искать Посылки';

  @override
  String get packageDetails => 'Детали Посылки';

  @override
  String get customerInfo => 'Информация о Клиенте';

  @override
  String get packageStock => 'Склад Посылок';

  @override
  String get contacts => 'Контакты';

  @override
  String get totalWeight => 'Общий Вес';

  @override
  String get balance => 'Баланс';

  @override
  String get birthdate => 'Дата Рождения';

  @override
  String get serialNumber => 'Серийный Номер';

  @override
  String get shopName => 'Название Магазина';

  @override
  String get productType => 'Тип Продукта';

  @override
  String get weight => 'Вес';

  @override
  String get price => 'Цена';

  @override
  String get shippingPrice => 'Стоимость Доставки';

  @override
  String get quantity => 'Количество';

  @override
  String get status => 'Статус';

  @override
  String get actionDate => 'Дата Действия';

  @override
  String get noPackagesFound => 'Посылки не найдены';

  @override
  String get searchHint => 'Введите хотя бы один параметр поиска';
}
