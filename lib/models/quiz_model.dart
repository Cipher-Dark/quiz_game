import 'dart:convert';

class QuizModel {
  int id;
  dynamic name;
  String title;
  String description;
  dynamic difficultyLevel;
  String topic;
  DateTime time;
  bool isPublished;
  DateTime createdAt;
  DateTime updatedAt;
  int duration;
  DateTime endTime;
  String negativeMarks;
  String correctAnswerMarks;
  bool shuffle;
  bool showAnswers;
  bool lockSolutions;
  bool isForm;
  bool showMasteryOption;
  dynamic readingMaterial;
  dynamic quizType;
  bool isCustom;
  dynamic bannerId;
  dynamic examId;
  bool showUnanswered;
  DateTime endsAt;
  dynamic lives;
  String liveCount;
  int coinCount;
  int questionsCount;
  String dailyDate;
  int maxMistakeCount;
  List<dynamic> readingMaterials;
  List<Question> questions;
  int progress;

  QuizModel({
    required this.id,
    required this.name,
    required this.title,
    required this.description,
    required this.difficultyLevel,
    required this.topic,
    required this.time,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.duration,
    required this.endTime,
    required this.negativeMarks,
    required this.correctAnswerMarks,
    required this.shuffle,
    required this.showAnswers,
    required this.lockSolutions,
    required this.isForm,
    required this.showMasteryOption,
    required this.readingMaterial,
    required this.quizType,
    required this.isCustom,
    required this.bannerId,
    required this.examId,
    required this.showUnanswered,
    required this.endsAt,
    required this.lives,
    required this.liveCount,
    required this.coinCount,
    required this.questionsCount,
    required this.dailyDate,
    required this.maxMistakeCount,
    required this.readingMaterials,
    required this.questions,
    required this.progress,
  });

  QuizModel copyWith({
    int? id,
    dynamic name,
    String? title,
    String? description,
    dynamic difficultyLevel,
    String? topic,
    DateTime? time,
    bool? isPublished,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? duration,
    DateTime? endTime,
    String? negativeMarks,
    String? correctAnswerMarks,
    bool? shuffle,
    bool? showAnswers,
    bool? lockSolutions,
    bool? isForm,
    bool? showMasteryOption,
    dynamic readingMaterial,
    dynamic quizType,
    bool? isCustom,
    dynamic bannerId,
    dynamic examId,
    bool? showUnanswered,
    DateTime? endsAt,
    dynamic lives,
    String? liveCount,
    int? coinCount,
    int? questionsCount,
    String? dailyDate,
    int? maxMistakeCount,
    List<dynamic>? readingMaterials,
    List<Question>? questions,
    int? progress,
  }) =>
      QuizModel(
        id: id ?? this.id,
        name: name ?? this.name,
        title: title ?? this.title,
        description: description ?? this.description,
        difficultyLevel: difficultyLevel ?? this.difficultyLevel,
        topic: topic ?? this.topic,
        time: time ?? this.time,
        isPublished: isPublished ?? this.isPublished,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        duration: duration ?? this.duration,
        endTime: endTime ?? this.endTime,
        negativeMarks: negativeMarks ?? this.negativeMarks,
        correctAnswerMarks: correctAnswerMarks ?? this.correctAnswerMarks,
        shuffle: shuffle ?? this.shuffle,
        showAnswers: showAnswers ?? this.showAnswers,
        lockSolutions: lockSolutions ?? this.lockSolutions,
        isForm: isForm ?? this.isForm,
        showMasteryOption: showMasteryOption ?? this.showMasteryOption,
        readingMaterial: readingMaterial ?? this.readingMaterial,
        quizType: quizType ?? this.quizType,
        isCustom: isCustom ?? this.isCustom,
        bannerId: bannerId ?? this.bannerId,
        examId: examId ?? this.examId,
        showUnanswered: showUnanswered ?? this.showUnanswered,
        endsAt: endsAt ?? this.endsAt,
        lives: lives ?? this.lives,
        liveCount: liveCount ?? this.liveCount,
        coinCount: coinCount ?? this.coinCount,
        questionsCount: questionsCount ?? this.questionsCount,
        dailyDate: dailyDate ?? this.dailyDate,
        maxMistakeCount: maxMistakeCount ?? this.maxMistakeCount,
        readingMaterials: readingMaterials ?? this.readingMaterials,
        questions: questions ?? this.questions,
        progress: progress ?? this.progress,
      );

