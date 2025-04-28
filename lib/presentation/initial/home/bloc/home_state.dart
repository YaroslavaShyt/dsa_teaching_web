import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, failure }

enum AddCategoryStatus { initial, active }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.addCategoryStatus = AddCategoryStatus.initial,
    this.lessonsSummary = const [],
  });

  HomeState copyWith({
    HomeStatus? status,
    List<ICategory>? lessonsSummary,
    AddCategoryStatus? addCategoryStatus,
  }) {
    return HomeState(
      status: status ?? this.status,
      lessonsSummary: lessonsSummary ?? this.lessonsSummary,
      addCategoryStatus: addCategoryStatus ?? this.addCategoryStatus,
    );
  }

  final HomeStatus status;
  final AddCategoryStatus addCategoryStatus;
  final List<ICategory> lessonsSummary;

  @override
  List<Object?> get props => [
        lessonsSummary,
        status,
        addCategoryStatus,
      ];
}
