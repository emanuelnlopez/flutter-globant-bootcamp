import 'package:android_plugin/android_plugin.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _androidPlugin = AndroidPlugin();

  var _deviceName = 'Unknown';
  var _platformVersion = 'Unknown';
  var _screenshotsEnabled = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await _androidPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    String deviceName;
    try {
      deviceName =
          await _androidPlugin.getDeviceName() ?? 'Unknown device name';
    } on PlatformException {
      deviceName = 'Failed to get device name.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      _deviceName = deviceName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Plugin example app')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _NameValueText(name: 'OS Version: ', value: _platformVersion),
            _NameValueText(name: 'Device Name: ', value: _deviceName),
            _NameValueText(
              name: 'Screenshots: ',
              value: _screenshotsEnabled ? 'ENABLED' : 'DISABLED',
            ),
            _EnableScreenshotsButton(
              screenshotsEnabled: _screenshotsEnabled,
              onPressed: () async {
                _screenshotsEnabled = !_screenshotsEnabled;
                await _androidPlugin.setScreenshotEnabled(
                  _screenshotsEnabled,
                );
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _NameValueText extends StatelessWidget {
  const _NameValueText({
    required this.name,
    required this.value,
  });

  final String name;
  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: RichText(
        text: TextSpan(
          text: name,
          style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w500),
          children: [
            TextSpan(
              text: value,
              style: textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class _EnableScreenshotsButton extends StatelessWidget {
  const _EnableScreenshotsButton({
    required this.screenshotsEnabled,
    required this.onPressed,
  });

  final bool screenshotsEnabled;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          screenshotsEnabled ? 'DISABLE Screenshots' : 'ENABLE Screenshots',
          style: theme.textTheme.titleMedium?.copyWith(
            color: screenshotsEnabled ? Colors.red : Colors.green,
          ),
        ),
      ),
    );
  }
}
