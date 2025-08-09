import 'package:backend_repository/backend_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'join_game_state.dart';

class JoinGameCubit extends Cubit<JoinGameState> {
  JoinGameCubit({
    required this.backendRepository,
  }) : super(const JoinGameData());

  final BackendRepository backendRepository;

  void setName(String name) {
    final code = (state as JoinGameData).code;
    emit(JoinGameData(name: name, code: code));
  }

  void setCode(String code) {
    final name = (state as JoinGameData).name;
    emit(JoinGameData(name: name, code: code));
  }

  Future<void> joinGame() async {
    backendRepository.sendEvent(
      SetNameRequest(
        name: (state as JoinGameData).name ?? '',
      ),
    );
    emit(const JoinGameSuccess());
  }
}
