import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'join_game_state.dart';

class JoinGameCubit extends Cubit<JoinGameState> {
  JoinGameCubit() : super(const JoinGameData());

  void setName(String name) {
    final code = (state as JoinGameData).code;
    emit(JoinGameData(name: name, code: code));
  }

  void setCode(String code) {
    final name = (state as JoinGameData).name;
    emit(JoinGameData(name: name, code: code));
  }

  Future<void> joinGame() async {
    emit(const JoinGameLoading());
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(const JoinGameSuccess());
  }
}
