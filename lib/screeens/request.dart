import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:online_gym_admin/config/functions.dart';

import 'package:online_gym_admin/widgets/tile.dart'; 
class RequestScreen extends StatelessWidget {
  const RequestScreen({super. key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Trainers"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13.0),
        child: StreamBuilder(
          stream: firestore
              .collection("Trainers")
              .where("isverified", isEqualTo: false)
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
                child: Text('You have no pending requests.'),
              );
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext context, int index) {
                  final userData = snapshot.data!.docs[index].data() as Map<String, dynamic>;
                  return Column(
                    children: [
                      NeumorphicListTile(
                        text: userData["username"],
                        count: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed:() async{
                                await updateprofile({"isverified":true},userData["email"]);
                              },
                              icon: const Icon(Icons.done, color: Colors.black),
                            ),
                            IconButton(
                              onPressed: () {
                              
                              },
                              icon: const Icon(Icons.cancel, color: Colors.black),
                            ),
                          ],
                        ),
                        imagePath: "lib/assets/user (2).png",
                     ontap: () {  },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.013,
                      ),
                    ],
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}


//  return Column(
          //     children: [
          //       NeumorphicListTile(
          //         text: "trainer$index",
          //         count: Row(
          //           mainAxisSize: MainAxisSize.min,
          //           children: [
          //             IconButton(onPressed: (){}, icon:const Icon( Icons.done,color: Colors.black,)),
          //             IconButton(onPressed: (){}, icon:const Icon( Icons.cancel,color: Colors.black,))
          //           ],
          //         ),
          //         imagePath: "lib/assets/user (2).png",
          //         ontap: () {},
          //       ),
          //         SizedBox(
          //   height:  MediaQuery.of(context).size.height * 0.013
          //  ),
          //     ],
          //   );