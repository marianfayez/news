abstract class HomeStates{}

class HomeInitState extends HomeStates {}

class GetSourcesLoadingState extends HomeStates{}
class GetSourcesErrorState extends HomeStates{
  String error;
  GetSourcesErrorState({required this.error});
}
class GetSourcesSuccessState extends HomeStates{}

class GetNewsLoadingState extends HomeStates{}
class GetNewsErrorState extends HomeStates{
  String error;
  GetNewsErrorState({required this.error});
}
class GetNewsSuccessState extends HomeStates{}

class ChangeSourcesIndex extends HomeStates{}