import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:limak_courier/src/data/models/models.dart';
import 'package:limak_courier/src/data/service/service.dart';
import 'package:limak_courier/src/presentation/profile/viewmodel/profile_state.dart';
import 'package:limak_courier/src/presentation/region/viewmodel/region_cubit.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final CourierService _courierService;
  final RegionCubit _regionCubit;

  ProfileCubit({
    required CourierService courierService,
    required RegionCubit regionCubit,
  })  : _courierService = courierService,
        _regionCubit = regionCubit,
        super(ProfileInitial());

  Future<void> fetchAccount() async {
    final selectedRegionId = _regionCubit.selectedRegionId;
    
    if (selectedRegionId == null) {
      emit(const ProfileError(message: 'No region selected'));
      return;
    }

    emit(ProfileLoading());
    
    try {
      // Fetch both account and region details in parallel
      final results = await Future.wait([
        _courierService.getAccount(selectedRegionId),
        _courierService.getRegionDetails(selectedRegionId),
      ]);
      
      final accountResponse = results[0] as AccountResponse;
      final regionDetailsResponse = results[1] as RegionDetailsResponse;
      
      if (!accountResponse.error && !regionDetailsResponse.error) {
        emit(ProfileLoaded(
          account: accountResponse.data,
          regionDetails: regionDetailsResponse.data,
        ));
      } else {
        emit(const ProfileError(message: 'Failed to load profile information'));
      }
    } catch (e) {
      emit(ProfileError(message: e.toString()));
    }
  }

  void refresh() {
    fetchAccount();
  }
}
