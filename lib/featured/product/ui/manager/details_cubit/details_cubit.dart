import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


import '../../../domain/entities/product_entity.dart';
import '../../../domain/use_case/details_use_case.dart';

part 'details_state.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit(this._detailsUseCase) : super(DetailsInitial());

  final DetailsUseCase _detailsUseCase;

  Future<void> getDetails(int id)async{
    emit(DetailsLoading());
    var data = await _detailsUseCase.call(id);
    data.fold((e){
      emit(DetailsError(e.message!));
    }, (details){
      emit(DetailsSuccess(details));
    });
  }
}
