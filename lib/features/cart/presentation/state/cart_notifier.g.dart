// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Cart notifier for managing shopping cart state

@ProviderFor(CartNotifier)
final cartProvider = CartNotifierProvider._();

/// Cart notifier for managing shopping cart state
final class CartNotifierProvider
    extends $NotifierProvider<CartNotifier, List<CartItem>> {
  /// Cart notifier for managing shopping cart state
  CartNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartNotifierHash();

  @$internal
  @override
  CartNotifier create() => CartNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<CartItem> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<CartItem>>(value),
    );
  }
}

String _$cartNotifierHash() => r'4e414777d96edeb640f93b8dca3da54a7b2c1255';

/// Cart notifier for managing shopping cart state

abstract class _$CartNotifier extends $Notifier<List<CartItem>> {
  List<CartItem> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<List<CartItem>, List<CartItem>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<CartItem>, List<CartItem>>,
              List<CartItem>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Cart total provider

@ProviderFor(cartTotal)
final cartTotalProvider = CartTotalProvider._();

/// Cart total provider

final class CartTotalProvider
    extends $FunctionalProvider<double, double, double>
    with $Provider<double> {
  /// Cart total provider
  CartTotalProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartTotalProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartTotalHash();

  @$internal
  @override
  $ProviderElement<double> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  double create(Ref ref) {
    return cartTotal(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(double value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<double>(value),
    );
  }
}

String _$cartTotalHash() => r'd2a2917e5bd374460aefe8cf402030097ef9bf7a';

/// Cart items count provider

@ProviderFor(cartItemsCount)
final cartItemsCountProvider = CartItemsCountProvider._();

/// Cart items count provider

final class CartItemsCountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  /// Cart items count provider
  CartItemsCountProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartItemsCountProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartItemsCountHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return cartItemsCount(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$cartItemsCountHash() => r'45781f40c3b1a0b56f6c3768ce219e2cbc374c7d';

/// Cart is empty provider

@ProviderFor(cartIsEmpty)
final cartIsEmptyProvider = CartIsEmptyProvider._();

/// Cart is empty provider

final class CartIsEmptyProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  /// Cart is empty provider
  CartIsEmptyProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'cartIsEmptyProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$cartIsEmptyHash();

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    return cartIsEmpty(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$cartIsEmptyHash() => r'55343aff68584973dfc6262e68a56619af2c9ae9';
