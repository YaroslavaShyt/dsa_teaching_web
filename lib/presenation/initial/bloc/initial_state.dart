import 'package:equatable/equatable.dart';

enum InitialStatus { loading, auth, main }

class InitialState extends Equatable {
  const InitialState({
    this.status = InitialStatus.loading,
  });

  final InitialStatus status;

  @override
  List<Object?> get props => [
        status,
      ];
}
