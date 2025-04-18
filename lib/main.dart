import 'package:demo_app/language_selector.dart';
import 'package:finvu_flutter_sdk/common/utils/finvu_colors.dart';
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
      home: MyHomePage(),
    );
  }
}

// Groww Colors
const growwPrimaryColor = Color(0xFF00D09C);
const growwTextColor = Colors.black;

// Jupiter Colors
const jupiterPrimaryColor = Color.fromRGBO(244, 110, 97, 100);
const jupiterTextColor = Colors.white;

// Axis Colors
const axisPrimaryColor = Color.fromRGBO(134, 31, 65, 100); // Maroon
const axisTextColor = Colors.white;

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});
  var selectedLanguage = 'en';

  void _launchFinvuJourney(BuildContext context,
      {FinvuUIConfig? uiConfig, String? appLocale}) {
    FinvuUIManager().initialize(
      buildContext: context,
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
        consentHandleId: '6b2423a3-399b-4732-82d4-8e0b8586d8d9',
      ),
      environment: Environment.dev,
      uiConfig: uiConfig,
      appLocale: appLocale ?? selectedLanguage,
    );
  }

  FinvuUIConfig _getCredTheme() {
    return FinvuUIConfig(
      primaryColor: const Color(0xFF1A1A1A),
      secondaryColor: const Color(0xFF444444),
      currentColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 32, fontWeight: FontWeight.w700, color: Colors.white),
        bodyMedium: TextStyle(
            fontSize: 16, fontWeight: FontWeight.w400, color: Colors.white70),
      ),
      fontFamily: 'Gilroy',
      loderWidget: const CircularProgressIndicator(color: Colors.white),
      isElevatedButton: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        hintStyle: TextStyle(color: Colors.black45),
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  FinvuUIConfig _getGrowwTheme() {
    return FinvuUIConfig(
      primaryColor: growwPrimaryColor,
      secondaryColor: Colors.white,
      currentColor: Colors.white,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 28, fontWeight: FontWeight.w600, color: growwTextColor),
        bodyMedium: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black87),
      ),
      fontFamily: 'Inter',
      loderWidget: const CircularProgressIndicator(color: growwPrimaryColor),
      isElevatedButton: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: growwPrimaryColor,
          foregroundColor: Colors.white,
          side: const BorderSide(color: growwPrimaryColor),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.black26),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: growwPrimaryColor, width: 2),
        ),
        hintStyle: TextStyle(color: Colors.black45),
        labelStyle: TextStyle(color: growwTextColor),
      ),
    );
  }

  FinvuUIConfig _getJupiterTheme() {
    return FinvuUIConfig(
      primaryColor: jupiterPrimaryColor,
      secondaryColor: jupiterTextColor,
      currentColor: jupiterTextColor,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 30, fontWeight: FontWeight.bold, color: jupiterTextColor),
        bodyMedium: TextStyle(fontSize: 15, color: Colors.white70),
      ),
      fontFamily: 'Plus Jakarta Sans',
      loderWidget: const CircularProgressIndicator(color: jupiterTextColor),
      isElevatedButton: true,
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: jupiterPrimaryColor,
          foregroundColor: jupiterTextColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(
            vertical: 14,
            horizontal: 28,
          ),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(12)),
          borderSide: BorderSide(
            color: Color.fromARGB(156, 246, 140, 131),
            width: 2,
          ),
        ),
        hintStyle: TextStyle(color: Colors.black54),
        labelStyle: TextStyle(color: Colors.black),
      ),
    );
  }

  FinvuUIConfig _getAxisTheme() {
    return FinvuUIConfig(
      primaryColor: axisPrimaryColor,
      secondaryColor: axisTextColor,
      currentColor: axisTextColor,
      textTheme: const TextTheme(
        displayLarge: TextStyle(
            fontSize: 28, fontWeight: FontWeight.bold, color: axisTextColor),
        bodyMedium: TextStyle(
            fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white70),
      ),
      fontFamily: 'Lato',
      loderWidget: const CircularProgressIndicator(color: axisTextColor),
      isElevatedButton: false,
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: const BorderSide(color: axisPrimaryColor, width: 2),
          foregroundColor: axisPrimaryColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
          textStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          borderSide: BorderSide(color: Colors.grey, width: 2),
        ),
        hintStyle: TextStyle(color: Colors.black54),
        labelStyle: TextStyle(color: Colors.black),
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LanguageSelector(
                onLanguageSelected: (locale) {
                  selectedLanguage = locale.languageCode;
                },
              ),
              ElevatedButton(
                onPressed: () => _launchFinvuJourney(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: FinvuColors.blue,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                ),
                child: const Text("Finvu AA Journey"),
              ),
              const SizedBox(height: 20),

              // CRED
              ElevatedButton(
                onPressed: () => _launchFinvuJourney(context,
                    uiConfig: _getCredTheme(), appLocale: selectedLanguage),
                style: _getCredTheme().elevatedButtonTheme!.style,
                child: const Text("CRED Journey"),
              ),
              const SizedBox(height: 20),

              // Groww
              ElevatedButton(
                onPressed: () => _launchFinvuJourney(context,
                    uiConfig: _getGrowwTheme(), appLocale: selectedLanguage),
                style: _getGrowwTheme().elevatedButtonTheme!.style,
                child: const Text(
                  "Groww Journey",
                ),
              ),
              const SizedBox(height: 20),

              // Axis
              OutlinedButton(
                onPressed: () => _launchFinvuJourney(context,
                    uiConfig: _getAxisTheme(), appLocale: selectedLanguage),
                style: _getAxisTheme().outlinedButtonTheme!.style,
                child: const Text(
                  "Axis Journey",
                ),
              ),
              const SizedBox(height: 20),

              // Jupiter
              ElevatedButton(
                onPressed: () =>
                    _launchFinvuJourney(context, uiConfig: _getJupiterTheme()),
                style: _getJupiterTheme().elevatedButtonTheme!.style,
                child: const Text("Jupiter Journey"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
