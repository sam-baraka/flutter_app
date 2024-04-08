sealed class GetCatsState {
  const GetCatsState();
}

class GetCatsInitial extends GetCatsState {
  const GetCatsInitial();
}

class GetCatsLoading extends GetCatsState {
  const GetCatsLoading();
}

class GetCatsLoaded extends GetCatsState {
  final List<dynamic> cats;

  const GetCatsLoaded(this.cats);
}
