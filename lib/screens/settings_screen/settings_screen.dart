import 'package:flutter/material.dart';
import 'package:graville_operations/model/settings/settings_Item.dart';
import 'package:graville_operations/screens/commons/widgets/section_Title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  //void _onItemTap(BuildContext context, String title) {
  //ScaffoldMessenger.of(
  //context,
  //).showSnackBar(SnackBar(content: Text('$title clicked')));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F7),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF5F5F7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 16, 48, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Account section
            const SectionTitle(title: 'Account'),
            _settingsCard(
              context,
              items: [
                _item(Icons.person_outline, 'Edit profile'),
                _item(Icons.security, 'Security'),
                _item(Icons.notifications_none, 'Notifications'),
                _item(Icons.lock_outline, 'Privacy'),
              ],
            ),

            const SizedBox(height: 20),

            const SectionTitle(title: 'Preferences'),
            _settingsCard(
              context,
              items: [
                _item(Icons.language, 'Language'),
                _item(Icons.dark_mode_outlined, 'Theme'),
              ],
            ),

            const SizedBox(height: 20),

            const SectionTitle(title: 'Support & About'),
            _settingsCard(
              context,
              items: [
                _item(Icons.help_outline, 'Help & Support'),
                _item(Icons.info_outline, 'Terms and Policies'),
              ],
            ),

            const SizedBox(height: 20),

            const SectionTitle(title: 'Actions'),
            _settingsCard(
              context,
              items: [
                _item(Icons.flag_outlined, 'Report a problem'),
                _item(Icons.person_add_alt, 'Add account'),
                _item(Icons.logout, 'Log out'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  //'Widget _sectionTitle(String title) {
  //return Padding(
  //padding: const EdgeInsets.only(bottom: 8),
  //child: Text(
  //title,
  //style: const TextStyle(
  //fontSize: 18,
  //fontWeight: FontWeight.bold,
  //color: Colors.black,
  //),
  //),
  //);
  //}

  Widget _settingsCard(
    BuildContext context, {
    required List<SettingsItem> items,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: items.map((item) {
          //return ListTile(
          // leading: Icon(item.icon, color: Colors.black54),
          //title: Text(
          //item.title,
          // style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          //),
          //trailing: const Icon(Icons.chevron_right),
          //onTap: () => _onItemTap(context, item.title),
          //);

          return Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              splashColor: Colors.black.withOpacity(0.05),
              highlightColor: Colors.black.withOpacity(0.08),
              onTap: () {
                // TODO: navigate or handle action
              },
              child: ListTile(
                leading: Icon(item.icon, color: Colors.black54),
                title: Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                trailing: const Icon(Icons.chevron_right),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  SettingsItem _item(IconData icon, String title) {
    return SettingsItem(icon: icon, title: title);
  }
}
