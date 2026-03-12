import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget _buildInfoCard(IconData icon, String title, String value) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
        subtitle: Text(value),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [

            /// Avatar
            const CircleAvatar(
              radius: 50,
              backgroundColor: Color(0xFFDDE6F2),
              child: Icon(
                Icons.person,
                size: 50,
                color: Colors.black54,
              ),
            ),

            const SizedBox(height: 16),

            /// Nama
            const Text(
              "Admin D4TI",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 4),

            const Text(
              "admin@d4ti.com",
              style: TextStyle(color: Colors.grey),
            ),

            const SizedBox(height: 20),

            /// Info Cards
            _buildInfoCard(
              Icons.school,
              "Program Studi",
              "D4 Teknik Informatika",
            ),

            _buildInfoCard(
              Icons.location_on,
              "Kampus",
              "Universitas Airlangga",
            ),

            _buildInfoCard(
              Icons.info,
              "Versi Aplikasi",
              "1.0.0",
            ),
          ],
        ),
      ),
    );
  }
}