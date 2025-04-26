enum GameAnswersType {
  row('row'),
  card('card');

  const GameAnswersType(this.apiString);

  final String apiString;

  static GameAnswersType apiToType(String api) {
    return switch (api) {
      'row' => GameAnswersType.row,
      'card' => GameAnswersType.card,
      _ => GameAnswersType.row,
    };
  }
}
