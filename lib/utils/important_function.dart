import 'package:url_launcher/url_launcher.dart';

launchUrlCustom({required String url, String? scheme}) async {
  if (scheme == null) {
    final Uri _url = Uri(path: url, scheme: scheme);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  } else {
    final Uri _url = Uri.parse(url);
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
