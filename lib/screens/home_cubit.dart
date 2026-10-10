import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_api/models/article_model.dart';
import 'package:news_app_api/screens/home_state.dart';

class HomeCubit extends Cubit<HomeState>{
  HomeCubit() :super(HomeInitial());

  final dio =Dio();

  Future<void>getHomeData()async{

    try{

emit(HomeLoading());

      final Response response =await dio.get(
        'https://newsapi.org/v2/top-headlines',
queryParameters: {
'apiKey':'edfd2349450b4952a7f1e648c32a485d',
'country':'us',
}
    );
    final article =response.data['articles'] as List;

    final data= article.map((e) => ArticleModel.fromJson(e),).toList();
    emit(HomeSuccess(data));
    }
    on DioException catch(e){
      emit(HomeFailure(e.message?? 'dio excpetion'));
    }catch(e){
      emit(HomeFailure(e.toString()));
    }

   
  }

 Future<void> getSearchData({required String query}) async {
  try {
    emit(HomeLoading());
    final Response response = await dio.get(
      'https://newsapi.org/v2/everything',
      queryParameters: {
        'q': query, // تصحيح الإملاء واستخدام المتغير المُستقبل
        "apiKey": "6a2bfa8471a048ddab606150547fe945",
      },
    );
    final articles = response.data['articles'] as List;

    final data = articles.map((e) => ArticleModel.fromJson(e)).toList();
    
    emit(HomeSuccess(data));
  } on DioException catch (E) {
    emit(HomeFailure(E.message ?? 'DioExp'));
  } catch (e) {
    emit(HomeFailure(e.toString()));
  }
}

}