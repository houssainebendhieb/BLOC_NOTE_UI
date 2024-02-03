import 'package:flutter/material.dart';

class plusWidget extends StatelessWidget {
  const plusWidget({super.key,required this.addNotes});
  final void Function() addNotes;
  Widget build(context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(50)),
        child: IconButton(icon: const Icon(Icons.add), onPressed: addNotes));
  }
}
