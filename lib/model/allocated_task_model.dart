import 'dart:ffi';

class AllocatedTaskModel {
  String designisation;
  String description;
  String assignment;
  String reminder;
  Char charcater;

  AllocatedTaskModel({
    required this.designisation,
    required this.description,
    required this.assignment,
    required this.reminder,
    required this.charcater,
  });
}

typedef Char = String;

List<AllocatedTaskModel> listAllocatedTaskModel = [
  AllocatedTaskModel(
    designisation: "Team Lead",
    description: "Responsible for overseeing the development of the project, ensuring team coordination, and meeting deadlines effectively.",
    assignment: "Develop and finalize the architecture for the project.",
    reminder: "Weekly team check-ins every Monday to assess progress and resolve blockers.",
    charcater: "T",
  ),
  AllocatedTaskModel(
    designisation: "UI/UX Designer",
    description: "Tasked with creating intuitive and user-friendly designs for the application, including wireframes and prototypes.",
    assignment: "Deliver wireframes and clickable prototypes for the main app screens.",
    reminder: "Present design updates to the team on Thursday mornings.",
    charcater: "U",
  ),
  AllocatedTaskModel(
    designisation: "Backend Developer",
    description: "Develops and maintains the server-side logic, database integrations, and API endpoints.",
    assignment: "Set up the database schema and write REST APIs for user authentication.",
    reminder: "Submit API documentation and demo by next Friday.",
    charcater: "D",
  ),
  AllocatedTaskModel(
    designisation: "Quality Analyst",
    description: "Ensures the quality of the application by testing its functionality and reporting any issues to the team.",
    assignment: "Create and execute test cases for login and registration modules.",
    reminder: "Complete test reports and submit findings to the team by Wednesday.",
    charcater: "Q",
  ),
  AllocatedTaskModel(
    designisation: "Product Manager",
    description: "Manages the overall project roadmap, aligning team efforts with business objectives and user needs.",
    assignment: "Coordinate with stakeholders to finalize the project timeline.",
    reminder: "Organize a project review meeting with stakeholders next Tuesday.",
    charcater: "P",
  ),
];
