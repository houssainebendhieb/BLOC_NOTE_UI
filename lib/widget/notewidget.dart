import 'package:flutter/material.dart';

class noteWidget extends StatelessWidget {
  const noteWidget({super.key, required this.text});
  final String text;

  @override
  Widget build(context) {
    return Container(
        width: 300,
        height: 35,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(text,
                  style: const TextStyle(color: Colors.black87, fontSize: 15)),
            ),
            IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () {},
            )
          ],
        ));
  }
}
