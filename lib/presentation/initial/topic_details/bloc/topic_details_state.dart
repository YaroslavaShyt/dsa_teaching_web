import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/theory/ilesson_theory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:equatable/equatable.dart';

enum TopicDetailsStatus { loading, success, nothingFound }

class TopicDetailsState extends Equatable {
  const TopicDetailsState({
    this.topic,
    this.status = TopicDetailsStatus.loading,
    this.selectedLessonId = '',
    this.selectedGame,
    this.selectedTheory,
  });

  TopicDetailsState copyWith({
    ITopic? topic,
    TopicDetailsStatus? status,
    String? selectedLessonId,
    ILessonTheory? selectedTheory,
    IGame? selectedGame,
  }) {
    return TopicDetailsState(
      topic: topic ?? this.topic,
      status: status ?? this.status,
      selectedLessonId: selectedLessonId ?? this.selectedLessonId,
      selectedGame: selectedGame ?? this.selectedGame,
      selectedTheory: selectedTheory ?? this.selectedTheory,
    );
  }

  final String selectedLessonId;
  final TopicDetailsStatus status;
  final ITopic? topic;
  final ILessonTheory? selectedTheory;
  final IGame? selectedGame;

  @override
  List<Object?> get props => [
        status,
        topic,
        selectedLessonId,
        selectedTheory,
        selectedGame,
      ];
}
