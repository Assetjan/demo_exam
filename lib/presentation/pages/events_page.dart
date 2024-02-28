import 'package:custom_button_builder/custom_button_builder.dart';
import 'package:demo_exam/data/providers/event_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventsPage extends StatefulWidget {
  const EventsPage({super.key});

  @override
  State<EventsPage> createState() => _EventsPageState();
}

class _EventsPageState extends State<EventsPage> {
  @override
  Widget build(BuildContext context) {
    final eventProvider = Provider.of<EventProvider>(context, listen: false);
    eventProvider.init();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Text(
          'Events',
          style: TextStyle(fontSize: 20),
        ),
        Flex(
          mainAxisAlignment: MainAxisAlignment.center,
          direction: Axis.horizontal,
          children: [
            CustomButton(
              width: 100,
              backgroundColor: Colors.blue,
              isThreeD: true,
              height: 50,
              borderRadius: 25,
              animate: true,
              margin: const EdgeInsets.all(10),
              title: 'All',
              onPressed: () {},
            ),
            SizedBox(
              width: 10,
            ),
            CustomButton(
              width: 100,
              backgroundColor: Colors.blue,
              isThreeD: true,
              height: 50,
              borderRadius: 25,
              animate: true,
              margin: const EdgeInsets.all(10),
              title: 'Unread',
              onPressed: () {},
            ),
            SizedBox(
              width: 10,
            ),
            CustomButton(
              width: 100,
              backgroundColor: Colors.blue,
              isThreeD: true,
              height: 50,
              borderRadius: 25,
              animate: true,
              margin: const EdgeInsets.all(10),
              title: 'Read',
              onPressed: () {},
            ),
          ],
        ),
        Consumer<EventProvider>(builder: (context, data, child) {
          return Expanded(
            child: data.events.isNotEmpty
                ? eventList(data.events)
                : const Text(
                    'No results found',
                    style: TextStyle(fontSize: 24),
                  ),
          );
        }),
      ],
    );
  }
}

Widget eventList(List<Map<String, dynamic>> data) {
  return Expanded(
    child: ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Row(
              children: [
                SizedBox(
                  width: 5,
                ),
                Image.asset('assets/images/events_00_A.jpg'),
                SizedBox(
                  width: 5,
                ),
                Column(
                  children: [
                    Text('data'),
                    SizedBox(
                      height: 3,
                    ),
                    Text('data'),
                    SizedBox(
                      height: 3,
                    ),
                    Text('data'),
                  ],
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
          ],
        );
      },
    ),
  );
}
