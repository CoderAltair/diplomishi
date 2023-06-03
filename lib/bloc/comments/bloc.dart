import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
part 'event.dart';
part 'state.dart';

class SendCommentsBloc extends Bloc<SendCommentsEvent, SendCommentsState> {
  SendCommentsBloc() : super(SendCommentsInitial()) {
    on<StartSendCommentEvent>(send);
  }

  Future<Map> getDeviceInfo() async {
    Map<String, dynamic> deviceInfo = {};
    final deviceInfoPlugin = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final builder = await deviceInfoPlugin.androidInfo;
      deviceInfo['name'] = builder.manufacturer;
      deviceInfo['model'] = builder.model;
    } else {
      final data = await deviceInfoPlugin.iosInfo;
      deviceInfo['model'] = data.model;
      deviceInfo['name'] = data.name;
    }

    return deviceInfo;
  }

  Future<void> send(
    StartSendCommentEvent event,
    Emitter<SendCommentsState> emit,
  ) async {
    emit(SendCommentsProcces());
    Future<String> logToString(String comments, int status) async {
      final String platform = Platform.isAndroid ? 'Android' : 'iOS';
      const String mode = kDebugMode ? 'debug' : 'release';
      final Map deviceInfo = await getDeviceInfo();
      String userData = 'Comments';
      String formattedDate =
          DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now());
      final String logString = """
<b>$formattedDate</b>
$userData
<b>URL:</b> "https://api.telegram.org
<b>Path:</b> 'GameCard/comments'
<b>Status code:</b> $status 
<b>Method:</b> "Pos"
<b>Platform:</b> $platform
<b>Model:</b> ${deviceInfo['name']} ${deviceInfo['model']}
<b>Comments:</b> $comments
<b>Version</b> <a href = "1.0.0"> $mode</a>
""";
      return logString;
    }

    //////////////////////////////////////////////////////////////////////////
    String message = await logToString(event.comment, 200);
    Uri url = Uri.parse(
        'https://api.telegram.org/bot6032616671:AAHTIqR13QpBZjNX5DXF6pLhrBcw6FDEjHY/sendMessage?chat_id=-1001509215007&parse_mode=html&text=$message');
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      emit(SendCommentsSuccesState());
    } else {
      emit(SendCommentsFailureState());
    }
  }
}
