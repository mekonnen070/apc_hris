import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // For TextInputFormatter
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:police_com/features/employee_profile/domain/employee_performance_model.dart';

import '../../../widgets/app_date_field.dart';
import '../../../widgets/app_text_field.dart';

class AddEditEmployeePerformanceScreen extends HookWidget {
  final EmployeePerformanceModel? initialPerformance;
  final String employeeId;

  const AddEditEmployeePerformanceScreen({
    super.key,
    this.initialPerformance,
    required this.employeeId,
  });

  // C# model has CalculateRating() based on ScorePoint.
  // We can replicate this logic or let backend handle it.
  // For UI, admin might enter ScorePoint, and Rating could be displayed or also entered.
  int _calculateRating(int scorePoint) {
    if (scorePoint >= 90) return 5;
    if (scorePoint >= 75) return 4;
    if (scorePoint >= 60) return 3;
    if (scorePoint >= 40) return 2;
    return 1;
  }

  @override
  Widget build(BuildContext context) {
    final formKey = useMemoized(() => GlobalKey<FormState>());

    final scorePointController = useTextEditingController(
      text: initialPerformance?.scorePoint.toString() ?? '',
    );
    // Rating can be derived or entered. For now, let's assume it's derived or confirmed.
    final rating = useState<int>(
      initialPerformance?.rating ??
          _calculateRating(int.tryParse(scorePointController.text) ?? 0),
    );
    final commentsController = useTextEditingController(
      text: initialPerformance?.comments ?? '',
    );
    final evaluatorNameController = useTextEditingController(
      text: initialPerformance?.evaluatorName ?? '',
    );
    final keyAchievementsController = useTextEditingController(
      text: initialPerformance?.keyAchievements ?? '',
    );
    final areasForImprovementController = useTextEditingController(
      text: initialPerformance?.areasForImprovement ?? '',
    );

    final selectedEvaluationDate = useState<DateTime?>(
      initialPerformance?.evaluationDate ?? DateTime.now(),
    );
    final selectedFromDate = useState<DateTime?>(initialPerformance?.fromDate);
    final selectedToDate = useState<DateTime?>(initialPerformance?.toDate);
    final selectedNextEvaluationDate = useState<DateTime?>(
      initialPerformance?.nextEvaluationDate,
    );

    // Update rating when scorePoint changes
    useEffect(() {
      void listener() {
        final score = int.tryParse(scorePointController.text);
        if (score != null) {
          rating.value = _calculateRating(score);
        } else {
          rating.value = 1; // Default or clear
        }
      }

      scorePointController.addListener(listener);
      return () => scorePointController.removeListener(listener);
    }, [scorePointController]);

    void handleSaveChanges() {
      if (formKey.currentState?.validate() ?? false) {
        formKey.currentState?.save();

        final score = int.tryParse(scorePointController.text);
        if (score == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Please enter a valid score point.')),
          );
          return;
        }
        if (selectedEvaluationDate.value == null) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Evaluation date is required.')),
          );
          return;
        }

        final performanceRecord = EmployeePerformanceModel(
          // C# PerformanceId is int and Key. Backend usually generates.
          // For client-side list management before saving to DB, a temp ID or index might be used.
          // If initialPerformance is null, this implies a new record.
          // The actual ID assignment strategy depends on backend interaction.
          // For now, if initialPerformance.performanceId is 0 (our default), it's new.
          performanceId:
              initialPerformance?.performanceId ??
              0, // Or handle ID generation differently
          employeeId: initialPerformance?.employeeId ?? employeeId,
          scorePoint: score,
          rating: rating.value, // Use the derived or manually set rating
          comments:
              commentsController.text.isEmpty ? null : commentsController.text,
          evaluationDate: selectedEvaluationDate.value!, // Validated
          evaluatorName: evaluatorNameController.text, // C# required
          keyAchievements:
              keyAchievementsController.text.isEmpty
                  ? null
                  : keyAchievementsController.text,
          areasForImprovement:
              areasForImprovementController.text.isEmpty
                  ? null
                  : areasForImprovementController.text,
          fromDate: selectedFromDate.value,
          toDate: selectedToDate.value,
          nextEvaluationDate: selectedNextEvaluationDate.value,
          // updateBy, updateDate are backend handled
        );
        Navigator.of(context).pop(performanceRecord);
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          initialPerformance == null
              ? 'Add Performance Record'
              : 'Edit Performance Record',
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_rounded),
            tooltip: 'Save Performance',
            onPressed: handleSaveChanges,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              AppTextField(
                controller: scorePointController,
                labelText: 'Score Point (1-100) *',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                validator: (val) {
                  if (val == null || val.isEmpty)
                    return 'Score point is required';
                  final numScore = int.tryParse(val);
                  if (numScore == null || numScore < 1 || numScore > 100)
                    return 'Enter a score between 1 and 100';
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  'Calculated Rating: ${rating.value} / 5',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),

              // Optionally, allow manual override of rating if business logic permits
              // AppDropdownField for rating (1-5) if manual input is desired.
              AppDateField(
                labelText: 'Evaluation Date *',
                selectedDate: selectedEvaluationDate.value,
                onDateSelected: (date) => selectedEvaluationDate.value = date,
                validator:
                    (val) => val == null ? 'Evaluation date is required' : null,
                lastDate: DateTime.now(), // Evaluation cannot be in future
              ),
              AppTextField(
                controller: evaluatorNameController,
                labelText: "Evaluator's Name *",
                validator:
                    (val) =>
                        (val == null || val.isEmpty)
                            ? 'Evaluator name is required'
                            : null,
              ),
              AppTextField(
                controller: keyAchievementsController,
                labelText: 'Key Achievements (Optional)',
                maxLines: 3,
                textInputAction: TextInputAction.newline,
              ),
              AppTextField(
                controller: areasForImprovementController,
                labelText: 'Areas for Improvement (Optional)',
                maxLines: 3,
                textInputAction: TextInputAction.newline,
              ),
              AppDateField(
                labelText: 'Performance Period From (Optional)',
                selectedDate: selectedFromDate.value,
                onDateSelected: (date) => selectedFromDate.value = date,
                lastDate: selectedToDate.value ?? DateTime.now(),
              ),
              AppDateField(
                labelText: 'Performance Period To (Optional)',
                selectedDate: selectedToDate.value,
                onDateSelected: (date) => selectedToDate.value = date,
                firstDate: selectedFromDate.value,
                lastDate: DateTime.now(),
                validator: (toDate) {
                  if (selectedFromDate.value != null &&
                      toDate != null &&
                      toDate.isBefore(selectedFromDate.value!)) {
                    return "'To Date' must be after 'From Date'";
                  }
                  return null;
                },
              ),
              AppDateField(
                labelText: 'Next Evaluation Date (Optional)',
                selectedDate: selectedNextEvaluationDate.value,
                onDateSelected:
                    (date) => selectedNextEvaluationDate.value = date,
                firstDate: DateTime.now().add(
                  const Duration(days: 1),
                ), // Must be in future
              ),
              AppTextField(
                controller: commentsController,
                labelText: 'General Comments (Optional)',
                maxLines: 3,
                textInputAction: TextInputAction.newline,
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.save_alt_outlined),
                label: Text(
                  initialPerformance == null ? 'Add Record' : 'Save Changes',
                ),
                onPressed: handleSaveChanges,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
