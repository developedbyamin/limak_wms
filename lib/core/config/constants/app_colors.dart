import 'package:flutter/material.dart';

class AppColors {
  // Primary Brand Colors - Limak.az Theme
  static const Color primaryColor = Color(0xFFE53E3E); // Bright Red - Main brand color
  static const Color primaryDarkColor = Color(0xFFC53030); // Darker red for pressed states
  static const Color primaryLightColor = Color(0xFFFED7D7); // Light red for backgrounds
  static const Color accentColor = Color(0xFF2D3748); // Dark gray for secondary elements

  // Background Colors
  static const Color backgroundColor = Color(0xFFF7FAFC); // Very light gray background
  static const Color surfaceColor = Color(0xFFFFFFFF); // Pure white for cards/surfaces
  static const Color whiteColor = Color(0xFFFFFFFF);
  static const Color blackColor = Color(0xFF1A202C); // Rich black
  static const Color transparentColor = Color(0x00000000);

  // Status Colors
  static const Color successColor = Color(0xFF38A169); // Green for success/delivered
  static const Color warningColor = Color(0xFFD69E2E); // Orange for warnings/in transit
  static const Color errorColor = Color(0xFFE53E3E); // Red for errors/failed
  static const Color infoColor = Color(0xFF3182CE); // Blue for information

  // Text Colors
  static const Color textPrimaryColor = Color(0xFF1A202C); // Dark text
  static const Color textSecondaryColor = Color(0xFF4A5568); // Medium gray text
  static const Color textLightColor = Color(0xFF718096); // Light gray text
  static const Color textMutedColor = Color(0xFFA0AEC0); // Very light gray text
  static const Color hintColor = Color(0xFFCBD5E0); // Hint text color

  // Border and Stroke Colors
  static const Color strokeColor = Color(0xFFE2E8F0); // Light border
  static const Color dividerColor = Color(0xFFEDF2F7); // Very light divider
  static const Color borderColor = Color(0xFFD1D5DB); // Medium border

  // Interactive Colors
  static const Color linkColor = Color(0xFF3182CE); // Blue for links
  static const Color focusColor = Color(0xFF4299E1); // Light blue for focus states
  static const Color disabledColor = Color(0xFFE2E8F0); // Disabled state
  static const Color disabledTextColor = Color(0xFFA0AEC0); // Disabled text

  // Delivery Status Colors
  static const Color pendingColor = Color(0xFFF6AD55); // Orange for pending orders
  static const Color inTransitColor = Color(0xFF4FD1C7); // Teal for in transit
  static const Color deliveredColor = Color(0xFF68D391); // Light green for delivered
  static const Color acceptedColor = Color(0xFF3182CE); // Blue for accepted
  static const Color cancelledColor = Color(0xFFFB7185); // Light red for cancelled

  // Special Purpose Colors
  static const Color trackingColor = Color(0xFF805AD5); // Purple for tracking
  static const Color notificationColor = Color(0xFFED8936); // Orange for notifications
  static const Color highlightColor = Color(0xFFFFF5F5); // Very light red highlight

  // Neutral Grays (for better design hierarchy)
  static const Color gray50 = Color(0xFFF9FAFB);
  static const Color gray100 = Color(0xFFF3F4F6);
  static const Color gray200 = Color(0xFFE5E7EB);
  static const Color gray300 = Color(0xFFD1D5DB);
  static const Color gray400 = Color(0xFF9CA3AF);
  static const Color gray500 = Color(0xFF6B7280);
  static const Color gray600 = Color(0xFF4B5563);
  static const Color gray700 = Color(0xFF374151);
  static const Color gray800 = Color(0xFF1F2937);
  static const Color gray900 = Color(0xFF111827);

  // Legacy Colors (keeping for backward compatibility)
  static const Color greenForOnlineColor = Color(0xFF10B981); // Updated green
  static const Color greenColor = Color(0xFF059669); // Darker green
  static const Color greenTransparentColor = Color(0x1A10B981); // Transparent green
  static const Color yellowColor = Color(0xFFF59E0B); // Updated yellow
  static const Color blueColor = Color(0xFF1E40AF); // Updated blue
  static const Color lightBlueColor = Color(0xFF60A5FA); // Light blue
  static const Color orderColor = Color(0xFF374151); // Order status color
  static const Color ratingBarColor = Color(0xFFFBBF24); // Rating stars
  static const Color priceColor = Color(0xFF1F2937); // Price text
  static const Color discountPriceColor = Color(0xFFEF4444); // Discount price
  static const Color primaryTransparentColor = Color(0x33E53E3E); // 20% opacity red
  static const Color primaryTransparent2Color = Color(0xFFFEF2F2); // Very light red
  static const Color pickerDefaultTextColor = Color(0xFF4B5563);
  static const Color pickerDefaultSelectedTextColor = Color(0xFF1F2937);
  static const Color pickerDefaultSelectorColor = Color(0xFFE53E3E);

  // Search and Input Colors
  static const Color searchViewHintColor = Color(0xFF9CA3AF);
  static const Color inputBackgroundColor = Color(0xFFF9FAFB);
  static const Color inputBorderColor = Color(0xFFD1D5DB);
  static const Color inputFocusBorderColor = Color(0xFFE53E3E);

  // Card and Surface Colors
  static const Color cardColor = Color(0xFFFFFFFF);
  static const Color cardShadowColor = Color(0x0F000000); // 6% opacity black
  static const Color elevatedSurfaceColor = Color(0xFFFFFFFF);

  // Overlay Colors
  static const Color overlayColor = Color(0x80000000); // 50% opacity black
  static const Color modalBackgroundColor = Color(0x4D000000); // 30% opacity black

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFFE53E3E),
    Color(0xFFD53F8C),
  ];

  static const List<Color> successGradient = [
    Color(0xFF38A169),
    Color(0xFF48BB78),
  ];

  static const List<Color> backgroundGradient = [
    Color(0xFFF7FAFC),
    Color(0xFFEDF2F7),
  ];
}