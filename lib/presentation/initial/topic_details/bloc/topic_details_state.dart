import 'package:dsa_teaching_web/domain/game/igame.dart';
import 'package:dsa_teaching_web/domain/theory/ilesson_theory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:equatable/equatable.dart';

enum TopicDetailsStatus { loading, success, nothingFound }

enum Mode { read, edit, add }

class TopicDetailsState extends Equatable {
  const TopicDetailsState({
    this.topic,
    this.status = TopicDetailsStatus.loading,
    this.selectedLessonId,
    this.selectedGame,
    this.selectedTheory,
    this.mode = Mode.read,
  });

  TopicDetailsState copyWith({
    ITopic? topic,
    TopicDetailsStatus? status,
    int? selectedLessonId,
    ILessonTheory? selectedTheory,
    IGame? selectedGame,
    Mode? mode,
  }) {
    return TopicDetailsState(
      topic: topic ?? this.topic,
      status: status ?? this.status,
      selectedLessonId: selectedLessonId ?? this.selectedLessonId,
      selectedGame: selectedGame ?? this.selectedGame,
      selectedTheory: selectedTheory ?? this.selectedTheory,
      mode: mode ?? this.mode,
    );
  }

  final int? selectedLessonId;
  final TopicDetailsStatus status;
  final ITopic? topic;
  final ILessonTheory? selectedTheory;
  final IGame? selectedGame;
  final Mode mode;

  @override
  List<Object?> get props => [
        status,
        topic,
        selectedLessonId,
        selectedTheory,
        selectedGame,
        mode,
      ];
}
