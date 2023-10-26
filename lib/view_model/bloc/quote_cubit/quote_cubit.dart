import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quote_task/view_model/bloc/quote_cubit/quote_state.dart';

import '../../../model/quote_model.dart';
import '../../data/network/dio_helper.dart';
import '../../data/network/end_points.dart';

class QuoteCubit extends Cubit<QuoteState> {
  QuoteCubit() : super(QuoteInitial());

  static QuoteCubit get(context) => BlocProvider.of<QuoteCubit>(context);
  QuoteModel? quoteModel;

  Future<void> getQouteData() async {
    emit(QuoteLoadingState());
    Response response = await DioHelper.get(endPoint: EndPoints.quoteTheDay);
    if (response.statusCode == 200) {
      quoteModel = QuoteModel.fromJson(response?.data);
      emit(QuoteSuccessState());
    } else {
      emit(QuoteErrorState());
    }
  }
}
