@TestOn('browser')

import 'package:angular_test/angular_test.dart';
import 'package:groups_app/groups_app_component.dart';
import 'package:groups_app/groups_app_component.template.dart' as ng;
import 'package:test/test.dart';
import 'package:pageloader/html.dart';

import 'groups_app_component_po.dart';

void main() {
  final testBed =
  NgTestBed.forComponent<GroupsAppComponent>(ng.GroupsAppComponentNgFactory);
  NgTestFixture<GroupsAppComponent> fixture;
  GroupsAppComponentPO appPO;

  setUp(() async {
    fixture = await testBed.create();
    final context =
    new HtmlPageLoaderElement.createFromElement(fixture.rootElement);
    appPO = new GroupsAppComponentPO.create(context);
  });

  tearDown(disposeAnyRunningTest);

  test('default print', () {
    expect(appPO.text, 'Title: hello');
  });

  test('contains header', () => expect(fixture.text, contains('Groups app')));
}