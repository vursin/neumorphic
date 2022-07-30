import 'package:flutter_test/flutter_test.dart';
import 'package:neumorphism/neumorphism.dart';
import 'package:neumorphism/neumorphism_platform_interface.dart';
import 'package:neumorphism/neumorphism_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockNeumorphismPlatform 
    with MockPlatformInterfaceMixin
    implements NeumorphismPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final NeumorphismPlatform initialPlatform = NeumorphismPlatform.instance;

  test('$MethodChannelNeumorphism is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelNeumorphism>());
  });

  test('getPlatformVersion', () async {
    Neumorphism neumorphismPlugin = Neumorphism();
    MockNeumorphismPlatform fakePlatform = MockNeumorphismPlatform();
    NeumorphismPlatform.instance = fakePlatform;
  
    expect(await neumorphismPlugin.getPlatformVersion(), '42');
  });
}
