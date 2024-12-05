import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:todo/app_theme.dart';
import 'package:todo/tabs/setting/language_provider.dart';
import 'package:todo/tabs/setting/setting_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  List<LanguageProvider> Language = [
    LanguageProvider(name: 'English', code: 'en'),
    LanguageProvider(name: 'العريبة', code: 'ar'),
  ];
  @override
  Widget build(BuildContext context) {
    SettingsProvider settingsProvider = Provider.of<SettingsProvider>(context);
    double Sizhight = MediaQuery.sizeOf(context).height;

    return Column(
      children: [
        Container(
          height: Sizhight * 0.20,
          width: double.infinity,
          color: AppTheme.primary,
          child: PositionedDirectional(
            start: 20,
            child: SafeArea(
              child: Text(
                'ToDo List',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: AppTheme.white,
                    ),
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Dark Them',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Switch(
              value: settingsProvider.isDark,
              onChanged: (isDark) => settingsProvider
                  .changeTheme(isDark ? ThemeMode.dark : ThemeMode.light),
            ),
          ],
        ),
        SizedBox(
          height: 8,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Language',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            DropdownButtonHideUnderline(
              child: DropdownButton<LanguageProvider>(
                value: Language.first,
                items: Language.map(
                  (Languages) => DropdownMenuItem(
                    child: Text(Languages.name),
                    value: Languages,
                  ),
                ).toList(),
                onChanged: (slectedLanguage) {
                  if (slectedLanguage != null) {
                    print(slectedLanguage.code);
                  }

                  setState(() {});
                },
                borderRadius: BorderRadius.circular(20),
              ),
            )
          ],
        ),
      ],
    );
  }
}
