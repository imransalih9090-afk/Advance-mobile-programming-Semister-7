import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Business Card',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const ProfileCard(),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  // Main background color
  static const Color teal = Color(0xFF169B91);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: teal,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 35),

            child: Column(
              children: [
                const SizedBox(height: 130),

                // -------------------------
                // PROFILE IMAGE
                // -------------------------
                Container(
                  width: 140,
                  height: 140,

                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white70,
                      width: 2,
                    ),
                  ),

                  child: ClipOval(
                    child: Image.network(
                      'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde',
                      fit: BoxFit.cover,

                      // If image cannot load
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey.shade300,
                          child: const Icon(
                            Icons.person,
                            size: 80,
                            color: Colors.grey,
                          ),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                // -------------------------
                // NAME
                // -------------------------
                const Text(
                  'Crépin Fadjo',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'cursive',
                  ),
                ),

                const SizedBox(height: 8),

                // -------------------------
                // JOB TITLE
                // -------------------------
                const Text(
                  'FLUTTER DEVELOPER',
                  style: TextStyle(
                    color: Color(0xFFB9E1DE),
                    fontSize: 21,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 3,
                  ),
                ),

                const SizedBox(height: 18),

                // -------------------------
                // DIVIDER
                // -------------------------
                Container(
                  width: 210,
                  height: 1,
                  color: Colors.white38,
                ),

                const SizedBox(height: 28),

                // -------------------------
                // PHONE CARD
                // -------------------------
                ContactCard(
                  icon: Icons.phone,
                  text: '+229 96119149',
                ),

                const SizedBox(height: 22),

                // -------------------------
                // EMAIL CARD
                // -------------------------
                ContactCard(
                  icon: Icons.email,
                  text: 'fadcrepin@gmail.com',
                ),

                const SizedBox(height: 100),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// =====================================================
// CONTACT CARD
// =====================================================

class ContactCard extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactCard({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 78,

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius: BorderRadius.circular(6),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),

      child: Row(
        children: [
          const SizedBox(width: 25),

          // Icon
          Icon(
            icon,
            color: const Color(0xFF169B91),
            size: 30,
          ),

          const SizedBox(width: 35),

          // Text
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                color: Color(0xFF286B67),
                fontSize: 22,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
