import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limak_courier/src/data/models/models.dart';
import 'package:limak_courier/src/data/service/service.dart';
import 'package:limak_courier/src/presentation/region/viewmodel/region_state.dart';

class RegionCubit extends Cubit<RegionState> {
  final CourierService _courierService;

  RegionCubit({required CourierService courierService})
      : _courierService = courierService,
        super(RegionInitial());

  Future<void> fetchRegions() async {
    emit(RegionLoading());
    
    try {
      final regionsResponse = await _courierService.getRegions();
      
      if (!regionsResponse.error && regionsResponse.regions.isNotEmpty) {
        emit(RegionLoaded(regions: regionsResponse.regions));
      } else {
        emit(const RegionError(message: 'No regions available'));
      }
    } catch (e) {
      emit(RegionError(message: e.toString()));
    }
  }

  void selectRegion(Region region) {
    final currentState = state;
    if (currentState is RegionLoaded) {
      emit(currentState.copyWith(selectedRegion: region));
    }
  }

  Region? get selectedRegion {
    final currentState = state;
    if (currentState is RegionLoaded) {
      return currentState.selectedRegion;
    }
    return null;
  }

  int? get selectedRegionId {
    return selectedRegion?.id;
  }

  void clearSelection() {
    final currentState = state;
    if (currentState is RegionLoaded) {
      emit(currentState.copyWith(selectedRegion: null));
    }
  }

  // Get selected region name from cubit state
  String? get selectedRegionName {
    return selectedRegion?.name;
  }
}
