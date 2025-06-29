import 'package:eroll/core/routes/app_route_names.dart';
import 'package:eroll/features/attendance/view/attendance_screen.dart';
import 'package:eroll/features/create_staff/views/create_staff_screen.dart';
import 'package:eroll/features/works/create_work/view/create_work_screen.dart';
import 'package:eroll/features/home/view/home_screen.dart';
import 'package:eroll/features/leave/staff_leave_screen.dart';
import 'package:eroll/features/onboarding/onboard_screen.dart';
import 'package:eroll/features/onboarding/splash_screen.dart';
import 'package:eroll/features/payroll/monthly_payroll/payroll_month_screen.dart';
import 'package:eroll/features/payroll/staff_payroll_report/view/staff_payroll_report_screen.dart';
import 'package:eroll/features/payroll/staff_list_payroll/staff_list_payroll_screen.dart';
import 'package:eroll/features/staffs/view/staffs_screen.dart';
import 'package:eroll/features/works/update_work/view/update_work_status_screen.dart';
import 'package:eroll/features/works/work_site/view/works_site_screen.dart';
import 'package:flutter/material.dart';

import '../../features/bottom_nav/bottom_nav_bar.dart';

class AppRouteConfig {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteNames.splashScreen:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case AppRouteNames.onboardScreen:
        return MaterialPageRoute(builder: (context) => OnboardScreen());

      case AppRouteNames.bottomNavScreen:
        return MaterialPageRoute(builder: (context) => BottomNavBar());

      case AppRouteNames.homeScreen:
        return MaterialPageRoute(builder: (context) => HomeScreen());

      case AppRouteNames.attendanceScreen:
        return MaterialPageRoute(builder: (context) => AttendanceScreen());

      case AppRouteNames.siteWorksScreen:
        final args = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => WorksSiteScreen(activeIndex: args),
        );

      case AppRouteNames.createWorkScreen:
        return MaterialPageRoute(builder: (context) => CreateWorkScreen());

      case AppRouteNames.updateWorksScreen:
        return MaterialPageRoute(
          builder: (context) => UpdateWorkStatusScreen(),
        );

      case AppRouteNames.staffsScreen:
        return MaterialPageRoute(builder: (context) => StaffsScreen());

      case AppRouteNames.staffOnLeaveScreen:
        return MaterialPageRoute(builder: (context) => StaffLeaveScreen());

      case AppRouteNames.createStaffScreen:
        return MaterialPageRoute(builder: (context) => CreateStaffScreen());

      case AppRouteNames.staffListPayrollScreen:
        return MaterialPageRoute(
          builder: (context) => StaffListPayrollScreen(),
        );

      case AppRouteNames.staffPayrollReportScreen:
        return MaterialPageRoute(
          builder: (context) => StaffPayrollReportScreen(),
        );

      case AppRouteNames.payrollMonthListScreen:
        return MaterialPageRoute(builder: (context) => PayrollMonthScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(body: Center(child: Text('No Routes Found..!')));
      },
    );
  }
}
