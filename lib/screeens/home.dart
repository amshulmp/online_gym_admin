import 'package:flutter/material.dart';
import 'package:online_gym_admin/config/styles.dart';
import 'package:online_gym_admin/screeens/request.dart';

import 'package:online_gym_admin/screeens/trainers.dart';
import 'package:online_gym_admin/screeens/users.dart';

import 'package:online_gym_admin/widgets/tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("D A S H B O A R D"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.013),
            NeumorphicListTile(
              text: "Requests",
             
              imagePath: "lib/assets/email.png",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const RequestScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.013),
            NeumorphicListTile(
              text: "Trainers",
             
              imagePath: "lib/assets/fitness.png",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const TrainersScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.013),
            NeumorphicListTile(
              text: "Users",
             
              imagePath: "lib/assets/courses.png",
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => const UsersScreen(),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
