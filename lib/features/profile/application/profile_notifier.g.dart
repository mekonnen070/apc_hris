// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$profileNotifierHash() => r'da33de3ed69464c60218680356571233a899f49c';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$ProfileNotifier
    extends BuildlessAutoDisposeAsyncNotifier<EmployeeInfoModel> {
  late final String employeeId;

  FutureOr<EmployeeInfoModel> build(String employeeId);
}

/// See also [ProfileNotifier].
@ProviderFor(ProfileNotifier)
const profileNotifierProvider = ProfileNotifierFamily();

/// See also [ProfileNotifier].
class ProfileNotifierFamily extends Family<AsyncValue<EmployeeInfoModel>> {
  /// See also [ProfileNotifier].
  const ProfileNotifierFamily();

  /// See also [ProfileNotifier].
  ProfileNotifierProvider call(String employeeId) {
    return ProfileNotifierProvider(employeeId);
  }

  @override
  ProfileNotifierProvider getProviderOverride(
    covariant ProfileNotifierProvider provider,
  ) {
    return call(provider.employeeId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'profileNotifierProvider';
}

/// See also [ProfileNotifier].
class ProfileNotifierProvider
    extends
        AutoDisposeAsyncNotifierProviderImpl<
          ProfileNotifier,
          EmployeeInfoModel
        > {
  /// See also [ProfileNotifier].
  ProfileNotifierProvider(String employeeId)
    : this._internal(
        () => ProfileNotifier()..employeeId = employeeId,
        from: profileNotifierProvider,
        name: r'profileNotifierProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$profileNotifierHash,
        dependencies: ProfileNotifierFamily._dependencies,
        allTransitiveDependencies:
            ProfileNotifierFamily._allTransitiveDependencies,
        employeeId: employeeId,
      );

  ProfileNotifierProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.employeeId,
  }) : super.internal();

  final String employeeId;

  @override
  FutureOr<EmployeeInfoModel> runNotifierBuild(
    covariant ProfileNotifier notifier,
  ) {
    return notifier.build(employeeId);
  }

  @override
  Override overrideWith(ProfileNotifier Function() create) {
    return ProviderOverride(
      origin: this,
      override: ProfileNotifierProvider._internal(
        () => create()..employeeId = employeeId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        employeeId: employeeId,
      ),
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderElement<ProfileNotifier, EmployeeInfoModel>
  createElement() {
    return _ProfileNotifierProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProfileNotifierProvider && other.employeeId == employeeId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, employeeId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProfileNotifierRef
    on AutoDisposeAsyncNotifierProviderRef<EmployeeInfoModel> {
  /// The parameter `employeeId` of this provider.
  String get employeeId;
}

class _ProfileNotifierProviderElement
    extends
        AutoDisposeAsyncNotifierProviderElement<
          ProfileNotifier,
          EmployeeInfoModel
        >
    with ProfileNotifierRef {
  _ProfileNotifierProviderElement(super.provider);

  @override
  String get employeeId => (origin as ProfileNotifierProvider).employeeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
