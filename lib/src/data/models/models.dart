

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