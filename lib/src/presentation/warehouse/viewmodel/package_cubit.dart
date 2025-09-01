import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limak_courier/src/data/service/service.dart';
import 'package:limak_courier/src/presentation/region/viewmodel/region_cubit.dart';
import 'package:limak_courier/src/presentation/warehouse/viewmodel/package_state.dart';

class PackageCubit extends Cubit<PackageState> {
  final CourierService _courierService;
  final RegionCubit _regionCubit;

  PackageCubit({
    required CourierService courierService,
    required RegionCubit regionCubit,
  })  : _courierService = courierService,
        _regionCubit = regionCubit,
        super(PackageInitial());

  Future<void> searchPackages({
    String? uniqid,
    String? fullname,
    String? fin,
    String? purchaseNo,
  }) async {
    final selectedRegionId = _regionCubit.selectedRegionId;
    
    if (selectedRegionId == null) {
      emit(PackageError(message: 'No region selected'));
      return;
    }

    // Check if at least one search parameter is provided
    if ((uniqid?.isEmpty ?? true) && 
        (fullname?.isEmpty ?? true) && 
        (fin?.isEmpty ?? true) && 
        (purchaseNo?.isEmpty ?? true)) {
      emit(PackageError(message: 'Please provide at least one search parameter'));
      return;
    }

    emit(PackageLoading());
    
    try {
      final packageResponse = await _courierService.getPackages(
        regionId: selectedRegionId,
        uniqid: uniqid,
        fullname: fullname,
        fin: fin,
        purchaseNo: purchaseNo,
      );
      
      if (!packageResponse.error && packageResponse.data != null) {
        emit(PackageLoaded(packageData: packageResponse.data!));
      } else {
        emit(PackageError(message: packageResponse.message ?? 'Package not found'));
      }
    } catch (e) {
      emit(PackageError(message: e.toString()));
    }
  }

  void reset() {
    emit(PackageInitial());
  }
}
