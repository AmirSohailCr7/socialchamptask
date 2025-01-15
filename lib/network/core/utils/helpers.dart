String formatDate(String date) {
  // Example: format '2025-01-01' to 'Jan 1, 2025'
  final parsedDate = DateTime.parse(date);
  return "${parsedDate.month}/${parsedDate.day}/${parsedDate.year}";
}