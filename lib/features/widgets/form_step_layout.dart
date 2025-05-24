import 'package:flutter/material.dart';

// A consistent layout for steps within a multi-page form.
class FormStepLayout extends StatelessWidget {
  final String stepTitle;
  final Widget child; // The main content of the form step
  final VoidCallback? onNext;
  final VoidCallback? onPrevious;
  final bool isNextLoading;
  final String nextButtonText;
  final String previousButtonText;
  final bool showNextButton;
  final bool showPreviousButton;
  final GlobalKey<FormState>? formKey; // Optional: for form validation on next

  const FormStepLayout({
    super.key,
    required this.stepTitle,
    required this.child,
    this.onNext,
    this.onPrevious,
    this.isNextLoading = false,
    this.nextButtonText = 'Next',
    this.previousButtonText = 'Previous',
    this.showNextButton = true,
    this.showPreviousButton = true,
    this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stepTitle),
        // Potentially add a step indicator here if complex
      ),
      body: SingleChildScrollView(
        // Ensure content is scrollable
        padding: const EdgeInsets.all(16.0),
        child: child, // This will be the Form widget with AppTextFields etc.
      ),
      bottomNavigationBar:
          (showPreviousButton && onPrevious != null) ||
                  (showNextButton && onNext != null)
              ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    if (showPreviousButton && onPrevious != null)
                      OutlinedButton(
                        onPressed: onPrevious,
                        child: Text(previousButtonText),
                      ),
                    if (showNextButton && onNext != null)
                      ElevatedButton(
                        onPressed:
                            isNextLoading
                                ? null
                                : () {
                                  if (formKey?.currentState?.validate() ??
                                      true) {
                                    formKey?.currentState
                                        ?.save(); // Call onSaved for FormFields
                                    onNext!();
                                  }
                                },
                        child:
                            isNextLoading
                                ? const SizedBox(
                                  height: 20,
                                  width: 20,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    color: Colors.white,
                                  ),
                                )
                                : Text(nextButtonText),
                      ),
                  ],
                ),
              )
              : null,
    );
  }
}
