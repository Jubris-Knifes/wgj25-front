import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'show_cards_state.dart';

class ShowCardsCubit extends Cubit<ShowCardsState> {
  ShowCardsCubit() : super(ShowCardsInitial());
}
