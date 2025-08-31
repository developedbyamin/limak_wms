import 'package:limak_courier/src/data/models/models.dart';

abstract class ProfileState {
  const ProfileState();
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileLoaded extends ProfileState {
  final Account account;
  final RegionDetails? regionDetails;

  const ProfileLoaded({
    required this.account,
    this.regionDetails,
  });

  ProfileLoaded copyWith({
    Account? account,
    RegionDetails? regionDetails,
  }) {
    return ProfileLoaded(
      account: account ?? this.account,
      regionDetails: regionDetails ?? this.regionDetails,
    );
  }
}

class ProfileError extends ProfileState {
  final String message;

  const ProfileError({required this.message});
}
