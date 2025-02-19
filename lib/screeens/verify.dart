import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:online_gym_trainer/firebasefunctions.dart/functions.dart';
import 'package:online_gym_trainer/screeens/details.dart';
import 'package:online_gym_trainer/screeens/home.dart';

class VerifyScreen extends StatelessWidget {
  const VerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: firestore
              .collection("Trainers")
              .where("email", isEqualTo: auth.currentUser!.email)
              .snapshots(),
          builder: (BuildContext context,
              AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            }
            if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(child: Text('No user data found.'));
            }

            final userData = snapshot.data!.docs;
            final userMap = userData.first.data();

           if (userMap["isverified"]) {
  Future.delayed(Duration.zero, () {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
          if (userMap["type"] != null) {
            return const HomeScreen();
          } else {
            return const DetailsScreen();
          }
        },
      ),
    );
  });
}
 else {
              
            }

            return Center(
              child: Lottie.asset("lib/assets/Animation - 1711951385422.json"),
            );
          },
        ),
      ),
    );
  }
}
