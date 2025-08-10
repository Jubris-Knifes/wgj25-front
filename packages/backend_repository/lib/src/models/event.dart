// We want a default case for the switch statement
// ignore_for_file: no_default_cases

import 'package:backend_repository/backend_repository.dart';

abstract class Event {
  const Event({required this.type});

  factory Event.fromJson(Map<String, dynamic> json) {
    final type = EventType.fromKey(json['type'] as String);
    final payload = json['event_data'] as Map<String, dynamic>?;
    try {
      switch (type) {
        case EventType.playerJoin:
          return PlayerJoinEvent.fromJson(payload ?? {});
        case EventType.cardsDealt:
          return CardsDealtEvent.fromJson(payload ?? {});
        case EventType.chooseBid:
          return ChooseBidEvent.fromJson(payload ?? {});
        case EventType.bidSelected:
          return BidSelectedEvent.fromJson(payload ?? {});
        case EventType.showBackOfCardBid:
          return ShowBackOfCardBidEvent.fromJson(payload ?? {});
        case EventType.chooseOffer:
          return ChooseOfferEvent.fromJson(payload ?? {});
        case EventType.offerSelected:
          return OfferSelectedEvent.fromJson(payload ?? {});
        default:
          return const Noise();
      }
    } catch (e) {
      return const Noise();
    }
  }

  final EventType type;

  Map<String, dynamic> toJson();
}

class Noise extends Event {
  const Noise() : super(type: EventType.noise);

  @override
  Map<String, dynamic> toJson() => throw Error();
}

enum EventType {
  playerJoin('player_joined'),
  setNameRequest('set_name_request'),
  cardsDealt('cards_dealt'),
  chooseBid('choose_bid'),
  bidSelected('bid_selected'),
  showBackOfCardBid('show_back_of_card_bid'),
  chooseOffer('choose_offer'),
  offerSelected('offer_selected'),
  noise('');

  const EventType(this.key);

  final String key;

  static EventType fromKey(String key) => EventType.values.firstWhere(
    (e) => e.key == key,
    orElse: () => EventType.noise,
  );
}
