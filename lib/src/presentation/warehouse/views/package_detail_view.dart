import 'package:flutter/material.dart';
import 'package:limak_courier/core/config/constants/app_colors.dart';
import 'package:limak_courier/core/l10n/app_localizations.dart';
import 'package:limak_courier/src/data/models/models.dart';

class PackageDetailView extends StatelessWidget {
  final PackageData packageData;

  const PackageDetailView({
    super.key,
    required this.packageData,
  });

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
                  _buildInfoRow(l10n.fullname, '${packageData.name} ${packageData.surname}', Icons.person),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.uniqid, packageData.uniqid, Icons.fingerprint),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.serialNumber, packageData.serialNumber, Icons.confirmation_number),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.email, packageData.email, Icons.email),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.address, packageData.address, Icons.location_on),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.birthdate, packageData.birthdate, Icons.cake),
                  const Divider(height: 20),
                  _buildInfoRow(l10n.balance, '${packageData.balance} AZN', Icons.account_balance_wallet),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Contacts Card
            if (packageData.userContacts.isNotEmpty)
              _buildSectionCard(
                title: l10n.contacts,
                icon: Icons.phone,
                child: Column(
                  children: packageData.userContacts.map((contact) {
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
                  _buildInfoRow(l10n.totalWeight, '${packageData.allWeight.toStringAsFixed(2)} kg', Icons.scale),
                  const Divider(height: 20),
                  _buildInfoRow('${l10n.quantity}:', '${packageData.stock.length} ${l10n.packageStock.toLowerCase()}', Icons.inventory_2),
                ],
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Stock Items
            ...packageData.stock.map((stock) => _buildStockCard(stock, l10n)).toList(),
          ],
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
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with Purchase Number and Shop
          Row(
            children: [
              Expanded(
                child: Text(
                  stock.purchaseNo,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
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
          _buildStockInfoRow('${l10n.status} ID', stock.statusId.toString(), Icons.info),
          const SizedBox(height: 8),
          _buildStockInfoRow('Depot', '${stock.index}${stock.number} (${stock.barcodeId})', Icons.warehouse),
          const SizedBox(height: 8),
          _buildStockInfoRow(l10n.actionDate, stock.actionDate, Icons.schedule),
        ],
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
}
