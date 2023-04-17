// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wishlist_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$WishlistEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)
        addToWishlist,
    required TResult Function(String uId, String id) removeFromWishlist,
    required TResult Function(String uId) fetchAllWhislistedProducts,
    required TResult Function(String query) searchedSong,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)
        addUserAddress,
    required TResult Function(String uId) fetchUserAddress,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)
        editUserAddress,
    required TResult Function(dynamic value) radioBtnValue,
    required TResult Function(String status, String orderId, String userId)
        changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult? Function(String uId, String id)? removeFromWishlist,
    TResult? Function(String uId)? fetchAllWhislistedProducts,
    TResult? Function(String query)? searchedSong,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult? Function(String uId)? fetchUserAddress,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult? Function(dynamic value)? radioBtnValue,
    TResult? Function(String status, String orderId, String userId)?
        changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult Function(String uId, String id)? removeFromWishlist,
    TResult Function(String uId)? fetchAllWhislistedProducts,
    TResult Function(String query)? searchedSong,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult Function(String uId)? fetchUserAddress,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult Function(dynamic value)? radioBtnValue,
    TResult Function(String status, String orderId, String userId)?
        changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToWishlist value) addToWishlist,
    required TResult Function(RemoveFromWishlist value) removeFromWishlist,
    required TResult Function(FetchAllWhislistedProducts value)
        fetchAllWhislistedProducts,
    required TResult Function(SearchedSong value) searchedSong,
    required TResult Function(AddUserAddress value) addUserAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(EditUserAddress value) editUserAddress,
    required TResult Function(RadioBtnValue value) radioBtnValue,
    required TResult Function(ChangeStatus value) changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToWishlist value)? addToWishlist,
    TResult? Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult? Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult? Function(SearchedSong value)? searchedSong,
    TResult? Function(AddUserAddress value)? addUserAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(EditUserAddress value)? editUserAddress,
    TResult? Function(RadioBtnValue value)? radioBtnValue,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToWishlist value)? addToWishlist,
    TResult Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult Function(SearchedSong value)? searchedSong,
    TResult Function(AddUserAddress value)? addUserAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(EditUserAddress value)? editUserAddress,
    TResult Function(RadioBtnValue value)? radioBtnValue,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistEventCopyWith<$Res> {
  factory $WishlistEventCopyWith(
          WishlistEvent value, $Res Function(WishlistEvent) then) =
      _$WishlistEventCopyWithImpl<$Res, WishlistEvent>;
}

/// @nodoc
class _$WishlistEventCopyWithImpl<$Res, $Val extends WishlistEvent>
    implements $WishlistEventCopyWith<$Res> {
  _$WishlistEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddToWishlistCopyWith<$Res> {
  factory _$$AddToWishlistCopyWith(
          _$AddToWishlist value, $Res Function(_$AddToWishlist) then) =
      __$$AddToWishlistCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String uId,
      String id,
      String? name,
      String? brand,
      String? price,
      String? quantity,
      String? category,
      String? stock,
      String? description,
      String? subCategory,
      String? imgUrl});
}

/// @nodoc
class __$$AddToWishlistCopyWithImpl<$Res>
    extends _$WishlistEventCopyWithImpl<$Res, _$AddToWishlist>
    implements _$$AddToWishlistCopyWith<$Res> {
  __$$AddToWishlistCopyWithImpl(
      _$AddToWishlist _value, $Res Function(_$AddToWishlist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = null,
    Object? id = null,
    Object? name = freezed,
    Object? brand = freezed,
    Object? price = freezed,
    Object? quantity = freezed,
    Object? category = freezed,
    Object? stock = freezed,
    Object? description = freezed,
    Object? subCategory = freezed,
    Object? imgUrl = freezed,
  }) {
    return _then(_$AddToWishlist(
      uId: null == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      brand: freezed == brand
          ? _value.brand
          : brand // ignore: cast_nullable_to_non_nullable
              as String?,
      price: freezed == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as String?,
      quantity: freezed == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as String?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      stock: freezed == stock
          ? _value.stock
          : stock // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      subCategory: freezed == subCategory
          ? _value.subCategory
          : subCategory // ignore: cast_nullable_to_non_nullable
              as String?,
      imgUrl: freezed == imgUrl
          ? _value.imgUrl
          : imgUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddToWishlist implements AddToWishlist {
  const _$AddToWishlist(
      {required this.uId,
      required this.id,
      required this.name,
      required this.brand,
      required this.price,
      required this.quantity,
      required this.category,
      required this.stock,
      required this.description,
      required this.subCategory,
      required this.imgUrl});

  @override
  final String uId;
  @override
  final String id;
  @override
  final String? name;
  @override
  final String? brand;
  @override
  final String? price;
  @override
  final String? quantity;
  @override
  final String? category;
  @override
  final String? stock;
  @override
  final String? description;
  @override
  final String? subCategory;
  @override
  final String? imgUrl;

  @override
  String toString() {
    return 'WishlistEvent.addToWishlist(uId: $uId, id: $id, name: $name, brand: $brand, price: $price, quantity: $quantity, category: $category, stock: $stock, description: $description, subCategory: $subCategory, imgUrl: $imgUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToWishlist &&
            (identical(other.uId, uId) || other.uId == uId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.brand, brand) || other.brand == brand) &&
            (identical(other.price, price) || other.price == price) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.stock, stock) || other.stock == stock) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.subCategory, subCategory) ||
                other.subCategory == subCategory) &&
            (identical(other.imgUrl, imgUrl) || other.imgUrl == imgUrl));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uId, id, name, brand, price,
      quantity, category, stock, description, subCategory, imgUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToWishlistCopyWith<_$AddToWishlist> get copyWith =>
      __$$AddToWishlistCopyWithImpl<_$AddToWishlist>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)
        addToWishlist,
    required TResult Function(String uId, String id) removeFromWishlist,
    required TResult Function(String uId) fetchAllWhislistedProducts,
    required TResult Function(String query) searchedSong,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)
        addUserAddress,
    required TResult Function(String uId) fetchUserAddress,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)
        editUserAddress,
    required TResult Function(dynamic value) radioBtnValue,
    required TResult Function(String status, String orderId, String userId)
        changeStatus,
  }) {
    return addToWishlist(uId, id, name, brand, price, quantity, category, stock,
        description, subCategory, imgUrl);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult? Function(String uId, String id)? removeFromWishlist,
    TResult? Function(String uId)? fetchAllWhislistedProducts,
    TResult? Function(String query)? searchedSong,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult? Function(String uId)? fetchUserAddress,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult? Function(dynamic value)? radioBtnValue,
    TResult? Function(String status, String orderId, String userId)?
        changeStatus,
  }) {
    return addToWishlist?.call(uId, id, name, brand, price, quantity, category,
        stock, description, subCategory, imgUrl);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult Function(String uId, String id)? removeFromWishlist,
    TResult Function(String uId)? fetchAllWhislistedProducts,
    TResult Function(String query)? searchedSong,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult Function(String uId)? fetchUserAddress,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult Function(dynamic value)? radioBtnValue,
    TResult Function(String status, String orderId, String userId)?
        changeStatus,
    required TResult orElse(),
  }) {
    if (addToWishlist != null) {
      return addToWishlist(uId, id, name, brand, price, quantity, category,
          stock, description, subCategory, imgUrl);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToWishlist value) addToWishlist,
    required TResult Function(RemoveFromWishlist value) removeFromWishlist,
    required TResult Function(FetchAllWhislistedProducts value)
        fetchAllWhislistedProducts,
    required TResult Function(SearchedSong value) searchedSong,
    required TResult Function(AddUserAddress value) addUserAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(EditUserAddress value) editUserAddress,
    required TResult Function(RadioBtnValue value) radioBtnValue,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return addToWishlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToWishlist value)? addToWishlist,
    TResult? Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult? Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult? Function(SearchedSong value)? searchedSong,
    TResult? Function(AddUserAddress value)? addUserAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(EditUserAddress value)? editUserAddress,
    TResult? Function(RadioBtnValue value)? radioBtnValue,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return addToWishlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToWishlist value)? addToWishlist,
    TResult Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult Function(SearchedSong value)? searchedSong,
    TResult Function(AddUserAddress value)? addUserAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(EditUserAddress value)? editUserAddress,
    TResult Function(RadioBtnValue value)? radioBtnValue,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (addToWishlist != null) {
      return addToWishlist(this);
    }
    return orElse();
  }
}

