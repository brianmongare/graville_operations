import 'package:flutter/material.dart';
import 'package:graville_operations/model/settings/settings_Item.dart';
import 'package:graville_operations/screens/commons/widgets/section_Title.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

<<<<<<< Updated upstream
  //void _onItemTap(BuildContext context, String title) {
  //ScaffoldMessenger.of(
  //context,
  //).showSnackBar(SnackBar(content: Text('$title clicked')));
  // }

=======
>>>>>>> Stashed changes
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
              items: const [
                _SettingsItem(
                  icon: Icons.person_outline,
                  title: 'Edit profile',
                ),
                _SettingsItem(icon: Icons.security, title: 'Security'),
                _SettingsItem(
                  icon: Icons.notifications_none,
                  title: 'Notifications',
                ),
                _SettingsItem(icon: Icons.lock_outline, title: 'Privacy'),
              ],
            ),

            const SizedBox(height: 20),

            const SectionTitle(title: 'Preferences'),
            _settingsCard(
              items: const [
                _SettingsItem(icon: Icons.language, title: 'Language'),
                _SettingsItem(icon: Icons.dark_mode_outlined, title: 'Theme'),
              ],
            ),

            const SizedBox(height: 20),

            const SectionTitle(title: 'Support & About'),
            _settingsCard(
              items: const [
                _SettingsItem(
                  icon: Icons.help_outline,
                  title: 'Help & Support',
                ),
                _SettingsItem(
                  icon: Icons.info_outline,
                  title: 'Terms and Policies',
                ),
              ],
            ),

            const SizedBox(height: 20),

            const SectionTitle(title: 'Actions'),
            _settingsCard(
              items: const [
                _SettingsItem(
                  icon: Icons.flag_outlined,
                  title: 'Report a problem',
                ),
                _SettingsItem(icon: Icons.person_add_alt, title: 'Add account'),
                _SettingsItem(icon: Icons.logout, title: 'Log out'),
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

<<<<<<< Updated upstream
  Widget _settingsCard(
    BuildContext context, {
    required List<SettingsItem> items,
  }) {
=======
  Widget _settingsCard({required List<_SettingsItem> items}) {
>>>>>>> Stashed changes
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: items.map((item) {
<<<<<<< Updated upstream
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
=======
          return Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.black.withOpacity(0.08),
              highlightColor: Colors.black.withOpacity(0.05),
              onTap: () {},
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream

  SettingsItem _item(IconData icon, String title) {
    return SettingsItem(icon: icon, title: title);
  }
}
=======
}

class _SettingsItem {
  final IconData icon;
  final String title;

  const _SettingsItem({required this.icon, required this.title});
}
>>>>>>> Stashed changes
