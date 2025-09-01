// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Limak Depo';

  @override
  String get signInTitle => 'Sign in to your account';

  @override
  String get username => 'Username';

  @override
  String get password => 'Password';

  @override
  String get signIn => 'Sign In';

  @override
  String get usernameEmpty => 'Username cannot be empty';

  @override
  String get passwordEmpty => 'Password cannot be empty';

  @override
  String get version => 'v 1.0.0';

  @override
  String get invalidCredentials => 'Invalid username or password';

  @override
  String get loginFailed => 'Login failed. Please try again.';

  @override
  String get welcomeToDashboard => 'Welcome to Dashboard';

  @override
  String get searchParcels => 'Search parcels...';

  @override
  String get assigned => 'Assigned';

  @override
  String get accepted => 'Accepted';

  @override
  String get delivered => 'Delivered';

  @override
  String get returned => 'Returned';

  @override
  String get error => 'Error';

  @override
  String get retry => 'Retry';

  @override
  String get dashboard => 'Dashboard';

  @override
  String get profile => 'Profile';

  @override
  String get qrScanner => 'QR Scanner';

  @override
  String get noAssignedParcels => 'No assigned parcels';

  @override
  String get noAcceptedParcels => 'No accepted parcels';

  @override
  String get noDeliveredParcels => 'No delivered parcels';

  @override
  String get noReturnedParcels => 'No returned parcels';

  @override
  String get trackingId => 'Tracking ID';

  @override
  String get customerName => 'Customer Name';

  @override
  String get customerPhone => 'Customer Phone';

  @override
  String get customerAddress => 'Customer Address';

  @override
  String get amount => 'Amount';

  @override
  String get accept => 'Accept';

  @override
  String get delivered_status => 'Delivered';

  @override
  String get returned_status => 'Returned';

  @override
  String get loading => 'Loading...';

  @override
  String get pullToRefresh => 'Pull to refresh';

  @override
  String get save => 'Save';

  @override
  String get cancel => 'Cancel';

  @override
  String get confirm => 'Confirm';

  @override
  String get yes => 'Yes';

  @override
  String get no => 'No';

  @override
  String get ok => 'OK';

  @override
  String get close => 'Close';

  @override
  String get next => 'Next';

  @override
  String get previous => 'Previous';

  @override
  String get done => 'Done';

  @override
  String get settings => 'Settings';

  @override
  String get logout => 'Logout';

  @override
  String get language => 'Language';

  @override
  String get updateStatus => 'Update Status';

  @override
  String get contactCustomer => 'Contact Customer';

  @override
  String get call => 'Call';

  @override
  String get whatsApp => 'WhatsApp';

  @override
  String get selectStatus => 'Select Status';

  @override
  String get selectNote => 'Select Note (Required for Return)';

  @override
  String get chooseReturnReason => 'Choose a return reason...';

  @override
  String get courierSignature => 'Courier Signature (Required for Delivery)';

  @override
  String get signAbove => 'Sign above';

  @override
  String get clear => 'Clear';

  @override
  String get addPhoto => 'Add Photo (Required for Delivery)';

  @override
  String get addPhotoOptional => 'Add Photo (Optional)';

  @override
  String get changePhoto => 'Change Photo';

  @override
  String get selectImageSource => 'Select Image Source';

  @override
  String get camera => 'Camera';

  @override
  String get takeNewPhoto => 'Take a new photo';

  @override
  String get gallery => 'Gallery';

  @override
  String get chooseFromGallery => 'Choose from gallery';

  @override
  String get parcelAcceptedSuccessfully => 'Parcel accepted successfully';

  @override
  String get statusUpdatedSuccessfully => 'Status updated successfully';

  @override
  String get failedToLoadDashboard => 'Failed to load dashboard';

  @override
  String get pleaseSelectReturnReason => 'Please select a return reason';

  @override
  String get pleaseProvideSignature =>
      'Please provide courier signature for delivery';

  @override
  String get pleaseTakePhoto => 'Please take a photo for delivery confirmation';

  @override
  String get pleaseProvideNoteOrPhoto =>
      'Please provide either a note or take a photo';

  @override
  String get welcomeToProfile => 'Welcome to Profile';

  @override
  String get errorLoadingProfile => 'Error loading profile';

  @override
  String get personalInformation => 'Personal Information';

  @override
  String get email => 'Email';

  @override
  String get phone => 'Phone';

  @override
  String get address => 'Address';

  @override
  String get notProvided => 'Not provided';

  @override
  String get accountActions => 'Account Actions';

  @override
  String get deliveryStatistics => 'Delivery Statistics';

  @override
  String get inCourier => 'In Courier';

  @override
  String get returns => 'Returns';

  @override
  String get scanQRCode => 'Scan QR Code';

  @override
  String get scanQRDescription =>
      'Scan QR codes or barcodes to view parcel details';

  @override
  String get startScanning => 'Start Scanning';

  @override
  String get positionQRCode =>
      'Position the QR code or barcode within the frame to scan';

  @override
  String get invalidQRFormat => 'Invalid QR code format';

  @override
  String get acceptParcel => 'Accept Parcel';

  @override
  String get decline => 'Decline';

  @override
  String get logoutConfirmation =>
      'Are you sure you want to logout? You will need to sign in again.';

  @override
  String get logoutFailed => 'Logout failed';

  @override
  String get changeLanguage => 'Change Language';

  @override
  String get selectLanguage => 'Select Language';

  @override
  String get azerbaijani => 'Azerbaijani';

  @override
  String get english => 'English';

  @override
  String get russian => 'Russian';

  @override
  String get filterByRegion => 'Filter by Region';

  @override
  String get selectRegion => 'Select Region';

  @override
  String get allRegions => 'All Regions';

  @override
  String get noRegion => 'No Region';

  @override
  String get searchRegions => 'Search regions';

  @override
  String get noRegionsFound => 'No regions found';

  @override
  String get undeliveredParcel => 'Undelivered Parcel';

  @override
  String get reassignParcelToYourself =>
      'Do you want to assign this undelivered parcel to yourself again?';

  @override
  String get reassignParcel => 'Reassign Parcel';

  @override
  String get selectRegionDescription =>
      'Please select your region to continue to the warehouse';

  @override
  String get continueToWarehouse => 'Continue to Warehouse';

  @override
  String get accountInformation => 'Account Information';

  @override
  String get accountName => 'Account Name';

  @override
  String get accountBalance => 'Balance';

  @override
  String get accountType => 'Account Type';

  @override
  String get regionInfo => 'Region';

  @override
  String get accountId => 'Account ID';

  @override
  String get position => 'Position';

  @override
  String get cashierInfo => 'Cashier ID';

  @override
  String get country => 'Country';

  @override
  String get regionStatistics => 'Region Statistics';

  @override
  String get depotsCount => 'Depots Count';

  @override
  String get emptyPlaces => 'Empty Places';

  @override
  String get lmkShopInvoices => 'LMK Shop Invoices';

  @override
  String get courierWaits => 'Courier Waits';

  @override
  String get inDepot15Days => 'In Depot 15+ Days';

  @override
  String get enacted => 'Enacted';

  @override
  String get inDepot45Days => 'In Depot 45+ Days';

  @override
  String get accountDetails => 'Account Details';

  @override
  String get qr => 'QR';

  @override
  String get scanStorageBarcode => 'Scan Storage Barcode';

  @override
  String get scanInvoiceBarcode => 'Scan Invoice Barcode';

  @override
  String get storageFound => 'Storage Found';

  @override
  String get storageDetails => 'Storage Details';

  @override
  String get storageId => 'Storage ID';

  @override
  String get storageCapacity => 'Capacity';

  @override
  String get storageSize => 'Size';

  @override
  String get storageBox => 'Box';

  @override
  String get continueToInvoice => 'Continue to Invoice Scan';

  @override
  String get scanAgain => 'Scan Again';

  @override
  String get invoiceStored => 'Invoice Stored Successfully';

  @override
  String get backToStorage => 'Back to Storage Scan';

  @override
  String get scanNewStorage => 'Scan New Storage';

  @override
  String get positionCamera =>
      'Position the camera over the QR code or barcode';

  @override
  String get invalidBarcode => 'Invalid barcode format';

  @override
  String get storageNotFound => 'Storage location not found';

  @override
  String get invoiceNotFound => 'Invoice not found';

  @override
  String get packageSearch => 'Package Search';

  @override
  String get uniqid => 'Unique ID';

  @override
  String get fullname => 'Full Name';

  @override
  String get fin => 'FIN';

  @override
  String get purchaseNo => 'Purchase Number';

  @override
  String get searchPackages => 'Search Packages';

  @override
  String get packageDetails => 'Package Details';

  @override
  String get customerInfo => 'Customer Information';

  @override
  String get packageStock => 'Package Stock';

  @override
  String get contacts => 'Contacts';

  @override
  String get totalWeight => 'Total Weight';

  @override
  String get balance => 'Balance';

  @override
  String get birthdate => 'Birth Date';

  @override
  String get serialNumber => 'Serial Number';

  @override
  String get shopName => 'Shop Name';

  @override
  String get productType => 'Product Type';

  @override
  String get weight => 'Weight';

  @override
  String get price => 'Price';

  @override
  String get shippingPrice => 'Shipping Price';

  @override
  String get quantity => 'Quantity';

  @override
  String get status => 'Status';

  @override
  String get actionDate => 'Action Date';

  @override
  String get noPackagesFound => 'No packages found';

  @override
  String get searchHint => 'Enter at least one search parameter';
}
