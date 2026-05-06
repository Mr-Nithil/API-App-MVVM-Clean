// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(PostViewModel)
final postViewModelProvider = PostViewModelProvider._();

final class PostViewModelProvider
    extends $AsyncNotifierProvider<PostViewModel, List<Post>> {
  PostViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postViewModelHash();

  @$internal
  @override
  PostViewModel create() => PostViewModel();
}

String _$postViewModelHash() => r'47bd9c18b2f9643ffdea4eadb1ede8bdcefa90d4';

abstract class _$PostViewModel extends $AsyncNotifier<List<Post>> {
  FutureOr<List<Post>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<AsyncValue<List<Post>>, List<Post>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Post>>, List<Post>>,
              AsyncValue<List<Post>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
