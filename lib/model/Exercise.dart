class Exercise {
  late String exerciseName;
  late String gifPath;
  late int setCount;
  late int setTime;
  late List<String> muscleGroups;
  late int level;

  Exercise({
    required this.exerciseName,
    required this.gifPath,
    required this.setCount,
    required this.setTime,
    required this.muscleGroups,
    required this.level,
  });

  Map<String, dynamic> toJson() => {
        "exerciseName": exerciseName,
        "gifPath": gifPath,
        "setCount": setCount,
        "muscleGroups": muscleGroups,
        "level": level
      };

  Exercise.fromJson(Map<String, dynamic> json)
      : exerciseName = json["exerciseName"],
        gifPath = json["gifPath"],
        setCount = json["setCount"],
        muscleGroups = json["muscleGroups"],
        level = json["level"];

  @override
  String toString() {
    return 'Exercise(exerciseName: $exerciseName, gifPath: $gifPath, setCount: $setCount, muscleGroups: $muscleGroups, level: $level)';
  }
}
