import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class NewTicket extends StatefulWidget {
  const NewTicket({super.key});

  @override
  State<NewTicket> createState() => _NewTicketState();
}

class _NewTicketState extends State<NewTicket> {
  TextEditingController nameController = TextEditingController();
  TextEditingController seatController = TextEditingController();
  @override
  void dispose() {
    nameController.dispose();
    seatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    void onChange(dynamic) {}
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          Text('New Ticket'),
          TextField(
            controller: nameController,
            decoration: InputDecoration(hintText: 'Name'),
          ),
          TextField(
            controller: seatController,
            decoration: InputDecoration(hintText: 'Seat name'),
          ),
          CustomButton(
            height: 30,
            title: 'Create',
            onPressed: () async {
              var box = await Hive.openBox("tickets");
              box.put(
                'name',
                nameController.text,
              );
              box.put('seat', seatController.text);
            },
          ),
        ],
      ),
    );
  }
}