abstract class AddToWishlist implements WishlistEvent {
  const factory AddToWishlist(
      {required final String uId,
      required final String id,
      required final String? name,
      required final String? brand,
      required final String? price,
      required final String? quantity,
      required final String? category,
      required final String? stock,
      required final String? description,
      required final String? subCategory,
      required final String? imgUrl}) = _$AddToWishlist;

  String get uId;
  String get id;
  String? get name;
  String? get brand;
  String? get price;
  String? get quantity;
  String? get category;
  String? get stock;
  String? get description;
  String? get subCategory;
  String? get imgUrl;
  @JsonKey(ignore: true)
  _$$AddToWishlistCopyWith<_$AddToWishlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromWishlistCopyWith<$Res> {
  factory _$$RemoveFromWishlistCopyWith(_$RemoveFromWishlist value,
          $Res Function(_$RemoveFromWishlist) then) =
      __$$RemoveFromWishlistCopyWithImpl<$Res>;
  @useResult
  $Res call({String uId, String id});
}

/// @nodoc
class __$$RemoveFromWishlistCopyWithImpl<$Res>
    extends _$WishlistEventCopyWithImpl<$Res, _$RemoveFromWishlist>
    implements _$$RemoveFromWishlistCopyWith<$Res> {
  __$$RemoveFromWishlistCopyWithImpl(
      _$RemoveFromWishlist _value, $Res Function(_$RemoveFromWishlist) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = null,
    Object? id = null,
  }) {
    return _then(_$RemoveFromWishlist(
      uId: null == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$RemoveFromWishlist implements RemoveFromWishlist {
  const _$RemoveFromWishlist({required this.uId, required this.id});

  @override
  final String uId;
  @override
  final String id;

  @override
  String toString() {
    return 'WishlistEvent.removeFromWishlist(uId: $uId, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromWishlist &&
            (identical(other.uId, uId) || other.uId == uId) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uId, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromWishlistCopyWith<_$RemoveFromWishlist> get copyWith =>
      __$$RemoveFromWishlistCopyWithImpl<_$RemoveFromWishlist>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)
        addToWishlist,
    required TResult Function(String uId, String id) removeFromWishlist,
    required TResult Function(String uId) fetchAllWhislistedProducts,
    required TResult Function(String query) searchedSong,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)
        addUserAddress,
    required TResult Function(String uId) fetchUserAddress,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)
        editUserAddress,
    required TResult Function(dynamic value) radioBtnValue,
    required TResult Function(String status, String orderId, String userId)
        changeStatus,
  }) {
    return removeFromWishlist(uId, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult? Function(String uId, String id)? removeFromWishlist,
    TResult? Function(String uId)? fetchAllWhislistedProducts,
    TResult? Function(String query)? searchedSong,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult? Function(String uId)? fetchUserAddress,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult? Function(dynamic value)? radioBtnValue,
    TResult? Function(String status, String orderId, String userId)?
        changeStatus,
  }) {
    return removeFromWishlist?.call(uId, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult Function(String uId, String id)? removeFromWishlist,
    TResult Function(String uId)? fetchAllWhislistedProducts,
    TResult Function(String query)? searchedSong,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult Function(String uId)? fetchUserAddress,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult Function(dynamic value)? radioBtnValue,
    TResult Function(String status, String orderId, String userId)?
        changeStatus,
    required TResult orElse(),
  }) {
    if (removeFromWishlist != null) {
      return removeFromWishlist(uId, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToWishlist value) addToWishlist,
    required TResult Function(RemoveFromWishlist value) removeFromWishlist,
    required TResult Function(FetchAllWhislistedProducts value)
        fetchAllWhislistedProducts,
    required TResult Function(SearchedSong value) searchedSong,
    required TResult Function(AddUserAddress value) addUserAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(EditUserAddress value) editUserAddress,
    required TResult Function(RadioBtnValue value) radioBtnValue,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return removeFromWishlist(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToWishlist value)? addToWishlist,
    TResult? Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult? Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult? Function(SearchedSong value)? searchedSong,
    TResult? Function(AddUserAddress value)? addUserAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(EditUserAddress value)? editUserAddress,
    TResult? Function(RadioBtnValue value)? radioBtnValue,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return removeFromWishlist?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToWishlist value)? addToWishlist,
    TResult Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult Function(SearchedSong value)? searchedSong,
    TResult Function(AddUserAddress value)? addUserAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(EditUserAddress value)? editUserAddress,
    TResult Function(RadioBtnValue value)? radioBtnValue,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (removeFromWishlist != null) {
      return removeFromWishlist(this);
    }
    return orElse();
  }
}

