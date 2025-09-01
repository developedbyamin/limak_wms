import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:go_router/go_router.dart';
import 'package:limak_courier/core/config/constants/app_colors.dart';
import 'package:limak_courier/core/l10n/app_localizations.dart';
import 'package:limak_courier/core/l10n/localization_cubit.dart';
import 'package:limak_courier/core/router/routes.dart';
import 'package:limak_courier/core/utils/storage/secure_storage.dart';
import 'package:limak_courier/service_locator.dart';
import 'package:limak_courier/src/data/models/models.dart';
import 'package:limak_courier/src/data/service/service.dart';
import 'package:limak_courier/src/presentation/profile/viewmodel/profile_cubit.dart';
import 'package:limak_courier/src/presentation/profile/viewmodel/profile_state.dart';
import 'package:limak_courier/src/presentation/region/viewmodel/region_cubit.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        courierService: getIt<CourierService>(),
        regionCubit: context.read<RegionCubit>(),
      )..fetchAccount(),
      child: const _ProfileViewContent(),
    );
  }
}

class _ProfileViewContent extends StatefulWidget {
  const _ProfileViewContent();

  @override
  State<_ProfileViewContent> createState() => _ProfileViewContentState();
}

class _ProfileViewContentState extends State<_ProfileViewContent>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: Text(
          l10n.profile,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
        elevation: 0,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => context.read<ProfileCubit>().refresh(),
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
          PopupMenuButton<Locale>(
            icon: const Icon(Icons.language, color: Colors.white),
            onSelected: (Locale locale) {
              context.read<LocalizationCubit>().changeLocale(locale);
            },
            itemBuilder: (BuildContext context) {
              final l10n = AppLocalizations.of(context)!;
              return [
                PopupMenuItem<Locale>(
                  value: const Locale('en'),
                  child: Row(
                    children: [
                      const Text('🇺🇸', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 12),
                      Text(
                        l10n.english,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<Locale>(
                  value: const Locale('az'),
                  child: Row(
                    children: [
                      const Text('🇦🇿', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 12),
                      Text(
                        l10n.azerbaijani,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                PopupMenuItem<Locale>(
                  value: const Locale('ru'),
                  child: Row(
                    children: [
                      const Text('🇷🇺', style: TextStyle(fontSize: 20)),
                      const SizedBox(width: 12),
                      Text(
                        l10n.russian,
                        style: const TextStyle(fontSize: 16, color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ];
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            color: Colors.white,
            elevation: 8,
            offset: const Offset(0, 8),
          ),
          IconButton(
            onPressed: () => _showLogoutDialog(context),
            icon: const Icon(Icons.logout, color: Colors.white),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Container(
            color: AppColors.primaryColor,
            child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              indicatorWeight: 3,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              labelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
              tabs: [
                Tab(
                  icon: Icon(Icons.account_circle, size: 24),
                  text: l10n.accountInformation,
                ),
                Tab(
                  icon: Icon(Icons.analytics, size: 24),
                  text: l10n.regionStatistics,
                ),
              ],
            ),
          ),
        ),
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                      AppColors.primaryColor,
                    ),
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
            );
          }

          if (state is ProfileError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.red[50],
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.error_outline,
                        size: 48,
                        color: Colors.red[400],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      state.message,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[700],
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    ElevatedButton(
                      onPressed: () => context.read<ProfileCubit>().refresh(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primaryColor,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        l10n.retry,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          if (state is ProfileLoaded) {
            final account = state.account;
            final regionDetails = state.regionDetails;

            return Column(
              children: [
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      // Account Details Tab
                      _buildAccountTab(account, l10n),
                      // Region Statistics Tab
                      _buildRegionStatisticsTab(regionDetails, l10n),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildAccountTab(Account account, AppLocalizations l10n) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Account Information Header
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
                Icon(
                  Icons.account_circle,
                  size: 64,
                  color: AppColors.primaryColor,
                ),
                const SizedBox(height: 16),
                Text(
                  account.name,
                  style: TextStyle(
                    fontSize: 20,
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Balance Information
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(20.0),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.primaryColor,
                  AppColors.primaryColor.withOpacity(0.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryColor.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  l10n.accountBalance,
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  '${account.balance} ${account.currency}',
                  style: const TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (account.balanceTry != '0.00')
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      '${account.balanceTry} TRY',
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Account Details
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
                  l10n.accountDetails,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 16),
                _buildInfoRow(
                  l10n.accountType,
                  account.accountType.toUpperCase(),
                  Icons.account_balance_wallet,
                ),     
                const Divider(height: 24),
                _buildInfoRow(
                  l10n.regionInfo,
                  context.read<RegionCubit>().selectedRegionName ?? account.regionId.toString(),
                  Icons.location_on,
                ),
                const Divider(height: 24),
                _buildInfoRow(l10n.country, account.toCountry, Icons.flag),
                if (account.cashierId > 0) ...[
                  const Divider(height: 24),
                  _buildInfoRow(
                    l10n.cashierInfo,
                    account.cashierId.toString(),
                    Icons.person,
                  ),
                ],
              ],
            ),
          ),

          // Add bottom padding for better scrolling experience
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildRegionStatisticsTab(
    RegionDetails? regionDetails,
    AppLocalizations l10n,
  ) {
    if (regionDetails == null) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.analytics_outlined, size: 64, color: Colors.grey[400]),
              const SizedBox(height: 16),
              Text(
                'No region statistics available',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Region Statistics Header
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
                Icon(Icons.analytics, size: 64, color: AppColors.primaryColor),
                const SizedBox(height: 16),
                Text(
                  l10n.regionStatistics,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Statistics Grid
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
            child: _buildStatisticGrid(regionDetails, l10n),
          ),

          // Add bottom padding for better scrolling experience
          const SizedBox(height: 24),
        ],
      ),
    );
  }

  Widget _buildStatisticGrid(
    RegionDetails regionDetails,
    AppLocalizations l10n,
  ) {
    final statistics = [
      _StatisticItem(
        l10n.depotsCount,
        regionDetails.depotsCount.toString(),
        Icons.store,
        Colors.blue,
      ),
      _StatisticItem(
        l10n.emptyPlaces,
        regionDetails.emptyPlaces.toString(),
        Icons.inventory_2,
        Colors.orange,
      ),
      _StatisticItem(
        l10n.lmkShopInvoices,
        regionDetails.lmkShopInvoices.toString(),
        Icons.receipt,
        Colors.green,
      ),
      _StatisticItem(
        l10n.courierWaits,
        regionDetails.courierWaits.toString(),
        Icons.access_time,
        Colors.red,
      ),
      _StatisticItem(
        l10n.inDepot15Days,
        regionDetails.inDepot15Days.toString(),
        Icons.schedule,
        Colors.purple,
      ),
      _StatisticItem(
        l10n.enacted,
        regionDetails.enacted.toString(),
        Icons.check_circle,
        Colors.teal,
      ),
      _StatisticItem(
        l10n.inDepot45Days,
        regionDetails.inDepot45Days.toString(),
        Icons.warning,
        Colors.amber,
      ),
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 1.2,
      ),
      itemCount: statistics.length,
      itemBuilder: (context, index) {
        final stat = statistics[index];
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: stat.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: stat.color.withOpacity(0.3), width: 1),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(stat.icon, color: stat.color, size: 28),
              const SizedBox(height: 8),
              Text(
                stat.value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: stat.color,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                stat.label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value, IconData icon) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColors.primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, size: 20, color: AppColors.primaryColor),
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

class _StatisticItem {
  final String label;
  final String value;
  final IconData icon;
  final Color color;

  _StatisticItem(this.label, this.value, this.icon, this.color);
}

// Logout functionality methods
void _showLogoutDialog(BuildContext context) {
  final l10n = AppLocalizations.of(context)!;
  
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        title: Row(
          children: [
            Icon(
              Icons.logout,
              color: AppColors.primaryColor,
              size: 24,
            ),
            const SizedBox(width: 12),
            Text(
              l10n.logout,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
        content: Text(
          l10n.logoutConfirmation,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black87,
            height: 1.4,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              l10n.cancel,
              style: const TextStyle(
                color: Colors.black54,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
              _performLogout(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              l10n.logout,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    },
  );
}

Future<void> _performLogout(BuildContext context) async {
  final l10n = AppLocalizations.of(context)!;
  
  try {
    // Delete stored tokens
    await SecureStorage.deleteTokens();
    
    // Restart the app and navigate to splash screen
    if (context.mounted) {
      Phoenix.rebirth(context);
      context.go(Routes.splashView);
    }
  } catch (e) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('${l10n.logoutFailed}: $e'),
          backgroundColor: Colors.red,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      );
    }
  }
}
