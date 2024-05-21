import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_gym_admin/config/functions.dart';
import 'package:online_gym_admin/config/styles.dart';
import 'package:online_gym_admin/widgets/tile.dart';

class TrainersScreen extends StatelessWidget {
  const TrainersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("T R A I N E R S"),
      ),
      body: StreamBuilder(
          stream: firestore
              .collection("Trainers")
              .where("isverified", isEqualTo: true)
              .snapshots(),
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
              return const Center(
                child: Text('there are no trainers.'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        NeumorphicListTile(
                          text: userData["username"],
                         
                          imagePath: "lib/assets/user (2).png",
                       ontap: () {  },
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.013,
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      );
  
  }
}
