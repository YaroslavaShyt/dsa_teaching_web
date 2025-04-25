import 'package:equatable/equatable.dart';

enum InitialStatus { loading, auth, main }

class InitialState extends Equatable {
  const InitialState({
    this.status = InitialStatus.loading,
  });

  InitialState copyWith({
    InitialStatus? status,
  }) {
    return InitialState(
      status: status ?? this.status,
    );
  }

  final InitialStatus status;

  @override
  List<Object?> get props => [
        status,
      ];
}
