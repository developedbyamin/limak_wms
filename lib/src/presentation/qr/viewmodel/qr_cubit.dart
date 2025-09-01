import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limak_courier/src/data/models/models.dart';
import 'package:limak_courier/src/data/service/service.dart';
import 'package:limak_courier/src/presentation/qr/viewmodel/qr_state.dart';
import 'package:limak_courier/src/presentation/region/viewmodel/region_cubit.dart';

class QrCubit extends Cubit<QrState> {
  final CourierService _courierService;
  final RegionCubit _regionCubit;
  Storage? _currentStorage;

  QrCubit({
    required CourierService courierService,
    required RegionCubit regionCubit,
  })  : _courierService = courierService,
        _regionCubit = regionCubit,
        super(QrInitial());

  void startScanning() {
    _currentStorage = null;
    emit(QrScanning());
  }

  Future<void> scanStorage(String barcodeId) async {
    emit(QrStorageLoading());
    
    try {
      final storageResponse = await _courierService.getStorage(barcodeId);
      
      if (!storageResponse.error && storageResponse.data != null) {
        _currentStorage = storageResponse.data!;
        emit(QrStorageFound(storage: _currentStorage!));
      } else {
        emit(QrStorageError(message: storageResponse.message ?? 'Storage not found'));
      }
    } catch (e) {
      emit(QrStorageError(message: e.toString()));
    }
  }

  void proceedToInvoiceScanning() {
    if (_currentStorage != null) {
      emit(QrInvoiceScanning(storage: _currentStorage!));
    }
  }

  Future<void> scanInvoice(String invoiceId) async {
    if (_currentStorage == null) {
      emit(QrStorageError(message: 'No storage selected'));
      return;
    }

    final selectedRegionId = _regionCubit.selectedRegionId;
    
    if (selectedRegionId == null) {
      emit(QrInvoiceError(
        storage: _currentStorage!,
        message: 'No region selected',
      ));
      return;
    }

    emit(QrInvoiceLoading(storage: _currentStorage!));
    
    try {
      final storeResponse = await _courierService.storeInDepot(
        selectedRegionId,
        _currentStorage!.barcodeId,
        invoiceId,
      );
      
      if (!storeResponse.error) {
        emit(QrInvoiceSuccess(
          storage: _currentStorage!,
          message: storeResponse.message,
        ));
      } else {
        emit(QrInvoiceError(
          storage: _currentStorage!,
          message: storeResponse.message,
        ));
      }
    } catch (e) {
      emit(QrInvoiceError(
        storage: _currentStorage!,
        message: e.toString(),
      ));
    }
  }

  void reset() {
    _currentStorage = null;
    emit(QrScanning());
  }

  void backToStorageScanning() {
    _currentStorage = null;
    emit(QrScanning());
  }
}