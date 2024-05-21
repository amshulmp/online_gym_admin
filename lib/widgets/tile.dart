import 'package:flutter/material.dart';
import 'package:online_gym_admin/config/styles.dart';
import 'package:online_gym_admin/widgets/neumorphicbox.dart';

class NeumorphicListTile extends StatelessWidget {
  final String text;
  final dynamic count;
  final String imagePath;
  final VoidCallback ontap;

  const NeumorphicListTile({
    super.key,
    required this.text,
     this.count=const SizedBox(),
    required this.imagePath,
     required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return NeumorphicBox(
      child: ListTile(
        onTap: ontap,
        leading: Image.asset(imagePath),
        title: Text(
          text,
          style: Styles.labelText(context),
        ),
        trailing: count
      ),
    );
  }
}
