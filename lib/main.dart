import 'package:demo_exam/data/db/hive/tickets.dart';
import 'package:demo_exam/data/providers/event_provider.dart';
import 'package:demo_exam/presentation/navigation/navigation.dart';
import 'package:demo_exam/presentation/pages/event_details.dart';
import 'package:demo_exam/presentation/pages/new_ticket.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';

import 'data/db/hive/boxes.dart';

void main() async {
  await Hive.initFlutter();
  boxTickets = await Hive.openBox<Tickets>('tickets');
  runApp(
    ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
      routes: {
        '/event_details': (context) => const EventDetails(),
        '/new_ticket': (context) => const NewTicket(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Demo'),
      ),
      body: Navigation(),
    );
  }
}
