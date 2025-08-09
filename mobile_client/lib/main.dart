import 'package:backend_repository/backend_repository.dart';
import 'package:mobile_client/app/app.dart';
import 'package:mobile_client/bootstrap.dart';

void main() {
  bootstrap(
    ({
      required BackendRepository backendRepository,
    }) => App(
      backendRepository: backendRepository,
    ),
  );
}
