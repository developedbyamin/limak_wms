import 'package:limak_courier/src/data/models/models.dart';

abstract class PackageState {
  const PackageState();
}

class PackageInitial extends PackageState {}

class PackageLoading extends PackageState {}

class PackageLoaded extends PackageState {
  final PackageData packageData;

  const PackageLoaded({required this.packageData});
}

class PackageError extends PackageState {
  final String message;

  const PackageError({required this.message});
}