abstract class RemoveFromWishlist implements WishlistEvent {
  const factory RemoveFromWishlist(
      {required final String uId,
      required final String id}) = _$RemoveFromWishlist;

  String get uId;
  String get id;
  @JsonKey(ignore: true)
  _$$RemoveFromWishlistCopyWith<_$RemoveFromWishlist> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchAllWhislistedProductsCopyWith<$Res> {
  factory _$$FetchAllWhislistedProductsCopyWith(
          _$FetchAllWhislistedProducts value,
          $Res Function(_$FetchAllWhislistedProducts) then) =
      __$$FetchAllWhislistedProductsCopyWithImpl<$Res>;
  @useResult
  $Res call({String uId});
}

/// @nodoc
class __$$FetchAllWhislistedProductsCopyWithImpl<$Res>
    extends _$WishlistEventCopyWithImpl<$Res, _$FetchAllWhislistedProducts>
    implements _$$FetchAllWhislistedProductsCopyWith<$Res> {
  __$$FetchAllWhislistedProductsCopyWithImpl(
      _$FetchAllWhislistedProducts _value,
      $Res Function(_$FetchAllWhislistedProducts) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = null,
  }) {
    return _then(_$FetchAllWhislistedProducts(
      uId: null == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchAllWhislistedProducts implements FetchAllWhislistedProducts {
  const _$FetchAllWhislistedProducts({required this.uId});

  @override
  final String uId;

  @override
  String toString() {
    return 'WishlistEvent.fetchAllWhislistedProducts(uId: $uId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchAllWhislistedProducts &&
            (identical(other.uId, uId) || other.uId == uId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchAllWhislistedProductsCopyWith<_$FetchAllWhislistedProducts>
      get copyWith => __$$FetchAllWhislistedProductsCopyWithImpl<
          _$FetchAllWhislistedProducts>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)
        addToWishlist,
    required TResult Function(String uId, String id) removeFromWishlist,
    required TResult Function(String uId) fetchAllWhislistedProducts,
    required TResult Function(String query) searchedSong,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)
        addUserAddress,
    required TResult Function(String uId) fetchUserAddress,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)
        editUserAddress,
    required TResult Function(dynamic value) radioBtnValue,
    required TResult Function(String status, String orderId, String userId)
        changeStatus,
  }) {
    return fetchAllWhislistedProducts(uId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult? Function(String uId, String id)? removeFromWishlist,
    TResult? Function(String uId)? fetchAllWhislistedProducts,
    TResult? Function(String query)? searchedSong,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult? Function(String uId)? fetchUserAddress,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult? Function(dynamic value)? radioBtnValue,
    TResult? Function(String status, String orderId, String userId)?
        changeStatus,
  }) {
    return fetchAllWhislistedProducts?.call(uId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult Function(String uId, String id)? removeFromWishlist,
    TResult Function(String uId)? fetchAllWhislistedProducts,
    TResult Function(String query)? searchedSong,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult Function(String uId)? fetchUserAddress,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult Function(dynamic value)? radioBtnValue,
    TResult Function(String status, String orderId, String userId)?
        changeStatus,
    required TResult orElse(),
  }) {
    if (fetchAllWhislistedProducts != null) {
      return fetchAllWhislistedProducts(uId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToWishlist value) addToWishlist,
    required TResult Function(RemoveFromWishlist value) removeFromWishlist,
    required TResult Function(FetchAllWhislistedProducts value)
        fetchAllWhislistedProducts,
    required TResult Function(SearchedSong value) searchedSong,
    required TResult Function(AddUserAddress value) addUserAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(EditUserAddress value) editUserAddress,
    required TResult Function(RadioBtnValue value) radioBtnValue,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return fetchAllWhislistedProducts(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToWishlist value)? addToWishlist,
    TResult? Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult? Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult? Function(SearchedSong value)? searchedSong,
    TResult? Function(AddUserAddress value)? addUserAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(EditUserAddress value)? editUserAddress,
    TResult? Function(RadioBtnValue value)? radioBtnValue,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return fetchAllWhislistedProducts?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToWishlist value)? addToWishlist,
    TResult Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult Function(SearchedSong value)? searchedSong,
    TResult Function(AddUserAddress value)? addUserAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(EditUserAddress value)? editUserAddress,
    TResult Function(RadioBtnValue value)? radioBtnValue,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (fetchAllWhislistedProducts != null) {
      return fetchAllWhislistedProducts(this);
    }
    return orElse();
  }
}

abstract class FetchAllWhislistedProducts implements WishlistEvent {
  const factory FetchAllWhislistedProducts({required final String uId}) =
      _$FetchAllWhislistedProducts;

