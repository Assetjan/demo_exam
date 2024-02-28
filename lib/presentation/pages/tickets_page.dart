import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class TicketsPage extends StatefulWidget {
  const TicketsPage({super.key});

  @override
  State<TicketsPage> createState() => _TicketsPageState();
}

class _TicketsPageState extends State<TicketsPage> {
  var tickets = Hive.openBox('tickets');
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Tickets List"),
        CustomButton(
          width: 100,
          backgroundColor: Colors.blue,
          isThreeD: true,
          height: 50,
          borderRadius: 25,
          animate: true,
          margin: const EdgeInsets.all(10),
          title: 'Create',
          onPressed: () {
            Navigator.pushNamed(context, '/new_ticket');
          },
        ),
      ],
    );
  }
}
