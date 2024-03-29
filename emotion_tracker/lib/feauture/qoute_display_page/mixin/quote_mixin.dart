import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../quate_page.dart';

mixin QuoteMixin on ConsumerState<QuatePage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      ref.read(quoteProvider.notifier).getQuote(widget.emotion);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
