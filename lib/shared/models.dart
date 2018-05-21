import 'package:meta/meta.dart';

abstract class MenuItem {
  final String id;
  final String title;

  MenuItem({@required this.title, @required this.id});
}
