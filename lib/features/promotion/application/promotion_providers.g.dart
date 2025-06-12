// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promotion_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$myPromotionRequestsHash() =>
    r'743a2ec369792fd0b8f06034eac7621cb3a53209';

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

/// See also [myPromotionRequests].
@ProviderFor(myPromotionRequests)
const myPromotionRequestsProvider = MyPromotionRequestsFamily();

/// See also [myPromotionRequests].
class MyPromotionRequestsFamily
    extends Family<AsyncValue<List<PromotionRequest>>> {
  /// See also [myPromotionRequests].
  const MyPromotionRequestsFamily();

  /// See also [myPromotionRequests].
  MyPromotionRequestsProvider call(String employeeId) {
    return MyPromotionRequestsProvider(employeeId);
  }

  @override
  MyPromotionRequestsProvider getProviderOverride(
    covariant MyPromotionRequestsProvider provider,
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
  String? get name => r'myPromotionRequestsProvider';
}

/// See also [myPromotionRequests].
class MyPromotionRequestsProvider
    extends AutoDisposeFutureProvider<List<PromotionRequest>> {
  /// See also [myPromotionRequests].
  MyPromotionRequestsProvider(String employeeId)
    : this._internal(
        (ref) => myPromotionRequests(ref as MyPromotionRequestsRef, employeeId),
        from: myPromotionRequestsProvider,
        name: r'myPromotionRequestsProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$myPromotionRequestsHash,
        dependencies: MyPromotionRequestsFamily._dependencies,
        allTransitiveDependencies:
            MyPromotionRequestsFamily._allTransitiveDependencies,
        employeeId: employeeId,
      );

  MyPromotionRequestsProvider._internal(
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
  Override overrideWith(
    FutureOr<List<PromotionRequest>> Function(MyPromotionRequestsRef provider)
    create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MyPromotionRequestsProvider._internal(
        (ref) => create(ref as MyPromotionRequestsRef),
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
  AutoDisposeFutureProviderElement<List<PromotionRequest>> createElement() {
    return _MyPromotionRequestsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MyPromotionRequestsProvider &&
        other.employeeId == employeeId;
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
mixin MyPromotionRequestsRef
    on AutoDisposeFutureProviderRef<List<PromotionRequest>> {
  /// The parameter `employeeId` of this provider.
  String get employeeId;
}

class _MyPromotionRequestsProviderElement
    extends AutoDisposeFutureProviderElement<List<PromotionRequest>>
    with MyPromotionRequestsRef {
  _MyPromotionRequestsProviderElement(super.provider);

  @override
  String get employeeId => (origin as MyPromotionRequestsProvider).employeeId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
