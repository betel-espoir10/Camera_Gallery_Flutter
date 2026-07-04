import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isNotificationActive = true;
  bool _isDarkModeActive = false;
  bool _isLocationActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        foregroundColor: Colors.white,
        title: Text(
          "Settings",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),

      body: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //App preferences
            _sectionHeaderText(label: "Preferences"),
            _sectionSettingsOptions(
              options: [
                ListTile(
                  leading: Icon(Icons.notifications_none_outlined),
                  title: Text("Notifications"),
                  trailing: Switch.adaptive(
                    value: _isNotificationActive,
                    onChanged: (bool? value) {
                      setState(() {
                        _isNotificationActive = value!;
                      });
                    },
                  ),
                  leadingAndTrailingTextStyle: _leadingAndTraillingTextStyle(),
                ),

                ListTile(
                  leading: Icon(Icons.adjust_outlined),
                  title: Text("Dark Mode"),
                  trailing: Switch.adaptive(
                    value: _isDarkModeActive,
                    onChanged: (bool? value) {
                      setState(() {
                        _isDarkModeActive = value!;
                      });
                    },
                  ),
                  leadingAndTrailingTextStyle: _leadingAndTraillingTextStyle(),
                ),
                ListTile(
                  leading: Icon(Icons.person_pin_circle_outlined),
                  title: Text("Location"),
                  trailing: Switch.adaptive(
                    value: _isLocationActive,
                    onChanged: (bool? value) {
                      setState(() {
                        _isLocationActive = value!;
                      });
                    },
                  ),
                  leadingAndTrailingTextStyle: _leadingAndTraillingTextStyle(),
                ),
              ],
            ),
            //account settings
            _sectionHeaderText(label: "Account"),
            _sectionSettingsOptions(
              options: [
                ListTile(
                  leading: Icon(Icons.person_outlined),
                  title: Text("Manage Profil"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  leadingAndTrailingTextStyle: _leadingAndTraillingTextStyle(),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, "/profil");
                  },
                ),

                ListTile(
                  leading: Icon(Icons.lock_outline),
                  title: Text("Password & Settings"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  leadingAndTrailingTextStyle: _leadingAndTraillingTextStyle(),
                  onTap: () {},
                ),
              ],
            ),
            //customer support
            _sectionHeaderText(label: "Support"),
            _sectionSettingsOptions(
              options: [
                ListTile(
                  leading: Icon(Icons.call_outlined),
                  title: Text("Customer Support"),
                  trailing: Icon(Icons.keyboard_arrow_right_outlined),
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Padding _sectionHeaderText({required String label}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).primaryColor,
        ),
      ),
    );
  }

  Card _sectionSettingsOptions({required List<ListTile> options}) {
    return Card(
      color: Theme.of(context).highlightColor,
      margin: EdgeInsets.zero,
      elevation: 0.2,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(children: options),
      ),
    );
  }

  TextStyle _leadingAndTraillingTextStyle() {
    return const TextStyle(color: Colors.black, fontWeight: FontWeight.w400);
  }
}
