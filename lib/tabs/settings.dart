import 'package:flutter/material.dart';
import 'package:session_8_flutter4/my_theme.dart';

class SettingsTab extends StatelessWidget {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Language",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: MyThemeData.primaryColor),
            ),
            child: Text(
              "Arabic",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
          Text(
            "Theme",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: MyThemeData.primaryColor),
            ),
            child: Text(
              "Light",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
