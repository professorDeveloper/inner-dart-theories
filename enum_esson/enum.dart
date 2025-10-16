enum AppServer {
  test('https://test.example.com'),
  dev('https://dev.example.com'),
  prod('https://api.example.com');

  final String url;
  const AppServer(this.url);
}

void main() {
  AppServer server = AppServer.prod;

  String url = server.url;

  print('Server name: ${server.name}');
  print('Server URL: $url');
}
