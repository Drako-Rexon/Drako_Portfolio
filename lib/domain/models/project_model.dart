class ProjectModel {
  String title;
  String gtihub;
  String drive;

  ProjectModel({
    required this.title,
    required this.gtihub,
    required this.drive,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        title: json["title"],
        gtihub: json["gtihub"],
        drive: json["drive"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "gtihub": gtihub,
        "drive": drive,
      };
}
