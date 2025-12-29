// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sales_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Sales notifier for managing sales history

@ProviderFor(SalesNotifier)
final salesProvider = SalesNotifierProvider._();

/// Sales notifier for managing sales history
final class SalesNotifierProvider
    extends $NotifierProvider<SalesNotifier, SalesState> {
  /// Sales notifier for managing sales history
  SalesNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'salesProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$salesNotifierHash();

  @$internal
  @override
  SalesNotifier create() => SalesNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SalesState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SalesState>(value),
    );
  }
}

String _$salesNotifierHash() => r'791d4b155a2f51dc2d728bf1d3d13755cbbd111b';

/// Sales notifier for managing sales history

abstract class _$SalesNotifier extends $Notifier<SalesState> {
  SalesState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<SalesState, SalesState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SalesState, SalesState>,
              SalesState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Today's sales count provider

@ProviderFor(todaySalesCount)
final todaySalesCountProvider = TodaySalesCountProvider._();

/// Today's sales count provider

final class TodaySalesCountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// Today's sales count provider
  TodaySalesCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todaySalesCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todaySalesCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return todaySalesCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$todaySalesCountHash() => r'4f4ce69217db72ac5e83867c4ef65e2985ce3f6a';

/// Today's total revenue provider

@ProviderFor(todayRevenue)
final todayRevenueProvider = TodayRevenueProvider._();

/// Today's total revenue provider

final class TodayRevenueProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  /// Today's total revenue provider
  TodayRevenueProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todayRevenueProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todayRevenueHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return todayRevenue(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$todayRevenueHash() => r'3aec00149c2eb6c72e1c5dede3b7f0369ea618c9';
