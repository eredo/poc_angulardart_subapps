import 'package:angular/angular.dart';

@Component(
  selector: 'stack-trace',
  template: '<button (click)="throwIt()">Throw exception</button>',
)
class StackTraceComponent {
  void throwIt() => throw new Exception('this is a test exception');
}