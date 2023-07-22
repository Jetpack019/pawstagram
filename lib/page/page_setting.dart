import 'package:flutter/material.dart';
import 'package:petapp/page/page_home.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String _selectedSetting = 'Edit Profile'; // Placeholder for selected setting

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.orange,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'General',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildGeneralSettingsListTile(
                Icons.edit,
                'Edit Profile',
                () {
                  setState(() {
                    _selectedSetting = 'Edit Profile';
                  });
                },
              ),
              _buildGeneralSettingsListTile(
                Icons.notifications_active,
                'Notifications',
                () {
                  setState(() {
                    _selectedSetting = 'Notifications';
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Pawstagram',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              _buildPawstagramSettingsListTile(
                Icons.language,
                'Language',
                () {
                  setState(() {
                    _selectedSetting = 'Language';
                  });
                },
              ),
              _buildPawstagramSettingsListTile(
                Icons.privacy_tip,
                'Privacy',
                () {
                  setState(() {
                    _selectedSetting = 'Privacy';
                  });
                },
              ),
              _buildPawstagramSettingsListTile(
                Icons.help_outline,
                'Help and Feedback',
                () {
                  setState(() {
                    _selectedSetting = 'Help and Feedback';
                  });
                },
              ),
              SizedBox(height: 20),
              Text(
                'Selected Setting: $_selectedSetting',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildGeneralSettingsListTile(
      IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: onTap,
    );
  }

  Widget _buildPawstagramSettingsListTile(
      IconData icon, String title, VoidCallback onTap) {
    return ExpansionTile(
      leading: Icon(icon),
      title: Text(title),
      children: [
        ListTile(
          title: Text('Option 1'),
          onTap: onTap,
        ),
        ListTile(
          title: Text('Option 2'),
          onTap: onTap,
        ),
        ListTile(
          title: Text('Option 3'),
          onTap: onTap,
        ),
      ],
    );
  }
}
