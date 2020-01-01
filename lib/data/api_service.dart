import 'package:chopper/chopper.dart';
import 'package:logging/logging.dart';

part 'api_service.chopper.dart';

@ChopperApi()
abstract class ApiService extends ChopperService {
  static ApiService create() {
    _setupLogging();
    final client = ChopperClient(
      baseUrl: 'http://192.168.0.5/apisamples/scripts/httpcallexamples/',
      services: [
        _$ApiService(),
      ],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'device': 'android', 'token': 'your token here'}),
        HttpLoggingInterceptor()
      ],
    );
    return _$ApiService(client);
  }

  @Get(path: 'getNoteList.php')
  Future<Response> getNoteList();

//  @Get(path: 'apiName')
//  Future<Response> getStudentById(@Query('id') int id);

//  @Get(path: 'apiName/{id}')
//  Future<Response> getStudentByIdPath(@Path('id') int id);

  @Post(path: 'addNoteBody.php')
  Future<Response> addNoteBody(
    @Body() Map<String, dynamic> body,
  );

  @FactoryConverter(request: FormUrlEncodedConverter.requestFactory)
  @Post(path: 'addNoteFormData.php')
  Future<Response> addNoteFormData(@Field('note') String note, @Field('date') String date, @Field('priority') String priority);
}

void _setupLogging() {
  Logger.root.level = Level.ALL;
  Logger.root.onRecord.listen((rec) {
    print('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
}
