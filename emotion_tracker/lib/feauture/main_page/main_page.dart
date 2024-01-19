import 'package:animated_emoji/animated_emoji.dart';
import 'package:emotion_tracker/feauture/main_page/main_view_mixin/main_view_mixin.dart';
import 'package:emotion_tracker/product/constants/color_constants.dart';
import 'package:emotion_tracker/product/constants/string_constants.dart';
import 'package:emotion_tracker/product/widgets/custom_app_bar.dart';
import 'package:emotion_tracker/product/widgets/texts/title_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kartal/kartal.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  MainViewMixin mainViewMixin = MainViewMixin();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          StringConstants.appName,
          onPressed: () {},
          preferredSize: const Size.fromHeight(kToolbarHeight),
          child: const SizedBox.shrink(),
        ),
        body: Column(
          children: [
            const Center(
              child: TitleText(
                  title: StringConstants.mainTitle,
                  color: ColorConstants.textTitleColor),
            ),
            Expanded(
                child: Padding(
              padding: context.padding.horizontalNormal,
              child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 25,
                      childAspectRatio: 2,
                      mainAxisSpacing: 25,
                      crossAxisCount: 2),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: ColorConstants.positiveEmotionsColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: context.padding.onlyLeftLow,
                        child: Row(
                          children: [
                            Padding(
                              padding: context.padding.low,
                              child: const AnimatedEmoji(
                                AnimatedEmojis.hotFace,
                              ),
                            ),
                            Text(
                              mainViewMixin.emotions[index],
                              style: GoogleFonts.roboto(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.textTitleColor),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  itemCount: mainViewMixin.emotions.length),
            )),
          ],
        ));
  }
}
