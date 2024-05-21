import 'package:flutter/material.dart';
import 'package:online_gym_admin/config/styles.dart';

class Textbox extends StatefulWidget {
  final TextInputType type;
  final IconData icon;
  final bool hideText;
  final TextEditingController tcontroller;
  final String hinttext;
  const Textbox({
    super.key,
    required this.hideText,
    required this.tcontroller,
    required this.type,
    required this.hinttext,
    required this.icon,
  });

  @override
  State<Textbox> createState() => _TextboxState();
}

class _TextboxState extends State<Textbox> {
  late bool show = widget.hideText;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      height: MediaQuery.of(context).size.height * 0.075,
      decoration: BoxDecoration(
        color: colorScheme.onSurfaceVariant,
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.01),
      ),
      child: Center(
        child: TextFormField(
          style: Styles.labelText(context),
          cursorColor: colorScheme.onPrimary,
          keyboardType: widget.type,
          controller: widget.tcontroller,
          obscureText: show,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon,color: colorScheme.onPrimary,),
            hintText: widget.hinttext,
            border: InputBorder.none,
            focusedBorder: InputBorder.none,
            focusedErrorBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            enabledBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            filled: true,
            fillColor: colorScheme.onSurfaceVariant,
            suffixIcon: widget.hideText
                ? IconButton(
                    icon: Icon(
                      show ? Icons.visibility : Icons.visibility_off,
                      color: colorScheme.onPrimary,
                    ),
                    onPressed: () {
                      setState(() {
                        show = !show;
                      });
                    },
                  )
                : const SizedBox(),
          ),
        ),
      ),
    );
  }
}
