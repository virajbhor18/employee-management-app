import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth/login_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: const Text('Dashboard')),
    body: FutureBuilder<DocumentSnapshot<Map<String, dynamic>>>(
      future: _getUserData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        }

        if (!snapshot.hasData || !snapshot.data!.exists) {
          return const Center(child: Text('No user data found.'));
        }

        final data = snapshot.data!.data()!;

        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.check_circle, color: Colors.green, size: 64),
              const SizedBox(height: 16),
              Text(
                'Welcome, ${data['fullName']}!',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text('Leave Balance: ${data['leaveBalance']} days'),
              Text('Today\'s Attendance: ${data['todayAttendance']}'),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  }
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        );
      },
    ),
  );
}
  Future<DocumentSnapshot<Map<String, dynamic>>> _getUserData() {
  final uid = FirebaseAuth.instance.currentUser!.uid;
  return FirebaseFirestore.instance.collection('users').doc(uid).get();
}
}