  factory QuizModel.fromRawJson(String str) => QuizModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory QuizModel.fromJson(Map<String, dynamic> json) => QuizModel(
        id: json["id"],
        name: json["name"],
        title: json["title"],
        description: json["description"],
        difficultyLevel: json["difficulty_level"],
        topic: json["topic"],
        time: DateTime.parse(json["time"]),
        isPublished: json["is_published"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        duration: json["duration"],
        endTime: DateTime.parse(json["end_time"]),
        negativeMarks: json["negative_marks"],
        correctAnswerMarks: json["correct_answer_marks"],
        shuffle: json["shuffle"],
        showAnswers: json["show_answers"],
        lockSolutions: json["lock_solutions"],
        isForm: json["is_form"],
        showMasteryOption: json["show_mastery_option"],
        readingMaterial: json["reading_material"],
        quizType: json["quiz_type"],
        isCustom: json["is_custom"],
        bannerId: json["banner_id"],
        examId: json["exam_id"],
        showUnanswered: json["show_unanswered"],
        endsAt: DateTime.parse(json["ends_at"]),
        lives: json["lives"],
        liveCount: json["live_count"],
        coinCount: json["coin_count"],
        questionsCount: json["questions_count"],
        dailyDate: json["daily_date"],
        maxMistakeCount: json["max_mistake_count"],
        readingMaterials: List<dynamic>.from(json["reading_materials"].map((x) => x)),
        questions: List<Question>.from(json["questions"].map((x) => Question.fromJson(x))),
        progress: json["progress"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "title": title,
        "description": description,
        "difficulty_level": difficultyLevel,
        "topic": topic,
        "time": time.toIso8601String(),
        "is_published": isPublished,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "duration": duration,
        "end_time": endTime.toIso8601String(),
        "negative_marks": negativeMarks,
        "correct_answer_marks": correctAnswerMarks,
        "shuffle": shuffle,
        "show_answers": showAnswers,
        "lock_solutions": lockSolutions,
        "is_form": isForm,
        "show_mastery_option": showMasteryOption,
        "reading_material": readingMaterial,
        "quiz_type": quizType,
        "is_custom": isCustom,
        "banner_id": bannerId,
        "exam_id": examId,
        "show_unanswered": showUnanswered,
        "ends_at": "${endsAt.year.toString().padLeft(4, '0')}-${endsAt.month.toString().padLeft(2, '0')}-${endsAt.day.toString().padLeft(2, '0')}",
        "lives": lives,
        "live_count": liveCount,
        "coin_count": coinCount,
        "questions_count": questionsCount,
        "daily_date": dailyDate,
        "max_mistake_count": maxMistakeCount,
        "reading_materials": List<dynamic>.from(readingMaterials.map((x) => x)),
        "questions": List<dynamic>.from(questions.map((x) => x.toJson())),
        "progress": progress,
      };
}

class Question {
  int id;
  String description;
  dynamic difficultyLevel;
  Topic topic;
  bool isPublished;
  DateTime createdAt;
  DateTime updatedAt;
  String detailedSolution;
  String? type;
  bool isMandatory;
  bool showInFeed;
  String? pyqLabel;
  int topicId;
  int readingMaterialId;
  DateTime? fixedAt;
  String? fixSummary;
  dynamic createdBy;
  String? updatedBy;
  dynamic quizLevel;
  QuestionFrom questionFrom;
  dynamic language;
  dynamic photoUrl;
  dynamic photoSolutionUrl;
  bool isSaved;
  String tag;
  List<Option> options;
  ReadingMaterial readingMaterial;

  Question({
    required this.id,
    required this.description,
    required this.difficultyLevel,
    required this.topic,
    required this.isPublished,
    required this.createdAt,
    required this.updatedAt,
    required this.detailedSolution,
    required this.type,
    required this.isMandatory,
    required this.showInFeed,
    required this.pyqLabel,
    required this.topicId,
    required this.readingMaterialId,
    required this.fixedAt,
    required this.fixSummary,
    required this.createdBy,
    required this.updatedBy,
    required this.quizLevel,
    required this.questionFrom,
    required this.language,
    required this.photoUrl,
    required this.photoSolutionUrl,
    required this.isSaved,
    required this.tag,
    required this.options,
    required this.readingMaterial,
  });

  Question copyWith({
    int? id,
    String? description,
    dynamic difficultyLevel,
    Topic? topic,
    bool? isPublished,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? detailedSolution,
    String? type,
    bool? isMandatory,
    bool? showInFeed,
    String? pyqLabel,
    int? topicId,
    int? readingMaterialId,
    DateTime? fixedAt,
    String? fixSummary,
    dynamic createdBy,
    String? updatedBy,
    dynamic quizLevel,
    QuestionFrom? questionFrom,
    dynamic language,
    dynamic photoUrl,
    dynamic photoSolutionUrl,
    bool? isSaved,
    String? tag,
    List<Option>? options,
    ReadingMaterial? readingMaterial,
  }) =>
      Question(
        id: id ?? this.id,
        description: description ?? this.description,
        difficultyLevel: difficultyLevel ?? this.difficultyLevel,
        topic: topic ?? this.topic,
        isPublished: isPublished ?? this.isPublished,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        detailedSolution: detailedSolution ?? this.detailedSolution,
        type: type ?? this.type,
        isMandatory: isMandatory ?? this.isMandatory,
        showInFeed: showInFeed ?? this.showInFeed,
        pyqLabel: pyqLabel ?? this.pyqLabel,
        topicId: topicId ?? this.topicId,
        readingMaterialId: readingMaterialId ?? this.readingMaterialId,
        fixedAt: fixedAt ?? this.fixedAt,
        fixSummary: fixSummary ?? this.fixSummary,
        createdBy: createdBy ?? this.createdBy,
        updatedBy: updatedBy ?? this.updatedBy,
        quizLevel: quizLevel ?? this.quizLevel,
        questionFrom: questionFrom ?? this.questionFrom,
        language: language ?? this.language,
        photoUrl: photoUrl ?? this.photoUrl,
        photoSolutionUrl: photoSolutionUrl ?? this.photoSolutionUrl,
        isSaved: isSaved ?? this.isSaved,
        tag: tag ?? this.tag,
        options: options ?? this.options,
        readingMaterial: readingMaterial ?? this.readingMaterial,
      );

  factory Question.fromRawJson(String str) => Question.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Question.fromJson(Map<String, dynamic> json) => Question(
        id: json["id"],
        description: json["description"],
        difficultyLevel: json["difficulty_level"],
        topic: topicValues.map[json["topic"]]!,
        isPublished: json["is_published"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        detailedSolution: json["detailed_solution"],
        type: json["type"],
        isMandatory: json["is_mandatory"],
        showInFeed: json["show_in_feed"],
        pyqLabel: json["pyq_label"],
        topicId: json["topic_id"],
        readingMaterialId: json["reading_material_id"],
        fixedAt: json["fixed_at"] == null ? null : DateTime.parse(json["fixed_at"]),
        fixSummary: json["fix_summary"],
        createdBy: json["created_by"],
        updatedBy: json["updated_by"],
        quizLevel: json["quiz_level"],
        questionFrom: questionFromValues.map[json["question_from"]]!,
        language: json["language"],
        photoUrl: json["photo_url"],
        photoSolutionUrl: json["photo_solution_url"],
        isSaved: json["is_saved"],
        tag: json["tag"],
        options: List<Option>.from(json["options"].map((x) => Option.fromJson(x))),
        readingMaterial: ReadingMaterial.fromJson(json["reading_material"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "difficulty_level": difficultyLevel,
        "topic": topicValues.reverse[topic],
        "is_published": isPublished,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "detailed_solution": detailedSolution,
        "type": type,
        "is_mandatory": isMandatory,
        "show_in_feed": showInFeed,
        "pyq_label": pyqLabel,
        "topic_id": topicId,
        "reading_material_id": readingMaterialId,
        "fixed_at": fixedAt?.toIso8601String(),
        "fix_summary": fixSummary,
        "created_by": createdBy,
        "updated_by": updatedBy,
        "quiz_level": quizLevel,
        "question_from": questionFromValues.reverse[questionFrom],
        "language": language,
        "photo_url": photoUrl,
        "photo_solution_url": photoSolutionUrl,
        "is_saved": isSaved,
        "tag": tag,
        "options": List<dynamic>.from(options.map((x) => x.toJson())),
        "reading_material": readingMaterial.toJson(),
      };
}

class Option {
  int id;
  String description;
  int questionId;
  bool isCorrect;
  DateTime createdAt;
  DateTime updatedAt;
  bool unanswered;
  dynamic photoUrl;

  Option({
    required this.id,
    required this.description,
    required this.questionId,
    required this.isCorrect,
    required this.createdAt,
    required this.updatedAt,
    required this.unanswered,
    required this.photoUrl,
  });

  Option copyWith({
    int? id,
    String? description,
    int? questionId,
    bool? isCorrect,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? unanswered,
    dynamic photoUrl,
  }) =>
      Option(
        id: id ?? this.id,
        description: description ?? this.description,
        questionId: questionId ?? this.questionId,
        isCorrect: isCorrect ?? this.isCorrect,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        unanswered: unanswered ?? this.unanswered,
        photoUrl: photoUrl ?? this.photoUrl,
      );

  factory Option.fromRawJson(String str) => Option.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Option.fromJson(Map<String, dynamic> json) => Option(
        id: json["id"],
        description: json["description"],
        questionId: json["question_id"],
        isCorrect: json["is_correct"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        unanswered: json["unanswered"],
        photoUrl: json["photo_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "description": description,
        "question_id": questionId,
        "is_correct": isCorrect,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "unanswered": unanswered,
        "photo_url": photoUrl,
      };
}

enum QuestionFrom {
  // ignore: constant_identifier_names
  Q_BANK
}

final questionFromValues = EnumValues({
  "Q-bank": QuestionFrom.Q_BANK
});

class ReadingMaterial {
  int id;
  String keywords;
  dynamic content;
  DateTime createdAt;
  DateTime updatedAt;
  List<String> contentSections;
  PracticeMaterial practiceMaterial;

  ReadingMaterial({
    required this.id,
    required this.keywords,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    required this.contentSections,
    required this.practiceMaterial,
  });

  ReadingMaterial copyWith({
    int? id,
    String? keywords,
    dynamic content,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<String>? contentSections,
    PracticeMaterial? practiceMaterial,
  }) =>
      ReadingMaterial(
        id: id ?? this.id,
        keywords: keywords ?? this.keywords,
        content: content ?? this.content,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        contentSections: contentSections ?? this.contentSections,
        practiceMaterial: practiceMaterial ?? this.practiceMaterial,
      );

  factory ReadingMaterial.fromRawJson(String str) => ReadingMaterial.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ReadingMaterial.fromJson(Map<String, dynamic> json) => ReadingMaterial(
        id: json["id"],
        keywords: json["keywords"],
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        contentSections: List<String>.from(json["content_sections"].map((x) => x)),
        practiceMaterial: PracticeMaterial.fromJson(json["practice_material"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "keywords": keywords,
        "content": content,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "content_sections": List<dynamic>.from(contentSections.map((x) => x)),
        "practice_material": practiceMaterial.toJson(),
      };
}

class PracticeMaterial {
  List<String> content;
  List<String> keywords;

  PracticeMaterial({
    required this.content,
    required this.keywords,
  });

  PracticeMaterial copyWith({
    List<String>? content,
    List<String>? keywords,
  }) =>
      PracticeMaterial(
        content: content ?? this.content,
        keywords: keywords ?? this.keywords,
      );

  factory PracticeMaterial.fromRawJson(String str) => PracticeMaterial.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PracticeMaterial.fromJson(Map<String, dynamic> json) => PracticeMaterial(
        content: List<String>.from(json["content"].map((x) => x)),
        keywords: List<String>.from(json["keywords"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "content": List<dynamic>.from(content.map((x) => x)),
        "keywords": List<dynamic>.from(keywords.map((x) => x)),
      };
}

enum Topic {
  // ignore: constant_identifier_names
  MOLECULAR_BASIS_OF_INHERITANCE
}

final topicValues = EnumValues({
  "Molecular Basis Of Inheritance ": Topic.MOLECULAR_BASIS_OF_INHERITANCE
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
