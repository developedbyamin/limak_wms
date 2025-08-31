import 'package:limak_courier/src/data/models/models.dart';

abstract class RegionState {
  const RegionState();
}

class RegionInitial extends RegionState {}

class RegionLoading extends RegionState {}

class RegionLoaded extends RegionState {
  final List<Region> regions;
  final Region? selectedRegion;

  const RegionLoaded({
    required this.regions,
    this.selectedRegion,
  });

  RegionLoaded copyWith({
    List<Region>? regions,
    Region? selectedRegion,
  }) {
    return RegionLoaded(
      regions: regions ?? this.regions,
      selectedRegion: selectedRegion ?? this.selectedRegion,
    );
  }
}

class RegionError extends RegionState {
  final String message;

  const RegionError({required this.message});
}
