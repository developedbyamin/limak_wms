

// Login Request Model
class LoginRequest {
  final String username;
  final String password;

  LoginRequest({
    required this.username,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}

// Login Response Model
class LoginResponse {
  final bool success;
  final String? message;
  final String? token;
  final Map<String, dynamic>? data;

  LoginResponse({
    required this.success,
    this.message,
    this.token,
    this.data,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: !(json['error'] ?? true), // error: false means success: true
      message: json['message'],
      token: json['data']?['token'],
      data: json['data'],
    );
  }
}

// Region Model
class Region {
  final int id;
  final String name;

  Region({
    required this.id,
    required this.name,
  });

  factory Region.fromJson(Map<String, dynamic> json) {
    return Region(
      id: json['id'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

// Regions Response Model
class RegionsResponse {
  final bool error;
  final List<Region> regions;

  RegionsResponse({
    required this.error,
    required this.regions,
  });

  factory RegionsResponse.fromJson(Map<String, dynamic> json) {
    return RegionsResponse(
      error: json['error'] ?? false,
      regions: (json['regions'] as List<dynamic>?)
          ?.map((regionJson) => Region.fromJson(regionJson))
          .toList() ?? [],
    );
  }
}

// Account Model
class Account {
  final int id;
  final String name;
  final String balance;
  final String balanceTry;
  final String currency;
  final int type;
  final int forOrderPayment;
  final String accountType;
  final int accountId;
  final int regionId;
  final String toCountry;
  final int cashierId;
  final int position;

  Account({
    required this.id,
    required this.name,
    required this.balance,
    required this.balanceTry,
    required this.currency,
    required this.type,
    required this.forOrderPayment,
    required this.accountType,
    required this.accountId,
    required this.regionId,
    required this.toCountry,
    required this.cashierId,
    required this.position,
  });

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
      balance: json['balance'],
      balanceTry: json['balance_try'],
      currency: json['currency'],
      type: json['type'],
      forOrderPayment: json['for_order_payment'],
      accountType: json['account_type'],
      accountId: json['account_id'],
      regionId: json['region_id'],
      toCountry: json['to_country'],
      cashierId: json['cashier_id'],
      position: json['position'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'balance': balance,
      'balance_try': balanceTry,
      'currency': currency,
      'type': type,
      'for_order_payment': forOrderPayment,
      'account_type': accountType,
      'account_id': accountId,
      'region_id': regionId,
      'to_country': toCountry,
      'cashier_id': cashierId,
      'position': position,
    };
  }
}

// Account Response Model
class AccountResponse {
  final bool error;
  final Account data;

  AccountResponse({
    required this.error,
    required this.data,
  });

  factory AccountResponse.fromJson(Map<String, dynamic> json) {
    return AccountResponse(
      error: json['error'] ?? false,
      data: Account.fromJson(json['data']),
    );
  }
}

// Region Details Model
class RegionDetails {
  final int depotsCount;
  final int emptyPlaces;
  final int lmkShopInvoices;
  final int courierWaits;
  final int region;
  final int inDepot15Days;
  final int enacted;
  final int inDepot45Days;

  RegionDetails({
    required this.depotsCount,
    required this.emptyPlaces,
    required this.lmkShopInvoices,
    required this.courierWaits,
    required this.region,
    required this.inDepot15Days,
    required this.enacted,
    required this.inDepot45Days,
  });

  factory RegionDetails.fromJson(Map<String, dynamic> json) {
    return RegionDetails(
      depotsCount: json['depots_count'] ?? 0,
      emptyPlaces: json['empty_places'] ?? 0,
      lmkShopInvoices: json['lmk_shop_invoices'] ?? 0,
      courierWaits: json['courier_waits'] ?? 0,
      region: json['region'] ?? 0,
      inDepot15Days: json['inDepot15Days'] ?? 0,
      enacted: json['enacted'] ?? 0,
      inDepot45Days: json['inDepot45Days'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'depots_count': depotsCount,
      'empty_places': emptyPlaces,
      'lmk_shop_invoices': lmkShopInvoices,
      'courier_waits': courierWaits,
      'region': region,
      'inDepot15Days': inDepot15Days,
      'enacted': enacted,
      'inDepot45Days': inDepot45Days,
    };
  }
}

// Region Details Response Model
class RegionDetailsResponse {
  final bool error;
  final RegionDetails data;

  RegionDetailsResponse({
    required this.error,
    required this.data,
  });

  factory RegionDetailsResponse.fromJson(Map<String, dynamic> json) {
    return RegionDetailsResponse(
      error: json['error'] ?? false,
      data: RegionDetails.fromJson(json['data']),
    );
  }
}

// Storage Model
class Storage {
  final int id;
  final int regionId;
  final String index;
  final int number;
  final String capacity;
  final int size;
  final int box;
  final String barcodeId;
  final String createdAt;
  final String updatedAt;

  Storage({
    required this.id,
    required this.regionId,
    required this.index,
    required this.number,
    required this.capacity,
    required this.size,
    required this.box,
    required this.barcodeId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Storage.fromJson(Map<String, dynamic> json) {
    return Storage(
      id: json['id'],
      regionId: json['region_id'],
      index: json['index'],
      number: json['number'],
      capacity: json['capacity'],
      size: json['size'],
      box: json['box'],
      barcodeId: json['barcode_id'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

// Storage Response Model
class StorageResponse {
  final bool error;
  final Storage? data;
  final String? message;

  StorageResponse({
    required this.error,
    this.data,
    this.message,
  });

  factory StorageResponse.fromJson(Map<String, dynamic> json) {
    return StorageResponse(
      error: json['error'] ?? false,
      data: json['data'] != null ? Storage.fromJson(json['data']) : null,
      message: json['message'],
    );
  }
}

// Store In Depot Response Model
class StoreInDepotResponse {
  final bool error;
  final String message;

  StoreInDepotResponse({
    required this.error,
    required this.message,
  });

  factory StoreInDepotResponse.fromJson(Map<String, dynamic> json) {
    return StoreInDepotResponse(
      error: json['error'] ?? false,
      message: json['message'] ?? '',
    );
  }
}

// Package Stock Model
class PackageStock {
  final int id;
  final int regionId;
  final int? clientId;
  final int countryId;
  final int statusId;
  final String shippingPrice;
  final String purchaseNo;
  final String weight;
  final int? doubleCheck;
  final int isPaid;
  final String? cPaid;
  final int depotId;
  final String index;
  final int number;
  final String barcodeId;
  final String? link;
  final String? cargoPrice;
  final String shopName;
  final String adminName;
  final String adminSurname;
  final String price;
  final String productTypeName;
  final int quantity;
  final String? clientName;
  final String? clientSurname;
  final String actionDate;

  PackageStock({
    required this.id,
    required this.regionId,
    this.clientId,
    required this.countryId,
    required this.statusId,
    required this.shippingPrice,
    required this.purchaseNo,
    required this.weight,
    this.doubleCheck,
    required this.isPaid,
    this.cPaid,
    required this.depotId,
    required this.index,
    required this.number,
    required this.barcodeId,
    this.link,
    this.cargoPrice,
    required this.shopName,
    required this.adminName,
    required this.adminSurname,
    required this.price,
    required this.productTypeName,
    required this.quantity,
    this.clientName,
    this.clientSurname,
    required this.actionDate,
  });

  factory PackageStock.fromJson(Map<String, dynamic> json) {
    return PackageStock(
      id: json['id'],
      regionId: json['region_id'],
      clientId: json['client_id'],
      countryId: json['country_id'],
      statusId: json['status_id'],
      shippingPrice: json['shipping_price'] ?? '0.00',
      purchaseNo: json['purchase_no'] ?? '',
      weight: json['weight'] ?? '0.00',
      doubleCheck: json['double_check'],
      isPaid: json['is_paid'] ?? 0,
      cPaid: json['c_paid'],
      depotId: json['depot_id'],
      index: json['index'] ?? '',
      number: json['number'],
      barcodeId: json['barcode_id'] ?? '',
      link: json['link'],
      cargoPrice: json['cargo_price'],
      shopName: json['shop_name'] ?? '',
      adminName: json['admin_name'] ?? '',
      adminSurname: json['admin_surname'] ?? '',
      price: json['price'] ?? '0.00',
      productTypeName: json['product_type_name'] ?? '',
      quantity: json['quantity'] ?? 1,
      clientName: json['client_name'],
      clientSurname: json['client_surname'],
      actionDate: json['action_date'] ?? '',
    );
  }
}

// User Contact Model
class UserContact {
  final int id;
  final int userId;
  final String name;
  final String createdAt;
  final String updatedAt;

  UserContact({
    required this.id,
    required this.userId,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserContact.fromJson(Map<String, dynamic> json) {
    return UserContact(
      id: json['id'],
      userId: json['user_id'],
      name: json['name'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }
}

// Package Data Model
class PackageData {
  final int id;
  final int regionId;
  final String serialNumber;
  final String? passportDate;
  final String citizenship;
  final String balance;
  final String balanceTry;
  final String balanceUsd;
  final String orderBalance;
  final String pin;
  final String name;
  final String surname;
  final String email;
  final String address;
  final String birthdate;
  final int gender;
  final String nationality;
  final String createdAt;
  final String updatedAt;
  final String uniqid;
  final int isBlacklist;
  final int isPudoCustomer;
  final int isBlocked;
  final int isProblematic;
  final int invoiceProblem;
  final int activated;
  final String activationCode;
  final int mid;
  final String apiKey;
  final String fcmToken;
  final String? appVersion;
  final String? appOs;
  final int isPremium;
  final int shop;
  final String? shopCountry;
  final int corporate;
  final String? tariffs;
  final int discountPercent;
  final String? comment;
  final String onlineSms;
  final int trBlock;
  final String lang;
  final String bonusBalance;
  final int bonusBalancePending;
  final int type;
  final int legalPerson;
  final String? companyName;
  final String? voen;
  final int notificationType;
  final int isTrendyol;
  final String? digitalLoginInfo;
  final int isOzon;
  final int isTemu;
  final String toCountry;
  final String? deletedAt;
  final List<PackageStock> stock;
  final double allWeight;
  final List<UserContact> userContacts;

  PackageData({
    required this.id,
    required this.regionId,
    required this.serialNumber,
    this.passportDate,
    required this.citizenship,
    required this.balance,
    required this.balanceTry,
    required this.balanceUsd,
    required this.orderBalance,
    required this.pin,
    required this.name,
    required this.surname,
    required this.email,
    required this.address,
    required this.birthdate,
    required this.gender,
    required this.nationality,
    required this.createdAt,
    required this.updatedAt,
    required this.uniqid,
    required this.isBlacklist,
    required this.isPudoCustomer,
    required this.isBlocked,
    required this.isProblematic,
    required this.invoiceProblem,
    required this.activated,
    required this.activationCode,
    required this.mid,
    required this.apiKey,
    required this.fcmToken,
    this.appVersion,
    this.appOs,
    required this.isPremium,
    required this.shop,
    this.shopCountry,
    required this.corporate,
    this.tariffs,
    required this.discountPercent,
    this.comment,
    required this.onlineSms,
    required this.trBlock,
    required this.lang,
    required this.bonusBalance,
    required this.bonusBalancePending,
    required this.type,
    required this.legalPerson,
    this.companyName,
    this.voen,
    required this.notificationType,
    required this.isTrendyol,
    this.digitalLoginInfo,
    required this.isOzon,
    required this.isTemu,
    required this.toCountry,
    this.deletedAt,
    required this.stock,
    required this.allWeight,
    required this.userContacts,
  });

  factory PackageData.fromJson(Map<String, dynamic> json) {
    return PackageData(
      id: json['id'],
      regionId: json['region_id'],
      serialNumber: json['serial_number'] ?? '',
      passportDate: json['passport_date'],
      citizenship: json['citizenship'] ?? '',
      balance: json['balance'] ?? '0.00',
      balanceTry: json['balance_try'] ?? '0.00',
      balanceUsd: json['balance_usd'] ?? '0.00',
      orderBalance: json['order_balance'] ?? '0.00',
      pin: json['pin'] ?? '',
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      email: json['email'] ?? '',
      address: json['address'] ?? '',
      birthdate: json['birthdate'] ?? '',
      gender: json['gender'] ?? 0,
      nationality: json['nationality'] ?? '',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      uniqid: json['uniqid'] ?? '',
      isBlacklist: json['is_blacklist'] ?? 0,
      isPudoCustomer: json['is_pudo_customer'] ?? 0,
      isBlocked: json['is_blocked'] ?? 0,
      isProblematic: json['is_problematic'] ?? 0,
      invoiceProblem: json['invoice_problem'] ?? 0,
      activated: json['activated'] ?? 0,
      activationCode: json['activation_code'] ?? '',
      mid: json['mid'] ?? 0,
      apiKey: json['api_key'] ?? '',
      fcmToken: json['fcm_token'] ?? '',
      appVersion: json['app_version'],
      appOs: json['app_os'],
      isPremium: json['is_premium'] ?? 0,
      shop: json['shop'] ?? 0,
      shopCountry: json['shop_country'],
      corporate: json['corporate'] ?? 0,
      tariffs: json['tariffs'],
      discountPercent: json['discount_percent'] ?? 0,
      comment: json['comment'],
      onlineSms: json['online_sms'] ?? '',
      trBlock: json['tr_block'] ?? 0,
      lang: json['lang'] ?? 'az',
      bonusBalance: json['bonus_balance'] ?? '0.00',
      bonusBalancePending: json['bonus_balance_pending'] ?? 0,
      type: json['type'] ?? 0,
      legalPerson: json['legal_person'] ?? 0,
      companyName: json['company_name'],
      voen: json['voen'],
      notificationType: json['notification_type'] ?? 0,
      isTrendyol: json['is_trendyol'] ?? 0,
      digitalLoginInfo: json['digital_login_info'],
      isOzon: json['is_ozon'] ?? 0,
      isTemu: json['is_temu'] ?? 0,
      toCountry: json['to_country'] ?? '',
      deletedAt: json['deleted_at'],
      stock: (json['stock'] as List<dynamic>?)
          ?.map((item) => PackageStock.fromJson(item))
          .toList() ?? [],
      allWeight: (json['all_weight'] as num?)?.toDouble() ?? 0.0,
      userContacts: (json['user_contacts'] as List<dynamic>?)
          ?.map((item) => UserContact.fromJson(item))
          .toList() ?? [],
    );
  }
}

// Package Response Model
class PackageResponse {
  final bool error;
  final PackageData? data;
  final String? message;

  PackageResponse({
    required this.error,
    this.data,
    this.message,
  });

  factory PackageResponse.fromJson(Map<String, dynamic> json) {
    return PackageResponse(
      error: json['error'] ?? false,
      data: json['data'] != null ? PackageData.fromJson(json['data']) : null,
      message: json['message'],
    );
  }
}