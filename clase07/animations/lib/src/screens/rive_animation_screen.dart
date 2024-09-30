import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class RiveAnimationScreen extends StatefulWidget {
  const RiveAnimationScreen({super.key});

  @override
  State<RiveAnimationScreen> createState() => _RiveAnimationScreenState();
}

class _RiveAnimationScreenState extends State<RiveAnimationScreen> {
  Artboard? _riveArtboard;
  late SMIBool _dancing;
  late SMITrigger _lookingUp;

  @override
  void initState() {
    super.initState();
    rootBundle.load('assets/animations/rive.riv').then(
      (data) async {
        try {
          await RiveFile.initialize();
          final file = RiveFile.import(data);
          final artboard = file.mainArtboard;
          var controller = StateMachineController.fromArtboard(
            artboard,
            'birb',
          );
          if (controller != null) {
            artboard.addController(controller);
            _dancing = controller.findSMI('dance');
            _lookingUp = controller.findSMI('look up');
          }
          setState(() => _riveArtboard = artboard);
        } catch (e) {
          print(e);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text('Rive Animation')),
        body: _riveArtboard == null
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Expanded(child: Rive(artboard: _riveArtboard!)),
                  SwitchListTile(
                    onChanged: (value) => setState(
                      () => _dancing.value = value,
                    ),
                    title: const Text('Dance'),
                    value: _dancing.value,
                  ),
                  SwitchListTile(
                    onChanged: (value) => setState(
                      () => _lookingUp.value = value,
                    ),
                    title: const Text('Look up'),
                    value: _lookingUp.value,
                  ),
                ],
              ),
      );
}
