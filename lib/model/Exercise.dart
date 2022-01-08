class Exercise {
  late int exerciseId;
  late String exerciseName;
  late String gifPath;
  late int setCount;
  late int setTime;
  late List<String> muscleGroups;
  late int level;

  Exercise({
    required this.exerciseId,
    required this.exerciseName,
    required this.gifPath,
    required this.setCount,
    required this.setTime,
    required this.muscleGroups,
    required this.level,
  });
}
