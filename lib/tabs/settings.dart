import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:session_8_flutter4/bottom_sheets/language_bottom_sheet.dart';
import 'package:session_8_flutter4/bottom_sheets/theme_bottom_sheet.dart';
import 'package:session_8_flutter4/my_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:session_8_flutter4/providers/my_provider.dart';


class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<MyProvider>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.language,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: LanguageBottomSheet(),
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor : MyThemeData.yellowColor),
              ),
              child: Text(
                provider.languageCode == "en" ? "English" : "العربية",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.03,
          ),
          Text(
            AppLocalizations.of(context)!.theme,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                isDismissible: true,
                isScrollControlled: true,
                builder: (context) {
                  return Container(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: ThemeBottomSheet(),
                  );
                },
              );
            },
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color:  provider.themeMode == ThemeMode.light ? MyThemeData.primaryColor : MyThemeData.yellowColor),
              ),
              child: Text(
                provider.themeMode == ThemeMode.dark ? "Dark" : "Light",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
