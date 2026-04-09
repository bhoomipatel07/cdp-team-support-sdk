/// The fixed set of helpdesk projects the backend recognises.
///
/// Host apps pick exactly one value and pass it to
/// [SupportSdkConfig.init] — the SDK then attaches this project to
/// every ticket created from the app, so there is no project picker
/// inside the ticket form.
enum SupportProject {
  cdpShopWeb(1, 'CDP Shop Web'),
  cdpStreamingWeb(2, 'CDP Streaming Web'),
  cdpStreamingIOS(3, 'CDP Streaming IOS'),
  cdpStreamingAndroid(4, 'CDP Streaming Android'),
  cdpPhotosFlutterApp(5, 'CDP Photos FlutterApp'),
  cdpPhotosWeb(6, 'CDP Photos Web');

  const SupportProject(this.id, this.displayName);

  /// Matches the `HelpdeskProjectId` column on the server.
  final int id;

  /// Human-readable label used as the `projectName` in API requests
  /// and for any read-only display inside the SDK.
  final String displayName;
}
