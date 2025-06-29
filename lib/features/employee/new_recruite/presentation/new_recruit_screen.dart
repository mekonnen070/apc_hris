import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:police_com/core/enums/all_enums.dart';
import 'package:police_com/core/extensions/context_extension.dart'; // <-- ADDED
import 'package:police_com/core/extensions/string_extension.dart';
import 'package:police_com/features/employee/new_recruite/application/new_recruit_notifier.dart';
import 'package:police_com/features/employee/new_recruite/domain/recruit_info.dart';
import 'package:police_com/features/widgets/app_bar_widget.dart';
import 'package:police_com/features/widgets/app_date_field.dart';
import 'package:police_com/features/widgets/app_dropdown_field.dart';
import 'package:police_com/features/widgets/app_text_field.dart';
import 'package:toastification/toastification.dart';

class NewRecruitScreen extends HookConsumerWidget {
  const NewRecruitScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>());
    final notifier = ref.watch(newRecruitNotifierProvider.notifier);
    final state = ref.watch(newRecruitNotifierProvider);

    final formFieldKeys = useMemoized(
      () => List.generate(15, (_) => GlobalKey<FormFieldState>()),
    );

    final announcementId = useState<int?>(null);
    final firstNameController = useTextEditingController();
    final middleNameController = useTextEditingController();
    final lastNameController = useTextEditingController();
    final dateOfBirth = useState<DateTime?>(null);
    final ageController = useTextEditingController();
    final gender = useState<Gender?>(null);
    final maritalStatus = useState<MaritalStatus?>(null);
    final numberOfChildrenController = useTextEditingController();
    final nationalityController = useTextEditingController(text: 'Ethiopian');
    final religion = useState<Religion?>(null);
    final bloodGroup = useState<BloodGroup?>(null);
    final woredaController = useTextEditingController();
    final kebeleController = useTextEditingController();
    final houseNumberController = useTextEditingController();
    final phoneNumberController = useTextEditingController();

    useEffect(() {
      Future.microtask(() => notifier.initialize());
      return null;
    }, []);

    void handleSubmit() async {
      final navigator = Navigator.of(context);

      if (formKey.currentState!.validate()) {
        formKey.currentState!.save();
        final recruitInfo = RecruitInfo(
          announcementId: announcementId.value!,
          firstName: firstNameController.text,
          middleName: middleNameController.text,
          lastName: lastNameController.text,
          dateOfBirth: dateOfBirth.value!,
          age: int.parse(ageController.text),
          gender: gender.value!,
          maritalStatus: maritalStatus.value!,
          numberOfChildren: int.parse(numberOfChildrenController.text),
          nationality: nationalityController.text,
          religion: religion.value!,
          bloodGroup: bloodGroup.value!,
          photoPath: 'path/to/photo.jpg', // Placeholder
          woreda: woredaController.text,
          kebele: kebeleController.text,
          houseNumber: houseNumberController.text,
          phoneNumber: phoneNumberController.text,
        );
        notifier.updateRecruitInfo(recruitInfo);
        await notifier.submitNewRecruit();

        final currentState = ref.read(newRecruitNotifierProvider);
        if (currentState.successMessage != null) {
          toastification.show(
            context: context,
            title: Text(currentState.successMessage!),
            type: ToastificationType.success,
            autoCloseDuration: const Duration(seconds: 4),
          );
          navigator.pop(true);
        } else if (currentState.errorMessage != null) {
          toastification.show(
            context: context,
            title: Text(currentState.errorMessage!),
            type: ToastificationType.error,
            autoCloseDuration: const Duration(seconds: 5),
          );
        }
        ref.read(newRecruitNotifierProvider.notifier).clearMessages();
      } else {
        for (final key in formFieldKeys) {
          if (key.currentState != null && key.currentState!.hasError) {
            Scrollable.ensureVisible(
              key.currentContext!,
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeIn,
            );
            break;
          }
        }
      }
    }

    return Scaffold(
      appBar: AppBarWidget(title: context.lango.newRecruitApplication), // <-- REPLACED
      body:
          state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.errorMessage != null && state.announcements.isEmpty
              ? Center(child: Text(state.errorMessage!))
              : Form(
                key: formKey,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      AppDropdownField<int>(
                        fieldKey: formFieldKeys[0],
                        labelText: context.lango.recruitmentAnnouncement, // <-- REPLACED
                        isRequired: true,
                        value: announcementId.value,
                        items:
                            state.announcements
                                .map(
                                  (ann) => DropdownMenuItem(
                                    value: ann.id,
                                    child: Text(ann.title),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) => announcementId.value = value,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        fieldKey: formFieldKeys[1],
                        controller: firstNameController,
                        labelText: context.lango.firstName, // <-- REPLACED
                        isRequired: true,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        fieldKey: formFieldKeys[2],
                        controller: middleNameController,
                        labelText: context.lango.middleName, // <-- REPLACED
                        isRequired: true,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        fieldKey: formFieldKeys[3],
                        controller: lastNameController,
                        labelText: context.lango.lastName, // <-- REPLACED
                        isRequired: true,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppDateField(
                        fieldKey: formFieldKeys[4],
                        labelText: context.lango.dateOfBirth, // <-- REPLACED
                        isRequired: true,
                        selectedDate: dateOfBirth.value,
                        onDateSelected:
                            (newDate) => dateOfBirth.value = newDate,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        fieldKey: formFieldKeys[5],
                        controller: ageController,
                        labelText: context.lango.age, // <-- REPLACED
                        isRequired: true,
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      AppDropdownField<Gender>(
                        fieldKey: formFieldKeys[6],
                        labelText: context.lango.gender, // <-- REPLACED
                        isRequired: true,
                        value: gender.value,
                        items:
                            Gender.values
                                .map(
                                  (g) => DropdownMenuItem(
                                    value: g,
                                    child: Text(g.name.toDisplayCase()),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) => gender.value = value,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppDropdownField<MaritalStatus>(
                        fieldKey: formFieldKeys[7],
                        labelText: context.lango.maritalStatus, // <-- REPLACED
                        isRequired: true,
                        value: maritalStatus.value,
                        items:
                            MaritalStatus.values
                                .map(
                                  (ms) => DropdownMenuItem(
                                    value: ms,
                                    child: Text(ms.name.toDisplayCase()),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) => maritalStatus.value = value,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        fieldKey: formFieldKeys[8],
                        controller: numberOfChildrenController,
                        labelText: context.lango.numberOfChildren, // <-- REPLACED
                        isRequired: true,
                        keyboardType: TextInputType.number,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                        ]),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        fieldKey: formFieldKeys[9],
                        controller: nationalityController,
                        labelText: context.lango.nationality, // <-- REPLACED
                        isRequired: true,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppDropdownField<Religion>(
                        fieldKey: formFieldKeys[10],
                        labelText: context.lango.religion, // <-- REPLACED
                        isRequired: true,
                        value: religion.value,
                        items:
                            Religion.values
                                .map(
                                  (r) => DropdownMenuItem(
                                    value: r,
                                    child: Text(r.name.toDisplayCase()),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) => religion.value = value,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppDropdownField<BloodGroup>(
                        fieldKey: formFieldKeys[11],
                        labelText: context.lango.bloodGroup, // <-- REPLACED
                        isRequired: true,
                        value: bloodGroup.value,
                        items:
                            BloodGroup.values
                                .map(
                                  (bg) => DropdownMenuItem(
                                    value: bg,
                                    child: Text(
                                      bg.name.toDisplayCase().replaceAll(
                                        ' ',
                                        '',
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                        onChanged: (value) => bloodGroup.value = value,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        fieldKey: formFieldKeys[12],
                        controller: woredaController,
                        labelText: context.lango.woreda, // <-- REPLACED
                        isRequired: true,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        fieldKey: formFieldKeys[13],
                        controller: kebeleController,
                        labelText: context.lango.kebele, // <-- REPLACED
                        isRequired: true,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        fieldKey: formFieldKeys[14],
                        controller: houseNumberController,
                        labelText: context.lango.houseNumber, // <-- REPLACED
                        isRequired: true,
                        validator: FormBuilderValidators.required(),
                      ),
                      const SizedBox(height: 16),
                      AppTextField(
                        controller: phoneNumberController,
                        labelText: context.lango.phoneNumber, // <-- REPLACED
                        isRequired: true,
                        keyboardType: TextInputType.phone,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                          FormBuilderValidators.numeric(),
                          FormBuilderValidators.minLength(9),
                          FormBuilderValidators.maxLength(10),
                        ]),
                      ),
                      const SizedBox(height: 32),
                      FilledButton(
                        onPressed: state.isSubmitting ? null : handleSubmit,
                        child:
                            state.isSubmitting
                                ? const CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.white,
                                  ),
                                )
                                : Text(context.lango.submit), // <-- REPLACED
                      ),
                    ],
                  ),
                ),
              ),
    );
  }
} 