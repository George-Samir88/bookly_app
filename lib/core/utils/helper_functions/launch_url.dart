import 'package:bookly_app/core/utils/helper_functions/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> launchCustomUrl(String? url, context) async {
  if (url != null) {
    Uri urlParsed = Uri.parse(url);
    if (await canLaunchUrl(urlParsed)) {
      await launchUrl(urlParsed);
    } else {
      showCustomSnackBar(
        context: context,
        text: 'Cannot launch $urlParsed',
      );
    }
  }
}
