import 'package:flutter/material.dart';

class EventDetails extends StatelessWidget {
  const EventDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Event Detail"),
        SizedBox(
          height: 15,
        ),
        Text("Event Detail"),
        Flex(
          direction: Axis.horizontal,
          children: [
            Image(image: AssetImage('')),
            SizedBox(
              height: 5,
            ),
            Image(image: AssetImage('')),
            SizedBox(
              height: 5,
            ),
            Image(image: AssetImage('')),
          ],
        ),
        Text("Event Detail"),
      ],
    );
  }
}
