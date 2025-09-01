import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:limak_courier/core/config/constants/app_colors.dart';
import 'package:limak_courier/core/l10n/app_localizations.dart';
import 'package:limak_courier/core/utils/helpers/overlay_helper.dart';
import 'package:limak_courier/service_locator.dart';
import 'package:limak_courier/src/data/models/models.dart';
import 'package:limak_courier/src/data/service/service.dart';
import 'package:limak_courier/src/presentation/region/viewmodel/region_cubit.dart';
import 'dart:io';

class PackageDetailView extends StatefulWidget {
  final PackageData packageData;

  const PackageDetailView({
    super.key,
    required this.packageData,
  });

  @override
  State<PackageDetailView> createState() => _PackageDetailViewState();
}

class _PackageDetailViewState extends State<PackageDetailView> {
  final Set<String> _selectedInvoiceIds = <String>{};
  File? _selectedImage;
  final ImagePicker _imagePicker = ImagePicker();
  bool _isDelivering = false;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          l10n.packageDetails,
          style: TextStyle(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: AppColors.primaryColor),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Customer Information Card
            _buildSectionCard(
              title: l10n.customerInfo,
              icon: Icons.person,
              child: Column(
                children: [
                  _buildInfoRow(l10n.fullname, '${widget.packageData.name} ${widget.packageData.surname}', Icons.person),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.uniqid, widget.packageData.uniqid, Icons.fingerprint),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.serialNumber, widget.packageData.serialNumber, Icons.confirmation_number),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.email, widget.packageData.email, Icons.email),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.address, widget.packageData.address, Icons.location_on),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.birthdate, widget.packageData.birthdate, Icons.cake),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.balance, '${widget.packageData.balance} AZN', Icons.account_balance_wallet),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Contacts Card
            if (widget.packageData.userContacts.isNotEmpty)
              _buildSectionCard(
                title: l10n.contacts,
                icon: Icons.phone,
                child: Column(
                  children: widget.packageData.userContacts.map((contact) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: _buildInfoRow('', contact.name, Icons.phone),
                    );
                  }).toList(),
                ),
              ),
            
            const SizedBox(height: 16),
            
            // Package Stock Summary Card
            _buildSectionCard(
              title: l10n.packageStock,
              icon: Icons.inventory,
              child: Column(
                children: [
                  _buildInfoRow(l10n.totalWeight, '${widget.packageData.allWeight.toStringAsFixed(2)} kg', Icons.scale),
                  const Divider(height: 20),
                  _buildInfoRow('${l10n.quantity}:', '${widget.packageData.stock.length} ${l10n.packageStock.toLowerCase()}', Icons.inventory_2),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Select All/Deselect All Controls
            _buildSelectionControls(l10n),
            
            const SizedBox(height: 16),
            
            // Stock Items with checkboxes
            ...widget.packageData.stock.map((stock) => _buildStockCard(stock, l10n)).toList(),
            
            const SizedBox(height: 16),
            
            // Image Selection Card
            _buildImageSelectionCard(l10n),
            
            const SizedBox(height: 16),
            
            // Deliver Button
            _buildDeliverButton(l10n),
            
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSelectionControls(AppLocalizations l10n) {
    final allSelected = _selectedInvoiceIds.length == widget.packageData.stock.length;
    
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${l10n.selectedPackages}: ${_selectedInvoiceIds.length}',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey[800],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                if (allSelected) {
                  _selectedInvoiceIds.clear();
                } else {
                  _selectedInvoiceIds.clear();
                  _selectedInvoiceIds.addAll(
                    widget.packageData.stock.map((stock) => stock.purchaseNo),
                  );
                }
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: allSelected ? Colors.grey[300] : AppColors.primaryColor,
              foregroundColor: allSelected ? Colors.grey[700] : Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              allSelected ? l10n.deselectAll : l10n.selectAll,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildImageSelectionCard(AppLocalizations l10n) {
    return Container(
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
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: AppColors.primaryColor,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                l10n.proveImage,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          
          if (_selectedImage != null) ...[
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _selectedImage!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      height: double.infinity,
                    ),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedImage = null;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Icon(
                          Icons.close,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),
          ],
          
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.camera),
                  icon: const Icon(Icons.camera_alt),
                  label: Text(l10n.takePhoto),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () => _pickImage(ImageSource.gallery),
                  icon: const Icon(Icons.photo_library),
                  label: Text(l10n.chooseFromGallery),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDeliverButton(AppLocalizations l10n) {
    return Container(
      width: double.infinity,
      height: 56,
      child: ElevatedButton(
        onPressed: _isDelivering ? null : _deliverPackages,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          elevation: 2,
        ),
        child: _isDelivering
            ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                l10n.deliverPackages,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
      ),
    );
  }

  Widget _buildSectionCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
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
          Row(
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
              const SizedBox(width: 12),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildStockCard(PackageStock stock, AppLocalizations l10n) {
    final isSelected = _selectedInvoiceIds.contains(stock.purchaseNo);
    
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedInvoiceIds.remove(stock.purchaseNo);
          } else {
            _selectedInvoiceIds.add(stock.purchaseNo);
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.grey[200]!,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Header with Checkbox, Purchase Number and Shop
          Row(
            children: [
              Checkbox(
                value: isSelected,
                onChanged: (bool? value) {
                  setState(() {
                    if (value == true) {
                      _selectedInvoiceIds.add(stock.purchaseNo);
                    } else {
                      _selectedInvoiceIds.remove(stock.purchaseNo);
                    }
                  });
                },
                activeColor: AppColors.primaryColor,
                side: BorderSide(
                  color: isSelected ? AppColors.primaryColor : Colors.grey[400]!,
                  width: 2,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Expanded(
                child: Text(
                  stock.purchaseNo,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: isSelected ? AppColors.primaryColor : Colors.grey[800],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.blue[50],
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  stock.shopName,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          
          // Product Details
          _buildStockInfoRow(l10n.productType, stock.productTypeName, Icons.category),
          const SizedBox(height: 8),
          _buildStockInfoRow(l10n.weight, '${stock.weight} kg', Icons.scale),
          const SizedBox(height: 8),
          _buildStockInfoRow(l10n.price, '\$${stock.price}', Icons.attach_money),
          const SizedBox(height: 8),
          _buildStockInfoRow(l10n.shippingPrice, '\$${stock.shippingPrice}', Icons.local_shipping),
          const SizedBox(height: 8),
          _buildStockInfoRow('${l10n.status}', stock.statusName.toString(), Icons.info),
          const SizedBox(height: 8),
          _buildStockInfoRow('Depot', _getDepotInfo(stock), Icons.warehouse),
          const SizedBox(height: 8),
          _buildStockInfoRow(l10n.actionDate, stock.actionDate, Icons.schedule),
        ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(6),
          ),
          child: Icon(
            icon,
            size: 16,
            color: AppColors.primaryColor,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (label.isNotEmpty)
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w500,
                  ),
                ),
              if (label.isNotEmpty) const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
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

  Widget _buildStockInfoRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16,
          color: Colors.grey[600],
        ),
        const SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 13,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey[800],
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  String _getDepotInfo(PackageStock stock) {
    if (stock.depotId != null && stock.index != null && stock.number != null && stock.barcodeId != null) {
      return '${stock.index}${stock.number} (${stock.barcodeId})';
    } else if (stock.depotId != null) {
      return 'Depot ID: ${stock.depotId}';
    } else {
      return 'Not assigned';
    }
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: source,
        maxWidth: 1024,
        maxHeight: 1024,
        imageQuality: 80,
      );
      
      if (image != null) {
        setState(() {
          _selectedImage = File(image.path);
        });
      }
    } catch (e) {
      OverlayHelper.showError(context, 'Failed to pick image: $e');
    }
  }

  Future<void> _deliverPackages() async {
    final l10n = AppLocalizations.of(context)!;
    
    // Validation
    if (_selectedInvoiceIds.isEmpty) {
      OverlayHelper.showError(context, l10n.packagesRequired);
      return;
    }
    
    if (_selectedImage == null) {
      OverlayHelper.showError(context, l10n.imageRequired);
      return;
    }

    final regionId = context.read<RegionCubit>().selectedRegionId;
    if (regionId == null) {
      OverlayHelper.showError(context, 'No region selected');
      return;
    }

    setState(() {
      _isDelivering = true;
    });

    try {
      final courierService = getIt<CourierService>();
      final response = await courierService.deliverPackages(
        regionId: regionId,
        invoiceIds: _selectedInvoiceIds.toList(),
        proveImage: _selectedImage!,
      );

      if (!response.error && response.data.isEmpty) {
        // Success case - empty data array means success
        OverlayHelper.showSuccess(context, l10n.deliverySuccess);
        // Navigate back
        if (mounted) {
          context.pop();
        }
      } else {
        // Error case - show error messages
        final errorMessages = response.data
            .where((result) => result.error)
            .map((result) => result.message ?? 'Unknown error')
            .join('\n');
        
        if (errorMessages.isNotEmpty) {
          OverlayHelper.showError(context, errorMessages);
        } else {
          OverlayHelper.showError(context, l10n.deliveryFailed);
        }
      }
    } catch (e) {
      OverlayHelper.showError(context, '${l10n.deliveryFailed}: $e');
    } finally {
      if (mounted) {
        setState(() {
          _isDelivering = false;
        });
      }
    }
  }
}
