import 'package:finvu_flutter_sdk/config/finvu_app_config.dart';
import 'package:finvu_flutter_sdk/finvu_ui_manager.dart';
import 'package:finvu_flutter_sdk_core/finvu_ui_initialization.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Finvu Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  void _launchFinvuJourney(BuildContext context, {FinvuUIConfig? uiConfig}) {
    FinvuUIManager().initialize(
      context: context,
      sdkConfig: SDKConfig(
        logoUrl: 'https://example.com/logo.png',
        isPartOfAsset: false,
      ),
      fiuDetails: FIUDetails(
        fiuId: 'your_fiu_id',
        fiuName: 'Your FIU Name',
      ),
      loginConfig: LoginConfig(
        mobileNumber: '8459177562',
        consentHandle: '6b2423a3-399b-4732-82d4-8e0b8586d8d9',
      ),
      environment: Environment.dev,
      uiConfig: uiConfig,
    );
  }

  FinvuUIConfig _getCredTheme() {
    return FinvuUIConfig(
      primaryColor: const Color(0xFF1A1A1A), // CRED black
      secondaryColor: const Color(0xFF444444),
      currentColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        bodyMedium: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: Colors.white70,
        ),
      ),
      fontFamily: 'Gilroy',
      loderWidget: const CircularProgressIndicator(
        color: Colors.white,
      ),
      isElevatedButton: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFD8392B), // CRED red
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        ),
      ),
    );
  }

  FinvuUIConfig _getGrowTheme() {
    return FinvuUIConfig(
      primaryColor: const Color(0xFF00D09C), // Grow green
      secondaryColor: const Color(0xFF5367FF),
      currentColor: Colors.black,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        bodyMedium: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Colors.black87,
        ),
      ),
      fontFamily: 'Inter',
      loderWidget: const CircularProgressIndicator(
        color: Color(0xFF00D09C),
      ),
      isElevatedButton: false,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: Color(0xFF00D09C)),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Finvu Demo"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _launchFinvuJourney(context),
              child: const Text("Finvu AA Journey"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchFinvuJourney(
                context,
                uiConfig: _getCredTheme(),
              ),
              child: const Text("CRED Journey"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => _launchFinvuJourney(
                context,
                uiConfig: _getGrowTheme(),
              ),
              child: const Text("Grow Journey"),
            ),
          ],
        ),
      ),
    );
  }
}
