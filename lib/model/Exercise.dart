class Exercise {
  late String exerciseName;
  late String gifPath;
  late int setCount;
  late int setTime;
  late List<dynamic> muscleGroups;
  late int level;
  late int repeatCount;

  Exercise(
      {required this.exerciseName,
      required this.gifPath,
      required this.setCount,
      required this.setTime,
      required this.muscleGroups,
      required this.level,
      required this.repeatCount});

  Map<String, dynamic> toJson() => {
        "exerciseName": exerciseName,
        "gifPath": gifPath,
        "setCount": setCount,
        "muscleGroups": muscleGroups,
        "level": level,
        "setTime": setTime,
        "repeatCount": repeatCount
      };

  Exercise.fromJson(Map<String, dynamic> json)
      : setTime = json["setTime"],
        exerciseName = json["exerciseName"],
        gifPath = json["gifPath"],
        setCount = json["setCount"],
        muscleGroups = json["muscleGroups"],
        level = json["level"],
        repeatCount = json["repeatCount"];

  @override
  String toString() {
    return 'Exercise(exerciseName: $exerciseName, gifPath: $gifPath, setCount: $setCount, setTime: $setTime, muscleGroups: $muscleGroups, level: $level)';
  }
}
