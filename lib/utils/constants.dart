// String url = "http://10.9.31.214";
// String url = "http://65.0.229.242";
String url = "http://ec2-65-0-229-242.ap-south-1.compute.amazonaws.com";
// String url = "http://127.0.0.1:10001";
// flutter run -d chrome --web-browser-flag "--disable-web-security"
// flutter run -d chrome --web-renderer html

Map<String, String> headers = {
  "Access-Control-Allow-Origin": "*",
  "Content-Type": "application/json",
  "Accept": "*/*"
};
