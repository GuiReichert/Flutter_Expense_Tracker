import 'package:flutter/material.dart';

enum ExpenseCategories { food, travel, leisure, work, studies }

const categoryIcons = {
  ExpenseCategories.food: Icons.dinner_dining_rounded,
  ExpenseCategories.travel: Icons.flight_takeoff_rounded,
  ExpenseCategories.leisure: Icons.park_rounded,
  ExpenseCategories.work: Icons.work_history_rounded,
  ExpenseCategories.studies: Icons.school,
};