  String get uId;
  @JsonKey(ignore: true)
  _$$FetchAllWhislistedProductsCopyWith<_$FetchAllWhislistedProducts>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SearchedSongCopyWith<$Res> {
  factory _$$SearchedSongCopyWith(
          _$SearchedSong value, $Res Function(_$SearchedSong) then) =
      __$$SearchedSongCopyWithImpl<$Res>;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$$SearchedSongCopyWithImpl<$Res>
    extends _$WishlistEventCopyWithImpl<$Res, _$SearchedSong>
    implements _$$SearchedSongCopyWith<$Res> {
  __$$SearchedSongCopyWithImpl(
      _$SearchedSong _value, $Res Function(_$SearchedSong) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? query = null,
  }) {
    return _then(_$SearchedSong(
      query: null == query
          ? _value.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$SearchedSong implements SearchedSong {
  const _$SearchedSong({required this.query});

  @override
  final String query;

  @override
  String toString() {
    return 'WishlistEvent.searchedSong(query: $query)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SearchedSong &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchedSongCopyWith<_$SearchedSong> get copyWith =>
      __$$SearchedSongCopyWithImpl<_$SearchedSong>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)
        addToWishlist,
    required TResult Function(String uId, String id) removeFromWishlist,
    required TResult Function(String uId) fetchAllWhislistedProducts,
    required TResult Function(String query) searchedSong,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)
        addUserAddress,
    required TResult Function(String uId) fetchUserAddress,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)
        editUserAddress,
    required TResult Function(dynamic value) radioBtnValue,
    required TResult Function(String status, String orderId, String userId)
        changeStatus,
  }) {
    return searchedSong(query);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult? Function(String uId, String id)? removeFromWishlist,
    TResult? Function(String uId)? fetchAllWhislistedProducts,
    TResult? Function(String query)? searchedSong,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult? Function(String uId)? fetchUserAddress,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult? Function(dynamic value)? radioBtnValue,
    TResult? Function(String status, String orderId, String userId)?
        changeStatus,
  }) {
    return searchedSong?.call(query);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult Function(String uId, String id)? removeFromWishlist,
    TResult Function(String uId)? fetchAllWhislistedProducts,
    TResult Function(String query)? searchedSong,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult Function(String uId)? fetchUserAddress,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult Function(dynamic value)? radioBtnValue,
    TResult Function(String status, String orderId, String userId)?
        changeStatus,
    required TResult orElse(),
  }) {
    if (searchedSong != null) {
      return searchedSong(query);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToWishlist value) addToWishlist,
    required TResult Function(RemoveFromWishlist value) removeFromWishlist,
    required TResult Function(FetchAllWhislistedProducts value)
        fetchAllWhislistedProducts,
    required TResult Function(SearchedSong value) searchedSong,
    required TResult Function(AddUserAddress value) addUserAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(EditUserAddress value) editUserAddress,
    required TResult Function(RadioBtnValue value) radioBtnValue,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return searchedSong(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToWishlist value)? addToWishlist,
    TResult? Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult? Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult? Function(SearchedSong value)? searchedSong,
    TResult? Function(AddUserAddress value)? addUserAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(EditUserAddress value)? editUserAddress,
    TResult? Function(RadioBtnValue value)? radioBtnValue,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return searchedSong?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToWishlist value)? addToWishlist,
    TResult Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult Function(SearchedSong value)? searchedSong,
    TResult Function(AddUserAddress value)? addUserAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(EditUserAddress value)? editUserAddress,
    TResult Function(RadioBtnValue value)? radioBtnValue,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (searchedSong != null) {
      return searchedSong(this);
    }
    return orElse();
  }
}

abstract class SearchedSong implements WishlistEvent {
  const factory SearchedSong({required final String query}) = _$SearchedSong;

  String get query;
  @JsonKey(ignore: true)
  _$$SearchedSongCopyWith<_$SearchedSong> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AddUserAddressCopyWith<$Res> {
  factory _$$AddUserAddressCopyWith(
          _$AddUserAddress value, $Res Function(_$AddUserAddress) then) =
      __$$AddUserAddressCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? name,
      String? number,
      String? pincode,
      String? area,
      String? town,
      String? state,
      String? country,
      String? uId});
}

/// @nodoc
class __$$AddUserAddressCopyWithImpl<$Res>
    extends _$WishlistEventCopyWithImpl<$Res, _$AddUserAddress>
    implements _$$AddUserAddressCopyWith<$Res> {
  __$$AddUserAddressCopyWithImpl(
      _$AddUserAddress _value, $Res Function(_$AddUserAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? number = freezed,
    Object? pincode = freezed,
    Object? area = freezed,
    Object? town = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? uId = freezed,
  }) {
    return _then(_$AddUserAddress(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      town: freezed == town
          ? _value.town
          : town // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      uId: freezed == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddUserAddress implements AddUserAddress {
  const _$AddUserAddress(
      {required this.name,
      required this.number,
      required this.pincode,
      required this.area,
      required this.town,
      required this.state,
      required this.country,
      required this.uId});

  @override
  final String? name;
  @override
  final String? number;
  @override
  final String? pincode;
  @override
  final String? area;
  @override
  final String? town;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? uId;

  @override
  String toString() {
    return 'WishlistEvent.addUserAddress(name: $name, number: $number, pincode: $pincode, area: $area, town: $town, state: $state, country: $country, uId: $uId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddUserAddress &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.town, town) || other.town == town) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.uId, uId) || other.uId == uId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, number, pincode, area, town, state, country, uId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddUserAddressCopyWith<_$AddUserAddress> get copyWith =>
      __$$AddUserAddressCopyWithImpl<_$AddUserAddress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)
        addToWishlist,
    required TResult Function(String uId, String id) removeFromWishlist,
    required TResult Function(String uId) fetchAllWhislistedProducts,
    required TResult Function(String query) searchedSong,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)
        addUserAddress,
    required TResult Function(String uId) fetchUserAddress,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)
        editUserAddress,
    required TResult Function(dynamic value) radioBtnValue,
    required TResult Function(String status, String orderId, String userId)
        changeStatus,
  }) {
    return addUserAddress(
        name, number, pincode, area, town, state, country, uId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult? Function(String uId, String id)? removeFromWishlist,
    TResult? Function(String uId)? fetchAllWhislistedProducts,
    TResult? Function(String query)? searchedSong,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult? Function(String uId)? fetchUserAddress,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult? Function(dynamic value)? radioBtnValue,
    TResult? Function(String status, String orderId, String userId)?
        changeStatus,
  }) {
    return addUserAddress?.call(
        name, number, pincode, area, town, state, country, uId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult Function(String uId, String id)? removeFromWishlist,
    TResult Function(String uId)? fetchAllWhislistedProducts,
    TResult Function(String query)? searchedSong,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult Function(String uId)? fetchUserAddress,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult Function(dynamic value)? radioBtnValue,
    TResult Function(String status, String orderId, String userId)?
        changeStatus,
    required TResult orElse(),
  }) {
    if (addUserAddress != null) {
      return addUserAddress(
          name, number, pincode, area, town, state, country, uId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToWishlist value) addToWishlist,
    required TResult Function(RemoveFromWishlist value) removeFromWishlist,
    required TResult Function(FetchAllWhislistedProducts value)
        fetchAllWhislistedProducts,
    required TResult Function(SearchedSong value) searchedSong,
    required TResult Function(AddUserAddress value) addUserAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(EditUserAddress value) editUserAddress,
    required TResult Function(RadioBtnValue value) radioBtnValue,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return addUserAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToWishlist value)? addToWishlist,
    TResult? Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult? Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult? Function(SearchedSong value)? searchedSong,
    TResult? Function(AddUserAddress value)? addUserAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(EditUserAddress value)? editUserAddress,
    TResult? Function(RadioBtnValue value)? radioBtnValue,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return addUserAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToWishlist value)? addToWishlist,
    TResult Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult Function(SearchedSong value)? searchedSong,
    TResult Function(AddUserAddress value)? addUserAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(EditUserAddress value)? editUserAddress,
    TResult Function(RadioBtnValue value)? radioBtnValue,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (addUserAddress != null) {
      return addUserAddress(this);
    }
    return orElse();
  }
}

