import 'package:emotion_tracker/feauture/main_page/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> {

  @override
  Widget build(BuildContext context) {
    final mainText = ref.watch(mainProvider.notifier).getSelectedScreen();
    final mainTime = ref.watch(mainProvider.notifier).getSelectedTime();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Title'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(mainTime.toString()),
            subtitle: Text(mainText.toString()),
          );
        },
      )
    );
  }
}