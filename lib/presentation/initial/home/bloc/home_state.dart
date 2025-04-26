import 'package:dsa_teaching_web/domain/category/icategory.dart';
import 'package:equatable/equatable.dart';

enum HomeStatus { initial, loading, failure }

class HomeState extends Equatable {
  const HomeState({
    this.status = HomeStatus.initial,
    this.lessonsSummary = const [],
  });

  HomeState copyWith({
    HomeStatus? status,
    List<ICategory>? lessonsSummary,
  }) {
    return HomeState(
      status: status ?? this.status,
      lessonsSummary: lessonsSummary ?? this.lessonsSummary,
    );
  }

  final HomeStatus status;
  final List<ICategory> lessonsSummary;

  @override
  List<Object?> get props => [
        lessonsSummary,
        status,
      ];
}
