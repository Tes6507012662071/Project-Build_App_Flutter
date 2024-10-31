import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Profile Picture
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage(
                  'https://i.pinimg.com/564x/86/ef/d4/86efd437d922088ddb8b23887128edb7.jpg', // Replace with the actual image URL
                ),
              ),
            ),
            const SizedBox(height: 16),

            // User Name
            const Text(
              'CEO MEAOWW', // Replace with user's name
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),

            // User Email
            const Text(
              'Meaowmaow@cat.com', // Replace with user's email
              style: TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 16),

            // Edit Profile Button
            ElevatedButton(
              onPressed: () {
                // Add functionality to navigate to edit profile page
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 20),

            // Account Settings Section
            const Text(
              'Account Settings',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // List of settings options
            _buildSettingsOption('Order History', Icons.history),
            _buildSettingsOption('Address', Icons.location_on),
            _buildSettingsOption('Payment Methods', Icons.payment),
            _buildSettingsOption('Logout', Icons.logout),
          ],
        ),
      ),
    );
  }

  // Helper widget to build each settings option
  Widget _buildSettingsOption(String title, IconData icon) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(title),
      onTap: () {
        // Add functionality for each settings option
      },
    );
  }
}