abstract class AddUserAddress implements WishlistEvent {
  const factory AddUserAddress(
      {required final String? name,
      required final String? number,
      required final String? pincode,
      required final String? area,
      required final String? town,
      required final String? state,
      required final String? country,
      required final String? uId}) = _$AddUserAddress;

  String? get name;
  String? get number;
  String? get pincode;
  String? get area;
  String? get town;
  String? get state;
  String? get country;
  String? get uId;
  @JsonKey(ignore: true)
  _$$AddUserAddressCopyWith<_$AddUserAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchUserAddressCopyWith<$Res> {
  factory _$$FetchUserAddressCopyWith(
          _$FetchUserAddress value, $Res Function(_$FetchUserAddress) then) =
      __$$FetchUserAddressCopyWithImpl<$Res>;
  @useResult
  $Res call({String uId});
}

/// @nodoc
class __$$FetchUserAddressCopyWithImpl<$Res>
    extends _$WishlistEventCopyWithImpl<$Res, _$FetchUserAddress>
    implements _$$FetchUserAddressCopyWith<$Res> {
  __$$FetchUserAddressCopyWithImpl(
      _$FetchUserAddress _value, $Res Function(_$FetchUserAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uId = null,
  }) {
    return _then(_$FetchUserAddress(
      uId: null == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FetchUserAddress implements FetchUserAddress {
  const _$FetchUserAddress({required this.uId});

  @override
  final String uId;

  @override
  String toString() {
    return 'WishlistEvent.fetchUserAddress(uId: $uId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchUserAddress &&
            (identical(other.uId, uId) || other.uId == uId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, uId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetchUserAddressCopyWith<_$FetchUserAddress> get copyWith =>
      __$$FetchUserAddressCopyWithImpl<_$FetchUserAddress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)
        addToWishlist,
    required TResult Function(String uId, String id) removeFromWishlist,
    required TResult Function(String uId) fetchAllWhislistedProducts,
    required TResult Function(String query) searchedSong,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)
        addUserAddress,
    required TResult Function(String uId) fetchUserAddress,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)
        editUserAddress,
    required TResult Function(dynamic value) radioBtnValue,
    required TResult Function(String status, String orderId, String userId)
        changeStatus,
  }) {
    return fetchUserAddress(uId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult? Function(String uId, String id)? removeFromWishlist,
    TResult? Function(String uId)? fetchAllWhislistedProducts,
    TResult? Function(String query)? searchedSong,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult? Function(String uId)? fetchUserAddress,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult? Function(dynamic value)? radioBtnValue,
    TResult? Function(String status, String orderId, String userId)?
        changeStatus,
  }) {
    return fetchUserAddress?.call(uId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult Function(String uId, String id)? removeFromWishlist,
    TResult Function(String uId)? fetchAllWhislistedProducts,
    TResult Function(String query)? searchedSong,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult Function(String uId)? fetchUserAddress,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult Function(dynamic value)? radioBtnValue,
    TResult Function(String status, String orderId, String userId)?
        changeStatus,
    required TResult orElse(),
  }) {
    if (fetchUserAddress != null) {
      return fetchUserAddress(uId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToWishlist value) addToWishlist,
    required TResult Function(RemoveFromWishlist value) removeFromWishlist,
    required TResult Function(FetchAllWhislistedProducts value)
        fetchAllWhislistedProducts,
    required TResult Function(SearchedSong value) searchedSong,
    required TResult Function(AddUserAddress value) addUserAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(EditUserAddress value) editUserAddress,
    required TResult Function(RadioBtnValue value) radioBtnValue,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return fetchUserAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToWishlist value)? addToWishlist,
    TResult? Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult? Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult? Function(SearchedSong value)? searchedSong,
    TResult? Function(AddUserAddress value)? addUserAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(EditUserAddress value)? editUserAddress,
    TResult? Function(RadioBtnValue value)? radioBtnValue,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return fetchUserAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToWishlist value)? addToWishlist,
    TResult Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult Function(SearchedSong value)? searchedSong,
    TResult Function(AddUserAddress value)? addUserAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(EditUserAddress value)? editUserAddress,
    TResult Function(RadioBtnValue value)? radioBtnValue,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (fetchUserAddress != null) {
      return fetchUserAddress(this);
    }
    return orElse();
  }
}

abstract class FetchUserAddress implements WishlistEvent {
  const factory FetchUserAddress({required final String uId}) =
      _$FetchUserAddress;

  String get uId;
  @JsonKey(ignore: true)
  _$$FetchUserAddressCopyWith<_$FetchUserAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$EditUserAddressCopyWith<$Res> {
  factory _$$EditUserAddressCopyWith(
          _$EditUserAddress value, $Res Function(_$EditUserAddress) then) =
      __$$EditUserAddressCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? name,
      String? number,
      String? pincode,
      String? area,
      String? town,
      String? state,
      String? country,
      String? uId,
      String? id});
}

