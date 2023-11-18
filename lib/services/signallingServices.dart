import 'package:socket_io_client/socket_io_client.dart';

class SignallingService {
  // Create instance of socket
  Socket? socket;
  SignallingService._();
  static final inst = SignallingService._();

  init({required String webSocketURL, required String callerID}) {
    // initialize socket
    socket = io(webSocketURL, {
      "transports": ['websocket'],
      "query": {"callerId": callerID}
    });

    // listen to onConnect
    socket?.onConnect((data) => print("WEBSOCKET CONNECTED "));

    // listen on Error
    socket?.onConnectError(
        (data) => print("Error while connecting to WEBSOCKET - ${data}"));

    // Connect the socket
    socket?.connect();
  }
}
