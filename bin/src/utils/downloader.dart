import 'dart:io';

Future download(String link, String name) {
  return (HttpClient()
      .getUrl(Uri.parse(link))
      .then((HttpClientRequest request) => request.close())
      .then((HttpClientResponse response) =>
          response.pipe(File(name).openWrite())));
}
