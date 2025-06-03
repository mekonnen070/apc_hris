import 'package:flutter/material.dart';

// A layout for individual steps in a multi-page form.
// Designed to be used as a child page within a PageView managed by a host screen.
class FormStepLayout extends StatelessWidget {
  final Widget child;
  final VoidCallback? onNext; // Action for the "Next" button
  final VoidCallback? onPrevious; // Action for the "Previous" button
  final bool isNextLoading;
  final String? nextButtonText;
  final String previousButtonText;
  final GlobalKey<FormState>? formKey;
  final bool isLastStep;

  const FormStepLayout({
    super.key,
    required this.child,
    this.onNext,
    this.onPrevious,
    this.isNextLoading = false,
    this.nextButtonText, // Defaults handled below
    this.previousButtonText = 'Previous',
    this.formKey,
    this.isLastStep = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Colors.transparent, // Allow host screen background to show if desired
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(0),
          child:
              child, // The child is expected to be a Form containing a ListView or SingleChildScrollView
        ),
      ),
      bottomNavigationBar:
          (onPrevious != null || (onNext != null && nextButtonText != null))
              ? BottomAppBar(
                elevation: 4.0, // Add some elevation
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16.0,
                    vertical: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment:
                        onPrevious == null ||
                                (onNext == null || nextButtonText == null)
                            ? MainAxisAlignment
                                .end // Align to right if only one button
                            : MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      if (onPrevious != null)
                        OutlinedButton.icon(
                          icon: const Icon(Icons.arrow_back_ios_new, size: 16),
                          label: Text(previousButtonText),
                          onPressed: onPrevious,
                        ),
                      if (onNext != null && nextButtonText != null)
                        ElevatedButton.icon(
                          icon:
                              isNextLoading
                                  ? const SizedBox(
                                    height: 18,
                                    width: 18,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.white,
                                    ),
                                  )
                                  : Icon(
                                    isLastStep
                                        ? Icons.preview_outlined
                                        : Icons.arrow_forward_ios_rounded,
                                    size: 16,
                                  ),
                          label: Text(
                            isNextLoading
                                ? 'Saving...'
                                : (nextButtonText ??
                                    (isLastStep ? 'Review' : 'Next')),
                          ),
                          onPressed:
                              isNextLoading
                                  ? null
                                  : () {
                                    if (formKey?.currentState?.validate() ??
                                        true) {
                                      formKey?.currentState?.save();
                                      onNext!(); // The onNext callback is now responsible for updating provider & signalling page change
                                    }
                                  },
                        ),
                    ],
                  ),
                ),
              )
              : null,
    );
  }
}
