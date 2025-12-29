// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Product notifier for managing product state

@ProviderFor(ProductNotifier)
final productProvider = ProductNotifierProvider._();

/// Product notifier for managing product state
final class ProductNotifierProvider
    extends $NotifierProvider<ProductNotifier, ProductsState> {
  /// Product notifier for managing product state
  ProductNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'productProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$productNotifierHash();

  @$internal
  @override
  ProductNotifier create() => ProductNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ProductsState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ProductsState>(value),
    );
  }
}

String _$productNotifierHash() => r'3c08d19a09b8921a9343df45ea2d6f659dc027a7';

/// Product notifier for managing product state

abstract class _$ProductNotifier extends $Notifier<ProductsState> {
  ProductsState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<ProductsState, ProductsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<ProductsState, ProductsState>,
              ProductsState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}

/// Selected category provider

@ProviderFor(selectedCategory)
final selectedCategoryProvider = SelectedCategoryProvider._();

/// Selected category provider

final class SelectedCategoryProvider
    extends $FunctionalProvider<Category?, Category?, Category?>
    with $Provider<Category?> {
  /// Selected category provider
  SelectedCategoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'selectedCategoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$selectedCategoryHash();

  @$internal
  @override
  $ProviderElement<Category?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  Category? create(Ref ref) {
    return selectedCategory(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Category? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Category?>(value),
    );
  }
}

String _$selectedCategoryHash() => r'137bbc9991bf48e297435fd71de6ea88c155d2df';
