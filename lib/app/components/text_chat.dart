import 'package:flutter/material.dart';

class TextChat extends StatelessWidget {
  const TextChat({
    required this.isSender,
    Key? key,
  }) : super(key: key);
  final bool isSender;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: isSender ? Colors.green : Colors.white,
                  border: Border.all(color: Colors.grey)),
              child: Text(
                "LU DIMANA ANJING BALABADIK",
                style: TextStyle(fontSize: 12),
              )),
          Text("17.45")
        ],
      ),
    );
  }
}
