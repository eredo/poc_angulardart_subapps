import 'package:pageloader/pageloader.dart';

// ignore: uri_has_not_been_generated
part 'groups_app_component_po.g.dart';

@PageObject()
abstract class GroupsAppComponentPO {

  @ByTagName('p')
  PageLoaderElement get _text;

  String get text => _text.innerText;

  GroupsAppComponentPO();
  factory GroupsAppComponentPO.create(PageLoaderElement context) = $GroupsAppComponentPO.create;
}