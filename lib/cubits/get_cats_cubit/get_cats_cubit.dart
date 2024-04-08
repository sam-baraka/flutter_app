import 'package:flutter_app/cat_service.dart';
import 'package:flutter_app/cubits/get_cats_cubit/get_cats_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetCatsCubit extends Cubit<GetCatsState> {
  GetCatsCubit() : super(const GetCatsInitial());

  void getCats() async {
    emit(const GetCatsLoading());

    var cats = await CatService().getCats();
    emit(GetCatsLoaded(cats));
  }
}
