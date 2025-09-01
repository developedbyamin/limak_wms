import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:limak_courier/core/config/constants/app_colors.dart';
import 'package:limak_courier/core/l10n/app_localizations.dart';
import 'package:limak_courier/core/utils/helpers/overlay_helper.dart';
import 'package:limak_courier/service_locator.dart';
import 'package:limak_courier/src/data/models/models.dart';
import 'package:limak_courier/src/data/service/service.dart';
import 'package:limak_courier/src/presentation/qr/viewmodel/qr_cubit.dart';
import 'package:limak_courier/src/presentation/qr/viewmodel/qr_state.dart';
import 'package:limak_courier/src/presentation/region/viewmodel/region_cubit.dart';

class QrView extends StatelessWidget {
  const QrView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QrCubit(
        courierService: getIt<CourierService>(),
        regionCubit: context.read<RegionCubit>(),
      )..startScanning(),
      child: const _QrViewContent(),
    );
  }
}

class _QrViewContent extends StatefulWidget {
  const _QrViewContent();

  @override
  State<_QrViewContent> createState() => _QrViewContentState();
}

class _QrViewContentState extends State<_QrViewContent> {
  MobileScannerController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = MobileScannerController();
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          l10n.qrScanner,
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
        actions: [
          IconButton(
            onPressed: () => context.read<QrCubit>().reset(),
            icon: Icon(Icons.refresh, color: AppColors.primaryColor),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Camera Scanner - ALWAYS ACTIVE
          MobileScanner(
            controller: _controller,
            onDetect: (BarcodeCapture capture) {
              final List<Barcode> barcodes = capture.barcodes;
              if (barcodes.isNotEmpty) {
                final String? code = barcodes.first.rawValue;
                if (code != null && code.isNotEmpty) {
                  final state = context.read<QrCubit>().state;
                  if (state is QrScanning) {
                    context.read<QrCubit>().scanStorage(code);
                  } else if (state is QrInvoiceScanning) {
                    context.read<QrCubit>().scanInvoice(code);
                  }
                }
              }
            },
          ),
          
          // UI Overlays
          BlocConsumer<QrCubit, QrState>(
            listener: (context, state) {
              if (state is QrStorageError) {
                OverlayHelper.showError(context, state.message);
                // Auto return to scanning after error
                Future.delayed(const Duration(seconds: 2), () {
                  if (mounted) {
                    context.read<QrCubit>().startScanning();
                  }
                });
              } else if (state is QrInvoiceError) {
                OverlayHelper.showError(context, state.message);
                // Auto return to invoice scanning after error
                Future.delayed(const Duration(seconds: 2), () {
                  if (mounted) {
                    context.read<QrCubit>().proceedToInvoiceScanning();
                  }
                });
              } else if (state is QrInvoiceSuccess) {
                OverlayHelper.showSuccess(context, state.message);
              }
            },
            builder: (context, state) {
              // Step 1: Storage Scanning
              if (state is QrScanning || state is QrStorageError) {
                return _buildScanningOverlay(
                  context, 
                  l10n.scanStorageBarcode, 
                  l10n.positionCamera,
                  l10n,
                );
              }
              
              // Step 1: Storage Loading
              if (state is QrStorageLoading) {
                return _buildLoadingView(context, l10n);
              }
              
              // Step 2: Storage Found - Show Details
              if (state is QrStorageFound) {
                return _buildStorageFoundView(context, state.storage, l10n);
              }
              
              // Step 3: Invoice Scanning
              if (state is QrInvoiceScanning || state is QrInvoiceError) {
                return _buildScanningOverlay(
                  context, 
                  l10n.scanInvoiceBarcode, 
                  l10n.positionCamera,
                  l10n,
                  showBackButton: false,
                );
              }
              
              // Step 3: Invoice Loading
              if (state is QrInvoiceLoading) {
                return _buildLoadingView(context, l10n);
              }
              
              // Step 4: Success
              if (state is QrInvoiceSuccess) {
                return _buildSuccessView(context, state.storage, state.message, l10n);
              }
              
              // Default: Initial state
              return _buildScanningOverlay(
                context, 
                l10n.scanStorageBarcode, 
                l10n.positionCamera,
                l10n,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildScanningOverlay(
    BuildContext context, 
    String title, 
    String subtitle, 
    AppLocalizations l10n, {
    bool showBackButton = false,
  }) {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Column(
        children: [
          const Spacer(),
          // Scanning Frame with red corners
          Container(
            width: 250,
            height: 250,
            child: Stack(
              children: [
                // Corner indicators
                ...List.generate(4, (index) {
                  return Positioned(
                    top: index < 2 ? 0 : null,
                    bottom: index >= 2 ? 0 : null,
                    left: index % 2 == 0 ? 0 : null,
                    right: index % 2 == 1 ? 0 : null,
                    child: Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        border: Border(
                          top: index < 2 ? BorderSide(color: Colors.red, width: 4) : BorderSide.none,
                          bottom: index >= 2 ? BorderSide(color: Colors.red, width: 4) : BorderSide.none,
                          left: index % 2 == 0 ? BorderSide(color: Colors.red, width: 4) : BorderSide.none,
                          right: index % 2 == 1 ? BorderSide(color: Colors.red, width: 4) : BorderSide.none,
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
          const SizedBox(height: 32),
          // Instructions
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 32),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Icon(
                  Icons.qr_code_scanner,
                  size: 48,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(height: 16),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          const Spacer(),
          // Back button for invoice scanning
          if (showBackButton)
            Padding(
              padding: const EdgeInsets.all(16),
              child: ElevatedButton(
                onPressed: () => context.read<QrCubit>().backToStorageScanning(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: AppColors.primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  l10n.backToStorage,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildLoadingView(BuildContext context, AppLocalizations l10n) {
    return Container(
      color: Colors.grey[50],
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
              strokeWidth: 3,
            ),
            const SizedBox(height: 24),
            Text(
              l10n.loading,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorageFoundView(BuildContext context, Storage storage, AppLocalizations l10n) {
    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Success Header
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24.0),
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
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        size: 48,
                        color: Colors.green[600],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      l10n.storageFound,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      storage.barcodeId,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 24),
              
              // Storage Details
              Container(
                width: double.infinity,
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
                      l10n.storageDetails,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const SizedBox(height: 16),
                    _buildStorageInfoRow(l10n.storageId, storage.id.toString(), Icons.inventory),
                    const Divider(height: 24),
                    _buildStorageInfoRow(l10n.storageCapacity, storage.capacity.toUpperCase(), Icons.straighten),
                    const Divider(height: 24),
                    _buildStorageInfoRow(l10n.storageSize, storage.size.toString(), Icons.photo_size_select_small),
                    const Divider(height: 24),
                    _buildStorageInfoRow(l10n.storageBox, storage.box.toString(), Icons.inventory_2),
                  ],
                ),
              ),
              
              const Spacer(),
              
              // Action Buttons
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => context.read<QrCubit>().backToStorageScanning(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey[200],
                        foregroundColor: Colors.grey[700],
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        l10n.scanAgain,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () => context.read<QrCubit>().proceedToInvoiceScanning(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        l10n.continueToInvoice,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSuccessView(BuildContext context, Storage storage, String message, AppLocalizations l10n) {
    return Container(
      color: Colors.grey[50],
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(32.0),
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
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.green[50],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.check_circle,
                        size: 64,
                        color: Colors.green[600],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      l10n.invoiceStored,
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      message,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      storage.barcodeId,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              
              const SizedBox(height: 32),
              
              ElevatedButton(
                onPressed: () => context.read<QrCubit>().reset(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  l10n.scanNewStorage,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStorageInfoRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(
            icon,
            size: 20,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }


}