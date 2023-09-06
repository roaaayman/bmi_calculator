abstract class counterstates{

}
class CounterInitialState extends counterstates{}
class CounterPlusState extends counterstates{
  final int counter;
  CounterPlusState(this.counter);
}
class CounterMinusState extends counterstates{
  final int counter;
  CounterMinusState(this.counter);
}