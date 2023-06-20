abstract class AppEvents{
  const AppEvents();
}

class ChangeBottomNavBarEvent extends AppEvents{
  final int index;
  const ChangeBottomNavBarEvent(this.index) :super();
}