

import 'package:dio/dio.dart';

class PRrojectDioMixin {

 final service =  Dio(BaseOptions(baseUrl: 'https://reqres.in/api' ));

}
