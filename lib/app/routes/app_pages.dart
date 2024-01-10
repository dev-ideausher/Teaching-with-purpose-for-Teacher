import 'package:get/get.dart';

import '../modules/add_assignment/bindings/add_assignment_binding.dart';
import '../modules/add_assignment/views/add_assignment_view.dart';
import '../modules/add_chapters/bindings/add_chapters_binding.dart';
import '../modules/add_chapters/views/add_chapters_view.dart';
import '../modules/add_chapters/views/chapter_view.dart';
import '../modules/add_marks/bindings/add_marks_binding.dart';
import '../modules/add_marks/views/add_marks_view.dart';
import '../modules/add_questions/bindings/add_questions_binding.dart';
import '../modules/add_questions/views/add_questions_view.dart';
import '../modules/announcements/bindings/announcements_binding.dart';
import '../modules/announcements/views/announcements_view.dart';
import '../modules/assignments/bindings/assignments_binding.dart';
import '../modules/assignments/views/assignment_uploded_screen.dart';
import '../modules/assignments/views/assignments_view.dart';
import '../modules/attendance/bindings/attendance_binding.dart';
import '../modules/attendance/views/attendance_view.dart';
import '../modules/bottom_nav/bindings/bottom_nav_binding.dart';
import '../modules/bottom_nav/views/bottom_nav_view.dart';
import '../modules/change_password/bindings/change_password_binding.dart';
import '../modules/change_password/views/change_pass_sucess_view.dart';
import '../modules/change_password/views/change_password_view.dart';
import '../modules/edit_profile/bindings/edit_profile_binding.dart';
import '../modules/edit_profile/views/edit_profile_view.dart';
import '../modules/events/bindings/events_binding.dart';
import '../modules/events/views/events_view.dart';
import '../modules/forgot_password/bindings/forgot_password_binding.dart';
import '../modules/forgot_password/views/forgot_password_view.dart';
import '../modules/help_center/bindings/help_center_binding.dart';
import '../modules/help_center/views/help_center_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/live_quizz/bindings/live_quizz_binding.dart';
import '../modules/live_quizz/views/live_quizsucess_view.dart';
import '../modules/live_quizz/views/live_quizz_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/marks/bindings/marks_binding.dart';
import '../modules/marks/views/marks_view.dart';
import '../modules/my_classes/bindings/my_classes_binding.dart';
import '../modules/my_classes/views/my_classes_view.dart';
import '../modules/my_classes/views/screens/assignment_completion/assignment_complection_screen.dart';
import '../modules/my_classes/views/screens/cource_completion/cource_completion_screen.dart';
import '../modules/my_classes/views/screens/student_behaviour/student_behaviour_screen.dart';
import '../modules/my_classes/views/screens/student_details/student_details_screen.dart';
import '../modules/on_board/bindings/on_board_binding.dart';
import '../modules/on_board/views/get_started_view.dart';
import '../modules/on_board/views/on_board_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/results/bindings/results_binding.dart';
import '../modules/results/views/results_view.dart';
import '../modules/schedule/bindings/schedule_binding.dart';
import '../modules/schedule/views/schedule_view.dart';
import '../modules/schedule/views/screens/exam_datesheet_screen.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/subjects/bindings/subjects_binding.dart';
import '../modules/subjects/views/subjects_view.dart';
import '../modules/verify/bindings/verify_binding.dart';
import '../modules/verify/views/verify_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.SPLASH,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.ON_BOARD,
      page: () => const OnBoardView(),
      binding: OnBoardBinding(),
    ),
    GetPage(
      name: _Paths.GET_STARTED,
      page: () => const GetStartedView(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => const LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
        name: _Paths.BOTTOM_NAV,
        page: () => const BottomNavbarView(),
        binding: BottomNavBinding()),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => const ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASSWORD,
      page: () => const ChangePasswordView(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHANGE_PASS_SUCESS,
      page: () => const ChangePasswordSuccessView(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SCHEDULE,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: _Paths.EXAM_DATE_SHEET,
      page: () => const ExamDateSheetScreen(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
    GetPage(
      name: _Paths.VERIFY,
      page: () => const VerifyView(),
      binding: VerifyBinding(),
    ),
    GetPage(
      name: _Paths.HELP_CENTER,
      page: () => const HelpCenterView(),
      binding: HelpCenterBinding(),
    ),
    GetPage(
      name: _Paths.ATTENDANCE,
      page: () => const AttendanceView(),
      binding: AttendanceBinding(),
    ),
    GetPage(
      name: _Paths.EDIT_PROFILE,
      page: () => const EditProfileView(),
      binding: EditProfileBinding(),
    ),
    GetPage(
      name: _Paths.MY_CLASSES,
      page: () => const MyClassesView(),
      binding: MyClassesBinding(),
    ),
    GetPage(
      name: _Paths.STUDENT_DETAILS,
      page: () => const StudentDetailsScreen(),
    ),
    GetPage(
      name: _Paths.COURCE_COMPLETION,
      page: () => const CourceCompletionScreen(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENT_COMPLETION,
      page: () => const AssignmentComplectionScreen(),
    ),
    GetPage(
      name: _Paths.EXAM_TRACKING,
      page: () => const ExamDateSheetScreen(),
    ),
    GetPage(
      name: _Paths.STUDENT_BECHAVIOUR,
      page: () => const StudentBehaviourScreen(),
    ),
    GetPage(
      name: _Paths.ASSIGNMENTS,
      page: () => const AssignmentsView(),
      binding: AssignmentsBinding(),
    ),
    GetPage(
        name: _Paths.ASSIGNMENT_UPLODED,
        page: () => const AssignmentUplodedScreen()),
    GetPage(
      name: _Paths.SUBJECTS,
      page: () => const SubjectsView(),
      binding: SubjectsBinding(),
    ),
    GetPage(
      name: _Paths.CHAPTER,
      page: () => const ChapterView(),
    ),
    GetPage(
      name: _Paths.ADD_CHAPTERS,
      page: () => const AddChaptersView(),
      binding: AddChaptersBinding(),
    ),
    GetPage(
      name: _Paths.ADD_QUESTIONS,
      page: () => const AddQuestionsView(),
      binding: AddQuestionsBinding(),
    ),
    GetPage(
      name: _Paths.RESULTS,
      page: () => const ResultsView(),
      binding: ResultsBinding(),
    ),
    GetPage(
      name: _Paths.LIVE_QUIZZ,
      page: () => const LiveQuizzView(),
      binding: LiveQuizzBinding(),
    ),
    GetPage(
      name: _Paths.LIVE_QUIZZ_SUCESS,
      page: () => const LiveQuizzSucessView(),
    ),
    GetPage(
      name: _Paths.MARKS,
      page: () => const MarksView(),
      binding: MarksBinding(),
    ),
    GetPage(
      name: _Paths.EVENTS,
      page: () => const EventsView(),
      binding: EventsBinding(),
    ),
    GetPage(
      name: _Paths.ANNOUNCEMENTS,
      page: () => const AnnouncementsView(),
      binding: AnnouncementsBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ASSIGNMENT,
      page: () => const AddAssignmentView(),
      binding: AddAssignmentBinding(),
    ),
    GetPage(
      name: _Paths.ADD_MARKS,
      page: () => const AddMarksView(),
      binding: AddMarksBinding(),
    ),
  ];
}
