// lib/features/employee_profile/presentation/retirement_eligibility_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/features/employee/employee_retirement/application/retirement_eligibility_notifier.dart';
import 'package:police_com/features/employee/employee_retirement/application/retirement_eligibility_providers.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';

class RetirementEligibilityScreen extends HookConsumerWidget {
  const RetirementEligibilityScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final retirementState = ref.watch(retirementEligibilityNotifierProvider);
    final retirementNotifier = ref.read(
      retirementEligibilityNotifierProvider.notifier,
    );

    final customRetirementAgeController = useTextEditingController(
      text: retirementState.customRetirementAge?.toString() ?? '',
    );

    // To keep the text field in sync if the state is reset
    useEffect(() {
      final currentText = retirementState.customRetirementAge?.toString() ?? '';
      if (customRetirementAgeController.text != currentText) {
        customRetirementAgeController.text = currentText;
      }
      return null;
    }, [retirementState.customRetirementAge]);

    return Scaffold(
      // AppBar will be provided by the HomePage structure
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Check Retirement Eligibility',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'Enter the date of birth and optionally a custom retirement age to check eligibility.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              AppDateField(
                labelText: 'Date of Birth *',
                selectedDate: retirementState.dateOfBirth,
                onDateSelected: (date) {
                  retirementNotifier.updateDateOfBirth(date);
                },
                validator:
                    (date) =>
                        date == null ? 'Date of birth is required.' : null,
                lastDate: DateTime.now(), // Cannot be born in the future
                firstDate: DateTime(1900), // Reasonable earliest birth year
              ),
              AppTextField(
                controller: customRetirementAgeController,
                labelText: 'Custom Retirement Age (Optional)',
                hintText:
                    'Defaults to ${RetirementEligibilityNotifier.defaultRetirementAge} if empty',
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                onChanged: (value) {
                  // No need to call notifier on every change, will be read on submit
                  // Or call retirementNotifier.updateCustomRetirementAge(value) if live update is desired
                },
                // No validator needed here as it's optional and handled in notifier
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon:
                    retirementState.isLoading
                        ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                        : const Icon(Icons.check_circle_outline),
                label: Text(
                  retirementState.isLoading
                      ? 'Calculating...'
                      : 'Check Eligibility',
                ),
                onPressed:
                    retirementState.isLoading
                        ? null
                        : () {
                          if (formKey.currentState!.validate()) {
                            formKey.currentState!.save();
                            // Pass the value from controller to notifier before checking
                            retirementNotifier.updateCustomRetirementAge(
                              customRetirementAgeController.text,
                            );
                            retirementNotifier.checkEligibility();
                          }
                        },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              OutlinedButton.icon(
                icon: const Icon(Icons.refresh_outlined),
                label: const Text('Reset Calculator'),
                onPressed: () {
                  formKey.currentState?.reset(); // Reset FormBuilder state
                  customRetirementAgeController
                      .clear(); // Clear controller manually
                  retirementNotifier.resetCalculator();
                },
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                ),
              ),
              const SizedBox(height: 24),
              if (retirementState.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Text(
                    retirementState.errorMessage!,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.error,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              if (retirementState.eligibilityMessage != null)
                Card(
                  elevation: 2,
                  color:
                      retirementState.isEligible == true
                          ? Colors.green.shade50
                          : (retirementState.isEligible == false
                              ? Colors.red.shade50
                              : Theme.of(context).cardColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: BorderSide(
                      color:
                          retirementState.isEligible == true
                              ? Colors.green.shade300
                              : (retirementState.isEligible == false
                                  ? Colors.red.shade300
                                  : Colors.transparent),
                      width: 1.5,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Text(
                          'Eligibility Status:',
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          retirementState.eligibilityMessage!,
                          style: Theme.of(
                            context,
                          ).textTheme.bodyLarge?.copyWith(
                            color:
                                retirementState.isEligible == true
                                    ? Colors.green.shade800
                                    : (retirementState.isEligible == false
                                        ? Colors.red.shade800
                                        : null),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        if (retirementState.calculatedAge != null &&
                            retirementState.calculatedAge! < 0)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.error_outline,
                              color: Colors.red.shade800,
                              size: 30,
                            ),
                          )
                        else if (retirementState.isEligible == true)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.celebration_rounded,
                              color: Colors.green.shade800,
                              size: 30,
                            ),
                          )
                        else if (retirementState.isEligible == false &&
                            retirementState.calculatedAge != null)
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Icon(
                              Icons.hourglass_empty_rounded,
                              color: Colors.orange.shade800,
                              size: 30,
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
