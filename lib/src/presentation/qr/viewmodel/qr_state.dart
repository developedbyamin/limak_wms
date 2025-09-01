import 'package:limak_courier/src/data/models/models.dart';

abstract class QrState {
  const QrState();
}

class QrInitial extends QrState {}

class QrScanning extends QrState {}

class QrStorageLoading extends QrState {}

class QrStorageFound extends QrState {
  final Storage storage;

  const QrStorageFound({required this.storage});
}

class QrStorageError extends QrState {
  final String message;

  const QrStorageError({required this.message});
}

class QrInvoiceScanning extends QrState {
  final Storage storage;

  const QrInvoiceScanning({required this.storage});
}

class QrInvoiceLoading extends QrState {
  final Storage storage;

  const QrInvoiceLoading({required this.storage});
}

class QrInvoiceSuccess extends QrState {
  final Storage storage;
  final String message;

  const QrInvoiceSuccess({
    required this.storage,
    required this.message,
  });
}

class QrInvoiceError extends QrState {
  final Storage storage;
  final String message;

  const QrInvoiceError({
    required this.storage,
    required this.message,
  });
}
