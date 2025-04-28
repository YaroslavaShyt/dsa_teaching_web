import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:dsa_teaching_web/domain/topic/itopic.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, failure }

enum AddCategoryStatus { initial, active, edit }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.addCategoryStatus = AddCategoryStatus.initial,
    this.lessonsSummary = const [],
    this.selectedTopic,
    this.selectedCategoryId,
  });

  HomeState copyWith({
    HomeStatus? status,
    List<ICategory>? lessonsSummary,
    AddCategoryStatus? addCategoryStatus,
    ITopic? selectedTopic,
    int? selectedCategoryId,
  }) {
    return HomeState(
      status: status ?? this.status,
      lessonsSummary: lessonsSummary ?? this.lessonsSummary,
      addCategoryStatus: addCategoryStatus ?? this.addCategoryStatus,
      selectedTopic: addCategoryStatus == AddCategoryStatus.initial
          ? null
          : selectedTopic ?? this.selectedTopic,
      selectedCategoryId: selectedCategoryId ?? this.selectedCategoryId,
    );
  }

  final HomeStatus status;
  final AddCategoryStatus addCategoryStatus;
  final List<ICategory> lessonsSummary;
  final ITopic? selectedTopic;
  final int? selectedCategoryId;

  @override
  List<Object?> get props => [
        lessonsSummary,
        status,
        addCategoryStatus,
        selectedTopic,
        selectedCategoryId,
      ];
}
