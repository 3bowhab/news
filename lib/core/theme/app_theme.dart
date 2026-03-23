import 'package:flutter/material.dart';
import 'package:news/core/extensions/responsive_size_extension.dart';
import 'package:news/core/theme/app_colors.dart';

/// | NAME           | SIZE |  HEIGHT |  WEIGHT |  SPACING |             |
/// |----------------|------|---------|---------|----------|-------------|
/// | displayLarge   | 57.0 |   64.0  | regular | -0.25    |             |
/// | displayMedium  | 45.0 |   52.0  | regular |  0.0     |             |
/// | displaySmall   | 36.0 |   44.0  | regular |  0.0     |             |
/// | headlineLarge  | 32.0 |   40.0  | regular |  0.0     |             |
/// | headlineMedium | 28.0 |   36.0  | regular |  0.0     |             |
/// | headlineSmall  | 24.0 |   32.0  | regular |  0.0     |             |
/// | titleLarge     | 22.0 |   28.0  | regular |  0.0     |             |
/// | titleMedium    | 16.0 |   24.0  | medium  |  0.15    |             |
/// | titleSmall     | 14.0 |   20.0  | medium  |  0.1     |             |
/// | bodyLarge      | 16.0 |   24.0  | regular |  0.5     |             |
/// | bodyMedium     | 14.0 |   20.0  | regular |  0.25    |             |
/// | bodySmall      | 12.0 |   16.0  | regular |  0.4     |             |
/// | labelLarge     | 14.0 |   20.0  | medium  |  0.1     |             |
/// | labelMedium    | 12.0 |   16.0  | medium  |  0.5     |             |
/// | labelSmall     | 11.0 |   16.0  | medium  |  0.5     |             |

class AppTheme {
  static ThemeData get lightTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.main,

    colorScheme: const ColorScheme.light(
      primary: AppColors.main,
      // onPrimary: AppColors.white,
      // secondary: AppColors.secText,
      // onSecondary: AppColors.white,
      surface: AppColors.mainDark,
      // onSurface: AppColors.stroke,
      // error: AppColors.red,
      // onError: AppColors.white,
      // tertiary: AppColors.main,
      // secondaryContainer: AppColors.background,
      // primaryFixed: AppColors.disabled,
      // onPrimaryContainer: AppColors.mainText,
      // onSecondaryContainer: AppColors.background,
    ),

    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.main,
      elevation: 0,
      centerTitle: true,
      scrolledUnderElevation: 0,
      surfaceTintColor: Colors.transparent,
    ),

    textTheme: TextTheme(
      headlineLarge: TextStyle(color: AppColors.mainDark),
      headlineMedium: TextStyle(color: AppColors.mainDark),
      headlineSmall: TextStyle(color: AppColors.mainDark),
      labelLarge: TextStyle(color: AppColors.mainDark),
      titleLarge: TextStyle(color: AppColors.mainDark),
      titleMedium: TextStyle(color: AppColors.mainDark),
      titleSmall: TextStyle(color: AppColors.mainDark),
      bodyLarge: TextStyle(color: AppColors.mainDark),
      bodyMedium: TextStyle(color: AppColors.mainDark),
      bodySmall: TextStyle(color: AppColors.mainDark),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.mainDark,
      selectionColor: AppColors.mainDark,
      selectionHandleColor: AppColors.mainDark,
    ),

    inputDecorationTheme: InputDecorationThemeData(
      suffixIconColor: AppColors.mainDark,
      hintStyle: TextStyle(color: AppColors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.mainDark),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.mainDark),
      ),
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.mainDark,
        foregroundColor: AppColors.main,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: Size(double.infinity, 48.height),
      ),
    ),

    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      dividerHeight: 0,
      indicatorColor: AppColors.mainDark,
      unselectedLabelColor: AppColors.mainDark,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.mainDark,
        fontSize: 16,
      ),
    ),

    iconTheme: const IconThemeData(color: AppColors.main, size: 26),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.mainDark,
    ),

    dividerTheme: DividerThemeData(
      color: AppColors.mainDark,
      indent: 20.width,
      endIndent: 20.width,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.main,
      elevation: 0,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.main,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          );
        }
        return const TextStyle(
          color: AppColors.mainDark,
          fontWeight: FontWeight.normal,
          fontSize: 14,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.main, size: 28);
        }
        return const IconThemeData(color: AppColors.mainDark, size: 28);
      }),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.main,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    ),
  );

  // Dark Theme
  static ThemeData get darkTheme => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.mainDark,
      // onPrimary: AppColors.white,
      // secondary: AppColors.secTextDarkMode,
      // onSecondary: AppColors.white,
      surface: AppColors.main,
      // onSurface: AppColors.strokeDarkMode,
      // error: AppColors.red,
      // onError: AppColors.white,
      // tertiary: AppColors.white,
      // secondaryContainer: AppColors.backgroundDarkMode,
      // primaryFixed: AppColors.disabled,
      // onPrimaryContainer: AppColors.secTextDarkMode,
      // onSecondaryContainer: AppColors.inputs,
    ),
    scaffoldBackgroundColor: AppColors.mainDark,
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.mainDark,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: true,
    ),
    textTheme: TextTheme(
      headlineLarge: TextStyle(color: AppColors.main),
      headlineMedium: TextStyle(color: AppColors.main),
      headlineSmall: TextStyle(color: AppColors.main),
      titleLarge: TextStyle(color: AppColors.main),
      titleMedium: TextStyle(color: AppColors.main),
      titleSmall: TextStyle(color: AppColors.main),
      labelLarge: TextStyle(color: AppColors.main),
      bodyLarge: TextStyle(color: AppColors.main),
      bodyMedium: TextStyle(color: AppColors.main),
      bodySmall: TextStyle(color: AppColors.main),
    ),

    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: AppColors.main,
      selectionColor: AppColors.main,
      selectionHandleColor: AppColors.main,
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.main,
        foregroundColor: AppColors.mainDark,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        minimumSize: Size(double.infinity, 48.height),
        textStyle: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
    ),

    inputDecorationTheme: InputDecorationThemeData(
      suffixIconColor: AppColors.main,
      hintStyle: TextStyle(color: AppColors.grey),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.main),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(16),
        borderSide: BorderSide(color: AppColors.main),
      ),
    ),

    tabBarTheme: TabBarThemeData(
      tabAlignment: TabAlignment.start,
      dividerHeight: 0,
      unselectedLabelColor: AppColors.main,
      labelStyle: TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.main,
        fontSize: 16,
      ),
    ),

    iconTheme: const IconThemeData(color: AppColors.mainDark, size: 26),

    progressIndicatorTheme: const ProgressIndicatorThemeData(
      color: AppColors.main,
    ),

    dividerTheme: DividerThemeData(
      color: AppColors.main,
      indent: 20.width,
      endIndent: 20.width,
    ),

    navigationBarTheme: NavigationBarThemeData(
      backgroundColor: AppColors.mainDark,
      elevation: 0,
      indicatorColor: Colors.transparent,
      labelTextStyle: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const TextStyle(
            color: AppColors.main,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          );
        }
        return const TextStyle(
          color: AppColors.main,
          fontWeight: FontWeight.bold,
          fontSize: 14,
        );
      }),
      iconTheme: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return const IconThemeData(color: AppColors.main, size: 28);
        }
        return const IconThemeData(color: AppColors.mainDark, size: 28);
      }),
    ),

    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: AppColors.mainDark,
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
    ),
  );
}