/// @nodoc
class __$$EditUserAddressCopyWithImpl<$Res>
    extends _$WishlistEventCopyWithImpl<$Res, _$EditUserAddress>
    implements _$$EditUserAddressCopyWith<$Res> {
  __$$EditUserAddressCopyWithImpl(
      _$EditUserAddress _value, $Res Function(_$EditUserAddress) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? number = freezed,
    Object? pincode = freezed,
    Object? area = freezed,
    Object? town = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? uId = freezed,
    Object? id = freezed,
  }) {
    return _then(_$EditUserAddress(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      number: freezed == number
          ? _value.number
          : number // ignore: cast_nullable_to_non_nullable
              as String?,
      pincode: freezed == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String?,
      area: freezed == area
          ? _value.area
          : area // ignore: cast_nullable_to_non_nullable
              as String?,
      town: freezed == town
          ? _value.town
          : town // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      uId: freezed == uId
          ? _value.uId
          : uId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$EditUserAddress implements EditUserAddress {
  const _$EditUserAddress(
      {required this.name,
      required this.number,
      required this.pincode,
      required this.area,
      required this.town,
      required this.state,
      required this.country,
      required this.uId,
      required this.id});

  @override
  final String? name;
  @override
  final String? number;
  @override
  final String? pincode;
  @override
  final String? area;
  @override
  final String? town;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? uId;
  @override
  final String? id;

  @override
  String toString() {
    return 'WishlistEvent.editUserAddress(name: $name, number: $number, pincode: $pincode, area: $area, town: $town, state: $state, country: $country, uId: $uId, id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EditUserAddress &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.number, number) || other.number == number) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.area, area) || other.area == area) &&
            (identical(other.town, town) || other.town == town) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.uId, uId) || other.uId == uId) &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, name, number, pincode, area, town, state, country, uId, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EditUserAddressCopyWith<_$EditUserAddress> get copyWith =>
      __$$EditUserAddressCopyWithImpl<_$EditUserAddress>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)
        addToWishlist,
    required TResult Function(String uId, String id) removeFromWishlist,
    required TResult Function(String uId) fetchAllWhislistedProducts,
    required TResult Function(String query) searchedSong,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)
        addUserAddress,
    required TResult Function(String uId) fetchUserAddress,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)
        editUserAddress,
    required TResult Function(dynamic value) radioBtnValue,
    required TResult Function(String status, String orderId, String userId)
        changeStatus,
  }) {
    return editUserAddress(
        name, number, pincode, area, town, state, country, uId, id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult? Function(String uId, String id)? removeFromWishlist,
    TResult? Function(String uId)? fetchAllWhislistedProducts,
    TResult? Function(String query)? searchedSong,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult? Function(String uId)? fetchUserAddress,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult? Function(dynamic value)? radioBtnValue,
    TResult? Function(String status, String orderId, String userId)?
        changeStatus,
  }) {
    return editUserAddress?.call(
        name, number, pincode, area, town, state, country, uId, id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult Function(String uId, String id)? removeFromWishlist,
    TResult Function(String uId)? fetchAllWhislistedProducts,
    TResult Function(String query)? searchedSong,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult Function(String uId)? fetchUserAddress,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult Function(dynamic value)? radioBtnValue,
    TResult Function(String status, String orderId, String userId)?
        changeStatus,
    required TResult orElse(),
  }) {
    if (editUserAddress != null) {
      return editUserAddress(
          name, number, pincode, area, town, state, country, uId, id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToWishlist value) addToWishlist,
    required TResult Function(RemoveFromWishlist value) removeFromWishlist,
    required TResult Function(FetchAllWhislistedProducts value)
        fetchAllWhislistedProducts,
    required TResult Function(SearchedSong value) searchedSong,
    required TResult Function(AddUserAddress value) addUserAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(EditUserAddress value) editUserAddress,
    required TResult Function(RadioBtnValue value) radioBtnValue,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return editUserAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToWishlist value)? addToWishlist,
    TResult? Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult? Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult? Function(SearchedSong value)? searchedSong,
    TResult? Function(AddUserAddress value)? addUserAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(EditUserAddress value)? editUserAddress,
    TResult? Function(RadioBtnValue value)? radioBtnValue,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return editUserAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToWishlist value)? addToWishlist,
    TResult Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult Function(SearchedSong value)? searchedSong,
    TResult Function(AddUserAddress value)? addUserAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(EditUserAddress value)? editUserAddress,
    TResult Function(RadioBtnValue value)? radioBtnValue,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (editUserAddress != null) {
      return editUserAddress(this);
    }
    return orElse();
  }
}

abstract class EditUserAddress implements WishlistEvent {
  const factory EditUserAddress(
      {required final String? name,
      required final String? number,
      required final String? pincode,
      required final String? area,
      required final String? town,
      required final String? state,
      required final String? country,
      required final String? uId,
      required final String? id}) = _$EditUserAddress;

  String? get name;
  String? get number;
  String? get pincode;
  String? get area;
  String? get town;
  String? get state;
  String? get country;
  String? get uId;
  String? get id;
  @JsonKey(ignore: true)
  _$$EditUserAddressCopyWith<_$EditUserAddress> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RadioBtnValueCopyWith<$Res> {
  factory _$$RadioBtnValueCopyWith(
          _$RadioBtnValue value, $Res Function(_$RadioBtnValue) then) =
      __$$RadioBtnValueCopyWithImpl<$Res>;
  @useResult
  $Res call({dynamic value});
}

/// @nodoc
class __$$RadioBtnValueCopyWithImpl<$Res>
    extends _$WishlistEventCopyWithImpl<$Res, _$RadioBtnValue>
    implements _$$RadioBtnValueCopyWith<$Res> {
  __$$RadioBtnValueCopyWithImpl(
      _$RadioBtnValue _value, $Res Function(_$RadioBtnValue) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = freezed,
  }) {
    return _then(_$RadioBtnValue(
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

class _$RadioBtnValue implements RadioBtnValue {
  const _$RadioBtnValue({required this.value});

  @override
  final dynamic value;

  @override
  String toString() {
    return 'WishlistEvent.radioBtnValue(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RadioBtnValue &&
            const DeepCollectionEquality().equals(other.value, value));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(value));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RadioBtnValueCopyWith<_$RadioBtnValue> get copyWith =>
      __$$RadioBtnValueCopyWithImpl<_$RadioBtnValue>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)
        addToWishlist,
    required TResult Function(String uId, String id) removeFromWishlist,
    required TResult Function(String uId) fetchAllWhislistedProducts,
    required TResult Function(String query) searchedSong,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)
        addUserAddress,
    required TResult Function(String uId) fetchUserAddress,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)
        editUserAddress,
    required TResult Function(dynamic value) radioBtnValue,
    required TResult Function(String status, String orderId, String userId)
        changeStatus,
  }) {
    return radioBtnValue(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult? Function(String uId, String id)? removeFromWishlist,
    TResult? Function(String uId)? fetchAllWhislistedProducts,
    TResult? Function(String query)? searchedSong,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult? Function(String uId)? fetchUserAddress,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult? Function(dynamic value)? radioBtnValue,
    TResult? Function(String status, String orderId, String userId)?
        changeStatus,
  }) {
    return radioBtnValue?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult Function(String uId, String id)? removeFromWishlist,
    TResult Function(String uId)? fetchAllWhislistedProducts,
    TResult Function(String query)? searchedSong,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult Function(String uId)? fetchUserAddress,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult Function(dynamic value)? radioBtnValue,
    TResult Function(String status, String orderId, String userId)?
        changeStatus,
    required TResult orElse(),
  }) {
    if (radioBtnValue != null) {
      return radioBtnValue(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToWishlist value) addToWishlist,
    required TResult Function(RemoveFromWishlist value) removeFromWishlist,
    required TResult Function(FetchAllWhislistedProducts value)
        fetchAllWhislistedProducts,
    required TResult Function(SearchedSong value) searchedSong,
    required TResult Function(AddUserAddress value) addUserAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(EditUserAddress value) editUserAddress,
    required TResult Function(RadioBtnValue value) radioBtnValue,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return radioBtnValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToWishlist value)? addToWishlist,
    TResult? Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult? Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult? Function(SearchedSong value)? searchedSong,
    TResult? Function(AddUserAddress value)? addUserAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(EditUserAddress value)? editUserAddress,
    TResult? Function(RadioBtnValue value)? radioBtnValue,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return radioBtnValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToWishlist value)? addToWishlist,
    TResult Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult Function(SearchedSong value)? searchedSong,
    TResult Function(AddUserAddress value)? addUserAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(EditUserAddress value)? editUserAddress,
    TResult Function(RadioBtnValue value)? radioBtnValue,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (radioBtnValue != null) {
      return radioBtnValue(this);
    }
    return orElse();
  }
}

