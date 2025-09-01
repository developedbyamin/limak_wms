import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:limak_courier/core/config/constants/app_colors.dart';
import 'package:limak_courier/core/l10n/app_localizations.dart';
import 'package:limak_courier/core/router/routes.dart';
import 'package:limak_courier/core/utils/helpers/overlay_helper.dart';
import 'package:limak_courier/service_locator.dart';
import 'package:limak_courier/src/data/service/service.dart';
import 'package:limak_courier/src/presentation/region/viewmodel/region_cubit.dart';
import 'package:limak_courier/src/presentation/warehouse/viewmodel/package_cubit.dart';
import 'package:limak_courier/src/presentation/warehouse/viewmodel/package_state.dart';

class WarehouseView extends StatelessWidget {
  const WarehouseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PackageCubit(
        courierService: getIt<CourierService>(),
        regionCubit: context.read<RegionCubit>(),
      ),
      child: const _WarehouseViewContent(),
    );
  }
}

class _WarehouseViewContent extends StatefulWidget {
  const _WarehouseViewContent();

  @override
  State<_WarehouseViewContent> createState() => _WarehouseViewContentState();
}

class _WarehouseViewContentState extends State<_WarehouseViewContent> {
  final _formKey = GlobalKey<FormState>();
  final _uniqidController = TextEditingController();
  final _fullnameController = TextEditingController();
  final _finController = TextEditingController();
  final _purchaseNoController = TextEditingController();

  @override
  void dispose() {
    _uniqidController.dispose();
    _fullnameController.dispose();
    _finController.dispose();
    _purchaseNoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          l10n.packageSearch,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: BlocConsumer<PackageCubit, PackageState>(
        listener: (context, state) {
          if (state is PackageError) {
            OverlayHelper.showError(context, state.message);
          } else if (state is PackageLoaded) {
            // Clear text fields on success
            _clearTextFields();
            // Navigate to package detail view
            context.push('/package-detail', extra: state.packageData);
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Search Form Card
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.packageSearch,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[800],
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          l10n.searchHint,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 24),
                        
                        // Unique ID Field
                        _buildTextField(
                          controller: _uniqidController,
                          label: l10n.uniqid,
                          icon: Icons.fingerprint,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 16),
                        
                        // Full Name Field
                        _buildTextField(
                          controller: _fullnameController,
                          label: l10n.fullname,
                          icon: Icons.person,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 16),
                        
                        // FIN Field
                        _buildTextField(
                          controller: _finController,
                          label: l10n.fin,
                          icon: Icons.credit_card,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 16),
                        
                        // Purchase Number Field
                        _buildTextField(
                          controller: _purchaseNoController,
                          label: l10n.purchaseNo,
                          icon: Icons.receipt,
                          keyboardType: TextInputType.text,
                        ),
                        const SizedBox(height: 24),
                        
                        // Search Button
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: state is PackageLoading ? null : _searchPackages,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryColor,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              elevation: 2,
                            ),
                            child: state is PackageLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                                    ),
                                  )
                                : Text(
                                    l10n.searchPackages,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Instructions Card
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.blue[50],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.blue[200]!),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blue[700],
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            l10n.searchHint,
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.blue[700],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon, color: AppColors.primaryColor),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey[300]!),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: AppColors.primaryColor, width: 2),
        ),
        filled: true,
        fillColor: Colors.grey[50],
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
    );
  }

  void _searchPackages() {
    // Hide keyboard
    FocusScope.of(context).unfocus();
    
    final uniqid = _uniqidController.text.trim();
    final fullname = _fullnameController.text.trim();
    final fin = _finController.text.trim();
    final purchaseNo = _purchaseNoController.text.trim();

    context.read<PackageCubit>().searchPackages(
      uniqid: uniqid.isEmpty ? null : uniqid,
      fullname: fullname.isEmpty ? null : fullname,
      fin: fin.isEmpty ? null : fin,
      purchaseNo: purchaseNo.isEmpty ? null : purchaseNo,
    );
  }

  void _clearTextFields() {
    _uniqidController.clear();
    _fullnameController.clear();
    _finController.clear();
    _purchaseNoController.clear();
  }
}