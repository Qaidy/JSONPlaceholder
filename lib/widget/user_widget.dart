import 'package:flutter/material.dart';
import 'package:jsonplaceholder/model/users.dart';

class UserWidget extends StatelessWidget {
  final Users users;
  const UserWidget({super.key, required this.users});

  Widget _infoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: const Color(0xFF7B6BAE)),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey[500],
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  value,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF3F0FA),
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Baris atas: Avatar + Nama/Username + ID badge
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Avatar outline saja
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF7B6BAE),
                      width: 1.5,
                    ),
                  ),
                  child: Center(
                    child: Text(
                      users.name[0].toUpperCase(),
                      style: const TextStyle(
                        color: Color(0xFF7B6BAE),
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // Nama & username
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        users.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        '@${users.username}',
                        style: TextStyle(
                          color: Colors.grey[500],
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ),
                // ID badge
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E2F7),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    'ID #${users.id}',
                    style: const TextStyle(
                      color: Color(0xFF7B6BAE),
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),

            // Company name & catchphrase
            Text(
              users.company.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              users.company.catchPhrase,
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 13,
                color: Colors.grey[500],
              ),
            ),

            const SizedBox(height: 12),
            Divider(color: Colors.grey[300], height: 1),
            const SizedBox(height: 4),

            // Info rows
            _infoRow(Icons.email_outlined, 'EMAIL', users.email),
            _infoRow(Icons.phone_outlined, 'PHONE', users.phone),
            _infoRow(Icons.language_outlined, 'WEBSITE', users.website),
            _infoRow(
              Icons.location_on_outlined,
              'ADDRESS',
              '${users.address.street}, ${users.address.suite} · ${users.address.city}',
            ),
          ],
        ),
      ),
    );
  }
}