abstract class RadioBtnValue implements WishlistEvent {
  const factory RadioBtnValue({required final dynamic value}) = _$RadioBtnValue;

  dynamic get value;
  @JsonKey(ignore: true)
  _$$RadioBtnValueCopyWith<_$RadioBtnValue> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ChangeStatusCopyWith<$Res> {
  factory _$$ChangeStatusCopyWith(
          _$ChangeStatus value, $Res Function(_$ChangeStatus) then) =
      __$$ChangeStatusCopyWithImpl<$Res>;
  @useResult
  $Res call({String status, String orderId, String userId});
}

/// @nodoc
class __$$ChangeStatusCopyWithImpl<$Res>
    extends _$WishlistEventCopyWithImpl<$Res, _$ChangeStatus>
    implements _$$ChangeStatusCopyWith<$Res> {
  __$$ChangeStatusCopyWithImpl(
      _$ChangeStatus _value, $Res Function(_$ChangeStatus) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? orderId = null,
    Object? userId = null,
  }) {
    return _then(_$ChangeStatus(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      orderId: null == orderId
          ? _value.orderId
          : orderId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ChangeStatus implements ChangeStatus {
  const _$ChangeStatus(
      {required this.status, required this.orderId, required this.userId});

  @override
  final String status;
  @override
  final String orderId;
  @override
  final String userId;

  @override
  String toString() {
    return 'WishlistEvent.changeStatus(status: $status, orderId: $orderId, userId: $userId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChangeStatus &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.orderId, orderId) || other.orderId == orderId) &&
            (identical(other.userId, userId) || other.userId == userId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, orderId, userId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ChangeStatusCopyWith<_$ChangeStatus> get copyWith =>
      __$$ChangeStatusCopyWithImpl<_$ChangeStatus>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)
        addToWishlist,
    required TResult Function(String uId, String id) removeFromWishlist,
    required TResult Function(String uId) fetchAllWhislistedProducts,
    required TResult Function(String query) searchedSong,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)
        addUserAddress,
    required TResult Function(String uId) fetchUserAddress,
    required TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)
        editUserAddress,
    required TResult Function(dynamic value) radioBtnValue,
    required TResult Function(String status, String orderId, String userId)
        changeStatus,
  }) {
    return changeStatus(status, orderId, userId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult? Function(String uId, String id)? removeFromWishlist,
    TResult? Function(String uId)? fetchAllWhislistedProducts,
    TResult? Function(String query)? searchedSong,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult? Function(String uId)? fetchUserAddress,
    TResult? Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult? Function(dynamic value)? radioBtnValue,
    TResult? Function(String status, String orderId, String userId)?
        changeStatus,
  }) {
    return changeStatus?.call(status, orderId, userId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String uId,
            String id,
            String? name,
            String? brand,
            String? price,
            String? quantity,
            String? category,
            String? stock,
            String? description,
            String? subCategory,
            String? imgUrl)?
        addToWishlist,
    TResult Function(String uId, String id)? removeFromWishlist,
    TResult Function(String uId)? fetchAllWhislistedProducts,
    TResult Function(String query)? searchedSong,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId)?
        addUserAddress,
    TResult Function(String uId)? fetchUserAddress,
    TResult Function(
            String? name,
            String? number,
            String? pincode,
            String? area,
            String? town,
            String? state,
            String? country,
            String? uId,
            String? id)?
        editUserAddress,
    TResult Function(dynamic value)? radioBtnValue,
    TResult Function(String status, String orderId, String userId)?
        changeStatus,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus(status, orderId, userId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AddToWishlist value) addToWishlist,
    required TResult Function(RemoveFromWishlist value) removeFromWishlist,
    required TResult Function(FetchAllWhislistedProducts value)
        fetchAllWhislistedProducts,
    required TResult Function(SearchedSong value) searchedSong,
    required TResult Function(AddUserAddress value) addUserAddress,
    required TResult Function(FetchUserAddress value) fetchUserAddress,
    required TResult Function(EditUserAddress value) editUserAddress,
    required TResult Function(RadioBtnValue value) radioBtnValue,
    required TResult Function(ChangeStatus value) changeStatus,
  }) {
    return changeStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AddToWishlist value)? addToWishlist,
    TResult? Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult? Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult? Function(SearchedSong value)? searchedSong,
    TResult? Function(AddUserAddress value)? addUserAddress,
    TResult? Function(FetchUserAddress value)? fetchUserAddress,
    TResult? Function(EditUserAddress value)? editUserAddress,
    TResult? Function(RadioBtnValue value)? radioBtnValue,
    TResult? Function(ChangeStatus value)? changeStatus,
  }) {
    return changeStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AddToWishlist value)? addToWishlist,
    TResult Function(RemoveFromWishlist value)? removeFromWishlist,
    TResult Function(FetchAllWhislistedProducts value)?
        fetchAllWhislistedProducts,
    TResult Function(SearchedSong value)? searchedSong,
    TResult Function(AddUserAddress value)? addUserAddress,
    TResult Function(FetchUserAddress value)? fetchUserAddress,
    TResult Function(EditUserAddress value)? editUserAddress,
    TResult Function(RadioBtnValue value)? radioBtnValue,
    TResult Function(ChangeStatus value)? changeStatus,
    required TResult orElse(),
  }) {
    if (changeStatus != null) {
      return changeStatus(this);
    }
    return orElse();
  }
}

