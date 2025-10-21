import 'package:flutter/material.dart';
import 'package:exercises/core/utils/constants.dart';
import 'package:exercises/core/utils/styles.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackground,
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: kBackground,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const CircleAvatar(
                radius: 40,
                child: Icon(Icons.person, size: 40),
              ),
              const SizedBox(height: 16),
              Text(
                "Shahd Tarek",
                style: Styles.textStyle20.copyWith(
                  fontWeight: FontWeight.bold,
                  color: kTextColor,
                ),
              ),
              const SizedBox(height: 24),
              const Divider(),
              const SizedBox(height: 16),

              _buildProfileOption(
                icon: Icons.bar_chart_rounded,
                title: "Progress & Stats",
                subtitle: "View your workout history and performance",
                onTap: () {},
              ),
              _buildProfileOption(
                icon: Icons.flag_rounded,
                title: "Goals",
                subtitle: "Set and track your fitness goals",
                onTap: () {},
              ),
              _buildProfileOption(
                icon: Icons.settings_rounded,
                title: "Settings",
                subtitle: "Customize your app preferences",
                onTap: () {},
              ),
              _buildProfileOption(
                icon: Icons.notifications_rounded,
                title: "Reminders",
                subtitle: "Manage daily workout reminders",
                onTap: () {},
              ),

              const SizedBox(height: 24),

              // زر تسجيل الخروج
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    // logout logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.redAccent,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.logout, color: Colors.white),
                  label: const Text(
                    "Logout",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: kPrimaryColor, size: 28),
        title: Text(
          title,
          style: Styles.textStyle16.copyWith(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle, style: const TextStyle(color: Colors.grey)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 18,
          color: Colors.grey,
        ),
        onTap: onTap,
      ),
    );
  }
}
