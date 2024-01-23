import 'package:emotion_tracker/feauture/history_page/provider/history_provider.dart';
import 'package:emotion_tracker/product/constants/color_constants.dart';
import 'package:emotion_tracker/product/constants/string_constants.dart';
import 'package:emotion_tracker/product/widgets/custom_app_bar.dart';
import 'package:emotion_tracker/product/widgets/texts/button_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kartal/kartal.dart';
import 'mixin/history_mixin.dart';

// * State notifier provider created to be used in the profile page
final historyProvider =
    StateNotifierProvider<HistoryProvider, HistoryState>((ref) {
  return HistoryProvider();
});

class HistoryPage extends ConsumerStatefulWidget {
  const HistoryPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HistoryPageState();
}

class _HistoryPageState extends ConsumerState<HistoryPage> with HistoryMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(StringConstants.historyTitle,
          preferredSize: const Size.fromHeight(kToolbarHeight), onPressed: () {
        context.route.pop();
      }, child: const SizedBox.shrink()),
      body: FutureBuilder(
        future: ref.read(historyProvider.notifier).getSelectedHistory(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasError) {
            return errorText();
          } else {
            List<String> emotionList = [];

            if (snapshot.data is String) {
              emotionList = [snapshot.data];
            } else if (snapshot.data is List<String>) {
              emotionList = snapshot.data;
            }
            return ListView.builder(
              itemCount: emotionList.length,
              itemBuilder: (context, index) {
                String emotionInfo = emotionList[index];
                List<String> emotionInfoParts = splitEmotionInfo(emotionInfo);

                if (emotionInfoParts.length == 2) {
                  String emotion = emotionInfoParts[0];
                  String timeString = emotionInfoParts[1];
                  timeString = convertToDateTime(timeString);
                  return ListTile(
                      leading: HistoryText(
                        text: emotion,
                        textColor: ColorConstants.negativeEmotionsColor,
                      ),
                      trailing: HistoryText(
                        text: timeString,
                        textColor: ColorConstants.primaryWhite,
                      ));
                } else {
                  return const CircularProgressIndicator();
                }
              },
            );
          }
        },
      ),
    );
  }

  Text errorText() => const Text(StringConstants.error);
}
