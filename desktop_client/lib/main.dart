import 'package:backend_repository/backend_repository.dart';
import 'package:desktop_client/app/app.dart';
import 'package:desktop_client/bootstrap.dart';

void main() {
  bootstrap(
    ({
      required BackendRepository backendRepository,
    }) => App(
      backendRepository: backendRepository,
    ),
  );
}
