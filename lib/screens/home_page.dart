import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pertemuan_9/widget/info_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});


  @override
  Widget build(BuildContext context) {
    final user =FirebaseAuth.instance.currentUser;
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(15)
            ),
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: Colors.blue,
                    backgroundImage: user?.photoURL !=null? NetworkImage(
                      user!.photoURL!
                    ): null,
                    child: user?.photoURL == null
                      ? const Icon(
                          Icons.person,
                          size: 65,
                          color: Colors.blue,
                        )
                      : null,
                  ),
                  const SizedBox(height: 20,),
                  Text(
                    user?.displayName ?? 'Nama Belum diatur',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  const SizedBox(height: 20,),
                  InfoRow(
                    ikon: Icons.email, 
                    label: 'Email', 
                    value: user?.email ?? 'Email tidak tersedia'
                  ),
                  const SizedBox(height: 10,),
                  InfoRow(
                    ikon: Icons.fingerprint, 
                    label: 'User ID', 
                    value: user?.uid ?? 'User id tidak tersedia'
                  ),
                  const SizedBox(height: 10,),
                  InfoRow(
                    ikon: Icons.access_time, 
                    label: 'Last Login', 
                    value: user?.metadata.lastSignInTime !=null 
                            ? user!.metadata.lastSignInTime! 
                              .toLocal()
                              .toString() 
                            : ' tidak tersedia'
                  ),
                  const SizedBox(height: 25,),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () async {
                        await FirebaseAuth.instance.signOut();
                        if (!context.mounted) return;
                        Navigator.pushNamedAndRemoveUntil(
                          context, 
                          '/', 
                          (route)=>false
                          );
                        },
                        icon: const Icon(Icons.logout),
                        label: const Text('LOGOUT'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadiusGeometry.circular(12)
                          )
                        ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}