abstract class ChangeStatus implements WishlistEvent {
  const factory ChangeStatus(
      {required final String status,
      required final String orderId,
      required final String userId}) = _$ChangeStatus;

  String get status;
  String get orderId;
  String get userId;
  @JsonKey(ignore: true)
  _$$ChangeStatusCopyWith<_$ChangeStatus> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$WishlistState {
  dynamic get function => throw _privateConstructorUsedError;
  List<dynamic> get allProductsInWishlist => throw _privateConstructorUsedError;
  List<dynamic> get searchedList => throw _privateConstructorUsedError;
  List<dynamic> get userAddressList => throw _privateConstructorUsedError;
  dynamic get value => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $WishlistStateCopyWith<WishlistState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WishlistStateCopyWith<$Res> {
  factory $WishlistStateCopyWith(
          WishlistState value, $Res Function(WishlistState) then) =
      _$WishlistStateCopyWithImpl<$Res, WishlistState>;
  @useResult
  $Res call(
      {dynamic function,
      List<dynamic> allProductsInWishlist,
      List<dynamic> searchedList,
      List<dynamic> userAddressList,
      dynamic value,
      String status});
}

/// @nodoc
class _$WishlistStateCopyWithImpl<$Res, $Val extends WishlistState>
    implements $WishlistStateCopyWith<$Res> {
  _$WishlistStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? function = freezed,
    Object? allProductsInWishlist = null,
    Object? searchedList = null,
    Object? userAddressList = null,
    Object? value = freezed,
    Object? status = null,
  }) {
    return _then(_value.copyWith(
      function: freezed == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as dynamic,
      allProductsInWishlist: null == allProductsInWishlist
          ? _value.allProductsInWishlist
          : allProductsInWishlist // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      searchedList: null == searchedList
          ? _value.searchedList
          : searchedList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      userAddressList: null == userAddressList
          ? _value.userAddressList
          : userAddressList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res>
    implements $WishlistStateCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic function,
      List<dynamic> allProductsInWishlist,
      List<dynamic> searchedList,
      List<dynamic> userAddressList,
      dynamic value,
      String status});
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$WishlistStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? function = freezed,
    Object? allProductsInWishlist = null,
    Object? searchedList = null,
    Object? userAddressList = null,
    Object? value = freezed,
    Object? status = null,
  }) {
    return _then(_$_Initial(
      function: freezed == function
          ? _value.function
          : function // ignore: cast_nullable_to_non_nullable
              as dynamic,
      allProductsInWishlist: null == allProductsInWishlist
          ? _value._allProductsInWishlist
          : allProductsInWishlist // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      searchedList: null == searchedList
          ? _value._searchedList
          : searchedList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      userAddressList: null == userAddressList
          ? _value._userAddressList
          : userAddressList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      value: freezed == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial(
      {required this.function,
      required final List<dynamic> allProductsInWishlist,
      required final List<dynamic> searchedList,
      required final List<dynamic> userAddressList,
      required this.value,
      required this.status})
      : _allProductsInWishlist = allProductsInWishlist,
        _searchedList = searchedList,
        _userAddressList = userAddressList;

  @override
  final dynamic function;
  final List<dynamic> _allProductsInWishlist;
  @override
  List<dynamic> get allProductsInWishlist {
    if (_allProductsInWishlist is EqualUnmodifiableListView)
      return _allProductsInWishlist;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allProductsInWishlist);
  }

  final List<dynamic> _searchedList;
  @override
  List<dynamic> get searchedList {
    if (_searchedList is EqualUnmodifiableListView) return _searchedList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_searchedList);
  }

  final List<dynamic> _userAddressList;
  @override
  List<dynamic> get userAddressList {
    if (_userAddressList is EqualUnmodifiableListView) return _userAddressList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_userAddressList);
  }

  @override
  final dynamic value;
  @override
  final String status;

  @override
  String toString() {
    return 'WishlistState(function: $function, allProductsInWishlist: $allProductsInWishlist, searchedList: $searchedList, userAddressList: $userAddressList, value: $value, status: $status)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Initial &&
            const DeepCollectionEquality().equals(other.function, function) &&
            const DeepCollectionEquality()
                .equals(other._allProductsInWishlist, _allProductsInWishlist) &&
            const DeepCollectionEquality()
                .equals(other._searchedList, _searchedList) &&
            const DeepCollectionEquality()
                .equals(other._userAddressList, _userAddressList) &&
            const DeepCollectionEquality().equals(other.value, value) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(function),
      const DeepCollectionEquality().hash(_allProductsInWishlist),
      const DeepCollectionEquality().hash(_searchedList),
      const DeepCollectionEquality().hash(_userAddressList),
      const DeepCollectionEquality().hash(value),
      status);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      __$$_InitialCopyWithImpl<_$_Initial>(this, _$identity);
}

abstract class _Initial implements WishlistState {
  const factory _Initial(
      {required final dynamic function,
      required final List<dynamic> allProductsInWishlist,
      required final List<dynamic> searchedList,
      required final List<dynamic> userAddressList,
      required final dynamic value,
      required final String status}) = _$_Initial;

  @override
  dynamic get function;
  @override
  List<dynamic> get allProductsInWishlist;
  @override
  List<dynamic> get searchedList;
  @override
  List<dynamic> get userAddressList;
  @override
  dynamic get value;
  @override
  String get status;
  @override
  @JsonKey(ignore: true)
  _$$_InitialCopyWith<_$_Initial> get copyWith =>
      throw _privateConstructorUsedError;
}
