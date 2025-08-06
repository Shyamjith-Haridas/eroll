class InputValidators {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Work site name is required';
    }

    if (value.trim().length < 5) {
      return 'Work site name must be at least 5 characters';
    }
    return null;
  }

  static String? validateStartDate(DateTime? value) {
    if (value == null) {
      return 'Start date is required';
    }
    return null;
  }

  static String? validateTeamMembers(List<String>? team) {
    if (team == null || team.isEmpty) {
      return 'Please select at least one team member';
    }
    return null;
  }
}
