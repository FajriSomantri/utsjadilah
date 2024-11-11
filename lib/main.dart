import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Service imports
import 'core/services/auth_service.dart';
import 'core/services/storage_service.dart';
import 'core/utils/helpers.dart';
import 'core/utils/validators.dart';
import 'core/config/shared_preferences.dart';

// Screen imports
import 'features/auth/screens/login_screen.dart';
import 'features/auth/screens/register_screen.dart';
import 'features/auth/screens/forgot_password_screen.dart';
import 'features/auth/widgets/custom_text_field.dart';
import 'features/auth/widgets/social_login_buttons.dart';
import 'features/calculator/screens/calculator_screen.dart';
import 'features/calculator/widgets/calculator_button.dart';
import 'features/bmi/screens/bmi_screen.dart';
import 'features/bmi/widgets/height_slider.dart';
import 'features/bmi/widgets/weight_selector.dart';
import 'features/currency/screens/currency_screen.dart';
import 'features/currency/widgets/currency_input.dart';
import 'features/temperature/screens/temperature_screen.dart';
import 'features/temperature/widgets/temperature_input.dart';

//shared import
import 'shared/models/user_model.dart';
import 'shared/widgets/custom_button.dart';
import 'shared/widgets/custom_snackbar.dart';
import 'shared/widgets/loading_indicator.dart';

// Core imports
import 'core/constant/app_colors.dart';
import 'core/constant/app_styles.dart';
import 'core/constant/app_constants.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  final prefs = await SharedPreferences.getInstance();
  final authService = AuthService(prefs);
  final storageService = StorageService(prefs);

  runApp(MyApp(
    authService: authService,
    storageService: storageService,
  ));
}

class MyApp extends StatelessWidget {
  final AuthService authService;
  final StorageService storageService;

  const MyApp({
    super.key,
    required this.authService,
    required this.storageService,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Converter App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          titleTextStyle: TextStyle(
            color: AppColors.primaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryColor,
          ),
          bodyMedium: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.dark,
        ),
      ),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/calculator': (context) => const CalculatorScreen(),
        '/bmi': (context) => const BmiScreen(),
        '/currency': (context) => const CurrencyScreen(),
        '/temperature': (context) => const TemperatureScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => Scaffold(
            appBar: AppBar(title: const Text('Not Found')),
            body: const Center(
              child: Text('Page not found'),
            ),
          ),
        );
      },
      home: FutureBuilder<bool>(
        future: Future.value(authService.isLoggedIn()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          return snapshot.data == true 
              ? const CalculatorScreen()
              : const LoginScreen();
        },
      ),
    );
  }
}