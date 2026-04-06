// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TicketEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadTickets,
    required TResult Function(TicketStatus? status) onFilterByStatus,
    required TResult Function(String title) onChangeTitle,
    required TResult Function(String description) onChangeDescription,
    required TResult Function(ProjectModel? project) onSelectProject,
    required TResult Function(String note) onChangeNote,
    required TResult Function() onSubmitTicket,
    required TResult Function(int ticketId) onDeleteTicket,
    required TResult Function() onResetForm,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadTickets,
    TResult? Function(TicketStatus? status)? onFilterByStatus,
    TResult? Function(String title)? onChangeTitle,
    TResult? Function(String description)? onChangeDescription,
    TResult? Function(ProjectModel? project)? onSelectProject,
    TResult? Function(String note)? onChangeNote,
    TResult? Function()? onSubmitTicket,
    TResult? Function(int ticketId)? onDeleteTicket,
    TResult? Function()? onResetForm,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadTickets,
    TResult Function(TicketStatus? status)? onFilterByStatus,
    TResult Function(String title)? onChangeTitle,
    TResult Function(String description)? onChangeDescription,
    TResult Function(ProjectModel? project)? onSelectProject,
    TResult Function(String note)? onChangeNote,
    TResult Function()? onSubmitTicket,
    TResult Function(int ticketId)? onDeleteTicket,
    TResult Function()? onResetForm,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTickets value) onLoadTickets,
    required TResult Function(OnFilterByStatus value) onFilterByStatus,
    required TResult Function(OnChangeTitle value) onChangeTitle,
    required TResult Function(OnChangeDescription value) onChangeDescription,
    required TResult Function(OnSelectProject value) onSelectProject,
    required TResult Function(OnChangeNote value) onChangeNote,
    required TResult Function(OnSubmitTicket value) onSubmitTicket,
    required TResult Function(OnDeleteTicket value) onDeleteTicket,
    required TResult Function(OnResetForm value) onResetForm,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTickets value)? onLoadTickets,
    TResult? Function(OnFilterByStatus value)? onFilterByStatus,
    TResult? Function(OnChangeTitle value)? onChangeTitle,
    TResult? Function(OnChangeDescription value)? onChangeDescription,
    TResult? Function(OnSelectProject value)? onSelectProject,
    TResult? Function(OnChangeNote value)? onChangeNote,
    TResult? Function(OnSubmitTicket value)? onSubmitTicket,
    TResult? Function(OnDeleteTicket value)? onDeleteTicket,
    TResult? Function(OnResetForm value)? onResetForm,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTickets value)? onLoadTickets,
    TResult Function(OnFilterByStatus value)? onFilterByStatus,
    TResult Function(OnChangeTitle value)? onChangeTitle,
    TResult Function(OnChangeDescription value)? onChangeDescription,
    TResult Function(OnSelectProject value)? onSelectProject,
    TResult Function(OnChangeNote value)? onChangeNote,
    TResult Function(OnSubmitTicket value)? onSubmitTicket,
    TResult Function(OnDeleteTicket value)? onDeleteTicket,
    TResult Function(OnResetForm value)? onResetForm,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketEventCopyWith<$Res> {
  factory $TicketEventCopyWith(
    TicketEvent value,
    $Res Function(TicketEvent) then,
  ) = _$TicketEventCopyWithImpl<$Res, TicketEvent>;
}

/// @nodoc
class _$TicketEventCopyWithImpl<$Res, $Val extends TicketEvent>
    implements $TicketEventCopyWith<$Res> {
  _$TicketEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OnLoadTicketsImplCopyWith<$Res> {
  factory _$$OnLoadTicketsImplCopyWith(
    _$OnLoadTicketsImpl value,
    $Res Function(_$OnLoadTicketsImpl) then,
  ) = __$$OnLoadTicketsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnLoadTicketsImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$OnLoadTicketsImpl>
    implements _$$OnLoadTicketsImplCopyWith<$Res> {
  __$$OnLoadTicketsImplCopyWithImpl(
    _$OnLoadTicketsImpl _value,
    $Res Function(_$OnLoadTicketsImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnLoadTicketsImpl implements OnLoadTickets {
  const _$OnLoadTicketsImpl();

  @override
  String toString() {
    return 'TicketEvent.onLoadTickets()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnLoadTicketsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadTickets,
    required TResult Function(TicketStatus? status) onFilterByStatus,
    required TResult Function(String title) onChangeTitle,
    required TResult Function(String description) onChangeDescription,
    required TResult Function(ProjectModel? project) onSelectProject,
    required TResult Function(String note) onChangeNote,
    required TResult Function() onSubmitTicket,
    required TResult Function(int ticketId) onDeleteTicket,
    required TResult Function() onResetForm,
  }) {
    return onLoadTickets();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadTickets,
    TResult? Function(TicketStatus? status)? onFilterByStatus,
    TResult? Function(String title)? onChangeTitle,
    TResult? Function(String description)? onChangeDescription,
    TResult? Function(ProjectModel? project)? onSelectProject,
    TResult? Function(String note)? onChangeNote,
    TResult? Function()? onSubmitTicket,
    TResult? Function(int ticketId)? onDeleteTicket,
    TResult? Function()? onResetForm,
  }) {
    return onLoadTickets?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadTickets,
    TResult Function(TicketStatus? status)? onFilterByStatus,
    TResult Function(String title)? onChangeTitle,
    TResult Function(String description)? onChangeDescription,
    TResult Function(ProjectModel? project)? onSelectProject,
    TResult Function(String note)? onChangeNote,
    TResult Function()? onSubmitTicket,
    TResult Function(int ticketId)? onDeleteTicket,
    TResult Function()? onResetForm,
    required TResult orElse(),
  }) {
    if (onLoadTickets != null) {
      return onLoadTickets();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTickets value) onLoadTickets,
    required TResult Function(OnFilterByStatus value) onFilterByStatus,
    required TResult Function(OnChangeTitle value) onChangeTitle,
    required TResult Function(OnChangeDescription value) onChangeDescription,
    required TResult Function(OnSelectProject value) onSelectProject,
    required TResult Function(OnChangeNote value) onChangeNote,
    required TResult Function(OnSubmitTicket value) onSubmitTicket,
    required TResult Function(OnDeleteTicket value) onDeleteTicket,
    required TResult Function(OnResetForm value) onResetForm,
  }) {
    return onLoadTickets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTickets value)? onLoadTickets,
    TResult? Function(OnFilterByStatus value)? onFilterByStatus,
    TResult? Function(OnChangeTitle value)? onChangeTitle,
    TResult? Function(OnChangeDescription value)? onChangeDescription,
    TResult? Function(OnSelectProject value)? onSelectProject,
    TResult? Function(OnChangeNote value)? onChangeNote,
    TResult? Function(OnSubmitTicket value)? onSubmitTicket,
    TResult? Function(OnDeleteTicket value)? onDeleteTicket,
    TResult? Function(OnResetForm value)? onResetForm,
  }) {
    return onLoadTickets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTickets value)? onLoadTickets,
    TResult Function(OnFilterByStatus value)? onFilterByStatus,
    TResult Function(OnChangeTitle value)? onChangeTitle,
    TResult Function(OnChangeDescription value)? onChangeDescription,
    TResult Function(OnSelectProject value)? onSelectProject,
    TResult Function(OnChangeNote value)? onChangeNote,
    TResult Function(OnSubmitTicket value)? onSubmitTicket,
    TResult Function(OnDeleteTicket value)? onDeleteTicket,
    TResult Function(OnResetForm value)? onResetForm,
    required TResult orElse(),
  }) {
    if (onLoadTickets != null) {
      return onLoadTickets(this);
    }
    return orElse();
  }
}

abstract class OnLoadTickets implements TicketEvent {
  const factory OnLoadTickets() = _$OnLoadTicketsImpl;
}

/// @nodoc
abstract class _$$OnFilterByStatusImplCopyWith<$Res> {
  factory _$$OnFilterByStatusImplCopyWith(
    _$OnFilterByStatusImpl value,
    $Res Function(_$OnFilterByStatusImpl) then,
  ) = __$$OnFilterByStatusImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TicketStatus? status});
}

/// @nodoc
class __$$OnFilterByStatusImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$OnFilterByStatusImpl>
    implements _$$OnFilterByStatusImplCopyWith<$Res> {
  __$$OnFilterByStatusImplCopyWithImpl(
    _$OnFilterByStatusImpl _value,
    $Res Function(_$OnFilterByStatusImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? status = freezed}) {
    return _then(
      _$OnFilterByStatusImpl(
        status: freezed == status
            ? _value.status
            : status // ignore: cast_nullable_to_non_nullable
                  as TicketStatus?,
      ),
    );
  }
}

/// @nodoc

class _$OnFilterByStatusImpl implements OnFilterByStatus {
  const _$OnFilterByStatusImpl({required this.status});

  @override
  final TicketStatus? status;

  @override
  String toString() {
    return 'TicketEvent.onFilterByStatus(status: $status)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnFilterByStatusImpl &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnFilterByStatusImplCopyWith<_$OnFilterByStatusImpl> get copyWith =>
      __$$OnFilterByStatusImplCopyWithImpl<_$OnFilterByStatusImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadTickets,
    required TResult Function(TicketStatus? status) onFilterByStatus,
    required TResult Function(String title) onChangeTitle,
    required TResult Function(String description) onChangeDescription,
    required TResult Function(ProjectModel? project) onSelectProject,
    required TResult Function(String note) onChangeNote,
    required TResult Function() onSubmitTicket,
    required TResult Function(int ticketId) onDeleteTicket,
    required TResult Function() onResetForm,
  }) {
    return onFilterByStatus(status);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadTickets,
    TResult? Function(TicketStatus? status)? onFilterByStatus,
    TResult? Function(String title)? onChangeTitle,
    TResult? Function(String description)? onChangeDescription,
    TResult? Function(ProjectModel? project)? onSelectProject,
    TResult? Function(String note)? onChangeNote,
    TResult? Function()? onSubmitTicket,
    TResult? Function(int ticketId)? onDeleteTicket,
    TResult? Function()? onResetForm,
  }) {
    return onFilterByStatus?.call(status);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadTickets,
    TResult Function(TicketStatus? status)? onFilterByStatus,
    TResult Function(String title)? onChangeTitle,
    TResult Function(String description)? onChangeDescription,
    TResult Function(ProjectModel? project)? onSelectProject,
    TResult Function(String note)? onChangeNote,
    TResult Function()? onSubmitTicket,
    TResult Function(int ticketId)? onDeleteTicket,
    TResult Function()? onResetForm,
    required TResult orElse(),
  }) {
    if (onFilterByStatus != null) {
      return onFilterByStatus(status);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTickets value) onLoadTickets,
    required TResult Function(OnFilterByStatus value) onFilterByStatus,
    required TResult Function(OnChangeTitle value) onChangeTitle,
    required TResult Function(OnChangeDescription value) onChangeDescription,
    required TResult Function(OnSelectProject value) onSelectProject,
    required TResult Function(OnChangeNote value) onChangeNote,
    required TResult Function(OnSubmitTicket value) onSubmitTicket,
    required TResult Function(OnDeleteTicket value) onDeleteTicket,
    required TResult Function(OnResetForm value) onResetForm,
  }) {
    return onFilterByStatus(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTickets value)? onLoadTickets,
    TResult? Function(OnFilterByStatus value)? onFilterByStatus,
    TResult? Function(OnChangeTitle value)? onChangeTitle,
    TResult? Function(OnChangeDescription value)? onChangeDescription,
    TResult? Function(OnSelectProject value)? onSelectProject,
    TResult? Function(OnChangeNote value)? onChangeNote,
    TResult? Function(OnSubmitTicket value)? onSubmitTicket,
    TResult? Function(OnDeleteTicket value)? onDeleteTicket,
    TResult? Function(OnResetForm value)? onResetForm,
  }) {
    return onFilterByStatus?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTickets value)? onLoadTickets,
    TResult Function(OnFilterByStatus value)? onFilterByStatus,
    TResult Function(OnChangeTitle value)? onChangeTitle,
    TResult Function(OnChangeDescription value)? onChangeDescription,
    TResult Function(OnSelectProject value)? onSelectProject,
    TResult Function(OnChangeNote value)? onChangeNote,
    TResult Function(OnSubmitTicket value)? onSubmitTicket,
    TResult Function(OnDeleteTicket value)? onDeleteTicket,
    TResult Function(OnResetForm value)? onResetForm,
    required TResult orElse(),
  }) {
    if (onFilterByStatus != null) {
      return onFilterByStatus(this);
    }
    return orElse();
  }
}

abstract class OnFilterByStatus implements TicketEvent {
  const factory OnFilterByStatus({required final TicketStatus? status}) =
      _$OnFilterByStatusImpl;

  TicketStatus? get status;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnFilterByStatusImplCopyWith<_$OnFilterByStatusImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnChangeTitleImplCopyWith<$Res> {
  factory _$$OnChangeTitleImplCopyWith(
    _$OnChangeTitleImpl value,
    $Res Function(_$OnChangeTitleImpl) then,
  ) = __$$OnChangeTitleImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String title});
}

/// @nodoc
class __$$OnChangeTitleImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$OnChangeTitleImpl>
    implements _$$OnChangeTitleImplCopyWith<$Res> {
  __$$OnChangeTitleImplCopyWithImpl(
    _$OnChangeTitleImpl _value,
    $Res Function(_$OnChangeTitleImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? title = null}) {
    return _then(
      _$OnChangeTitleImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$OnChangeTitleImpl implements OnChangeTitle {
  const _$OnChangeTitleImpl({required this.title});

  @override
  final String title;

  @override
  String toString() {
    return 'TicketEvent.onChangeTitle(title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangeTitleImpl &&
            (identical(other.title, title) || other.title == title));
  }

  @override
  int get hashCode => Object.hash(runtimeType, title);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangeTitleImplCopyWith<_$OnChangeTitleImpl> get copyWith =>
      __$$OnChangeTitleImplCopyWithImpl<_$OnChangeTitleImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadTickets,
    required TResult Function(TicketStatus? status) onFilterByStatus,
    required TResult Function(String title) onChangeTitle,
    required TResult Function(String description) onChangeDescription,
    required TResult Function(ProjectModel? project) onSelectProject,
    required TResult Function(String note) onChangeNote,
    required TResult Function() onSubmitTicket,
    required TResult Function(int ticketId) onDeleteTicket,
    required TResult Function() onResetForm,
  }) {
    return onChangeTitle(title);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadTickets,
    TResult? Function(TicketStatus? status)? onFilterByStatus,
    TResult? Function(String title)? onChangeTitle,
    TResult? Function(String description)? onChangeDescription,
    TResult? Function(ProjectModel? project)? onSelectProject,
    TResult? Function(String note)? onChangeNote,
    TResult? Function()? onSubmitTicket,
    TResult? Function(int ticketId)? onDeleteTicket,
    TResult? Function()? onResetForm,
  }) {
    return onChangeTitle?.call(title);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadTickets,
    TResult Function(TicketStatus? status)? onFilterByStatus,
    TResult Function(String title)? onChangeTitle,
    TResult Function(String description)? onChangeDescription,
    TResult Function(ProjectModel? project)? onSelectProject,
    TResult Function(String note)? onChangeNote,
    TResult Function()? onSubmitTicket,
    TResult Function(int ticketId)? onDeleteTicket,
    TResult Function()? onResetForm,
    required TResult orElse(),
  }) {
    if (onChangeTitle != null) {
      return onChangeTitle(title);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTickets value) onLoadTickets,
    required TResult Function(OnFilterByStatus value) onFilterByStatus,
    required TResult Function(OnChangeTitle value) onChangeTitle,
    required TResult Function(OnChangeDescription value) onChangeDescription,
    required TResult Function(OnSelectProject value) onSelectProject,
    required TResult Function(OnChangeNote value) onChangeNote,
    required TResult Function(OnSubmitTicket value) onSubmitTicket,
    required TResult Function(OnDeleteTicket value) onDeleteTicket,
    required TResult Function(OnResetForm value) onResetForm,
  }) {
    return onChangeTitle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTickets value)? onLoadTickets,
    TResult? Function(OnFilterByStatus value)? onFilterByStatus,
    TResult? Function(OnChangeTitle value)? onChangeTitle,
    TResult? Function(OnChangeDescription value)? onChangeDescription,
    TResult? Function(OnSelectProject value)? onSelectProject,
    TResult? Function(OnChangeNote value)? onChangeNote,
    TResult? Function(OnSubmitTicket value)? onSubmitTicket,
    TResult? Function(OnDeleteTicket value)? onDeleteTicket,
    TResult? Function(OnResetForm value)? onResetForm,
  }) {
    return onChangeTitle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTickets value)? onLoadTickets,
    TResult Function(OnFilterByStatus value)? onFilterByStatus,
    TResult Function(OnChangeTitle value)? onChangeTitle,
    TResult Function(OnChangeDescription value)? onChangeDescription,
    TResult Function(OnSelectProject value)? onSelectProject,
    TResult Function(OnChangeNote value)? onChangeNote,
    TResult Function(OnSubmitTicket value)? onSubmitTicket,
    TResult Function(OnDeleteTicket value)? onDeleteTicket,
    TResult Function(OnResetForm value)? onResetForm,
    required TResult orElse(),
  }) {
    if (onChangeTitle != null) {
      return onChangeTitle(this);
    }
    return orElse();
  }
}

abstract class OnChangeTitle implements TicketEvent {
  const factory OnChangeTitle({required final String title}) =
      _$OnChangeTitleImpl;

  String get title;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnChangeTitleImplCopyWith<_$OnChangeTitleImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnChangeDescriptionImplCopyWith<$Res> {
  factory _$$OnChangeDescriptionImplCopyWith(
    _$OnChangeDescriptionImpl value,
    $Res Function(_$OnChangeDescriptionImpl) then,
  ) = __$$OnChangeDescriptionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String description});
}

/// @nodoc
class __$$OnChangeDescriptionImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$OnChangeDescriptionImpl>
    implements _$$OnChangeDescriptionImplCopyWith<$Res> {
  __$$OnChangeDescriptionImplCopyWithImpl(
    _$OnChangeDescriptionImpl _value,
    $Res Function(_$OnChangeDescriptionImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? description = null}) {
    return _then(
      _$OnChangeDescriptionImpl(
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$OnChangeDescriptionImpl implements OnChangeDescription {
  const _$OnChangeDescriptionImpl({required this.description});

  @override
  final String description;

  @override
  String toString() {
    return 'TicketEvent.onChangeDescription(description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangeDescriptionImpl &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, description);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangeDescriptionImplCopyWith<_$OnChangeDescriptionImpl> get copyWith =>
      __$$OnChangeDescriptionImplCopyWithImpl<_$OnChangeDescriptionImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadTickets,
    required TResult Function(TicketStatus? status) onFilterByStatus,
    required TResult Function(String title) onChangeTitle,
    required TResult Function(String description) onChangeDescription,
    required TResult Function(ProjectModel? project) onSelectProject,
    required TResult Function(String note) onChangeNote,
    required TResult Function() onSubmitTicket,
    required TResult Function(int ticketId) onDeleteTicket,
    required TResult Function() onResetForm,
  }) {
    return onChangeDescription(description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadTickets,
    TResult? Function(TicketStatus? status)? onFilterByStatus,
    TResult? Function(String title)? onChangeTitle,
    TResult? Function(String description)? onChangeDescription,
    TResult? Function(ProjectModel? project)? onSelectProject,
    TResult? Function(String note)? onChangeNote,
    TResult? Function()? onSubmitTicket,
    TResult? Function(int ticketId)? onDeleteTicket,
    TResult? Function()? onResetForm,
  }) {
    return onChangeDescription?.call(description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadTickets,
    TResult Function(TicketStatus? status)? onFilterByStatus,
    TResult Function(String title)? onChangeTitle,
    TResult Function(String description)? onChangeDescription,
    TResult Function(ProjectModel? project)? onSelectProject,
    TResult Function(String note)? onChangeNote,
    TResult Function()? onSubmitTicket,
    TResult Function(int ticketId)? onDeleteTicket,
    TResult Function()? onResetForm,
    required TResult orElse(),
  }) {
    if (onChangeDescription != null) {
      return onChangeDescription(description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTickets value) onLoadTickets,
    required TResult Function(OnFilterByStatus value) onFilterByStatus,
    required TResult Function(OnChangeTitle value) onChangeTitle,
    required TResult Function(OnChangeDescription value) onChangeDescription,
    required TResult Function(OnSelectProject value) onSelectProject,
    required TResult Function(OnChangeNote value) onChangeNote,
    required TResult Function(OnSubmitTicket value) onSubmitTicket,
    required TResult Function(OnDeleteTicket value) onDeleteTicket,
    required TResult Function(OnResetForm value) onResetForm,
  }) {
    return onChangeDescription(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTickets value)? onLoadTickets,
    TResult? Function(OnFilterByStatus value)? onFilterByStatus,
    TResult? Function(OnChangeTitle value)? onChangeTitle,
    TResult? Function(OnChangeDescription value)? onChangeDescription,
    TResult? Function(OnSelectProject value)? onSelectProject,
    TResult? Function(OnChangeNote value)? onChangeNote,
    TResult? Function(OnSubmitTicket value)? onSubmitTicket,
    TResult? Function(OnDeleteTicket value)? onDeleteTicket,
    TResult? Function(OnResetForm value)? onResetForm,
  }) {
    return onChangeDescription?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTickets value)? onLoadTickets,
    TResult Function(OnFilterByStatus value)? onFilterByStatus,
    TResult Function(OnChangeTitle value)? onChangeTitle,
    TResult Function(OnChangeDescription value)? onChangeDescription,
    TResult Function(OnSelectProject value)? onSelectProject,
    TResult Function(OnChangeNote value)? onChangeNote,
    TResult Function(OnSubmitTicket value)? onSubmitTicket,
    TResult Function(OnDeleteTicket value)? onDeleteTicket,
    TResult Function(OnResetForm value)? onResetForm,
    required TResult orElse(),
  }) {
    if (onChangeDescription != null) {
      return onChangeDescription(this);
    }
    return orElse();
  }
}

abstract class OnChangeDescription implements TicketEvent {
  const factory OnChangeDescription({required final String description}) =
      _$OnChangeDescriptionImpl;

  String get description;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnChangeDescriptionImplCopyWith<_$OnChangeDescriptionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSelectProjectImplCopyWith<$Res> {
  factory _$$OnSelectProjectImplCopyWith(
    _$OnSelectProjectImpl value,
    $Res Function(_$OnSelectProjectImpl) then,
  ) = __$$OnSelectProjectImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ProjectModel? project});
}

/// @nodoc
class __$$OnSelectProjectImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$OnSelectProjectImpl>
    implements _$$OnSelectProjectImplCopyWith<$Res> {
  __$$OnSelectProjectImplCopyWithImpl(
    _$OnSelectProjectImpl _value,
    $Res Function(_$OnSelectProjectImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? project = freezed}) {
    return _then(
      _$OnSelectProjectImpl(
        project: freezed == project
            ? _value.project
            : project // ignore: cast_nullable_to_non_nullable
                  as ProjectModel?,
      ),
    );
  }
}

/// @nodoc

class _$OnSelectProjectImpl implements OnSelectProject {
  const _$OnSelectProjectImpl({required this.project});

  @override
  final ProjectModel? project;

  @override
  String toString() {
    return 'TicketEvent.onSelectProject(project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSelectProjectImpl &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode => Object.hash(runtimeType, project);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSelectProjectImplCopyWith<_$OnSelectProjectImpl> get copyWith =>
      __$$OnSelectProjectImplCopyWithImpl<_$OnSelectProjectImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadTickets,
    required TResult Function(TicketStatus? status) onFilterByStatus,
    required TResult Function(String title) onChangeTitle,
    required TResult Function(String description) onChangeDescription,
    required TResult Function(ProjectModel? project) onSelectProject,
    required TResult Function(String note) onChangeNote,
    required TResult Function() onSubmitTicket,
    required TResult Function(int ticketId) onDeleteTicket,
    required TResult Function() onResetForm,
  }) {
    return onSelectProject(project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadTickets,
    TResult? Function(TicketStatus? status)? onFilterByStatus,
    TResult? Function(String title)? onChangeTitle,
    TResult? Function(String description)? onChangeDescription,
    TResult? Function(ProjectModel? project)? onSelectProject,
    TResult? Function(String note)? onChangeNote,
    TResult? Function()? onSubmitTicket,
    TResult? Function(int ticketId)? onDeleteTicket,
    TResult? Function()? onResetForm,
  }) {
    return onSelectProject?.call(project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadTickets,
    TResult Function(TicketStatus? status)? onFilterByStatus,
    TResult Function(String title)? onChangeTitle,
    TResult Function(String description)? onChangeDescription,
    TResult Function(ProjectModel? project)? onSelectProject,
    TResult Function(String note)? onChangeNote,
    TResult Function()? onSubmitTicket,
    TResult Function(int ticketId)? onDeleteTicket,
    TResult Function()? onResetForm,
    required TResult orElse(),
  }) {
    if (onSelectProject != null) {
      return onSelectProject(project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTickets value) onLoadTickets,
    required TResult Function(OnFilterByStatus value) onFilterByStatus,
    required TResult Function(OnChangeTitle value) onChangeTitle,
    required TResult Function(OnChangeDescription value) onChangeDescription,
    required TResult Function(OnSelectProject value) onSelectProject,
    required TResult Function(OnChangeNote value) onChangeNote,
    required TResult Function(OnSubmitTicket value) onSubmitTicket,
    required TResult Function(OnDeleteTicket value) onDeleteTicket,
    required TResult Function(OnResetForm value) onResetForm,
  }) {
    return onSelectProject(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTickets value)? onLoadTickets,
    TResult? Function(OnFilterByStatus value)? onFilterByStatus,
    TResult? Function(OnChangeTitle value)? onChangeTitle,
    TResult? Function(OnChangeDescription value)? onChangeDescription,
    TResult? Function(OnSelectProject value)? onSelectProject,
    TResult? Function(OnChangeNote value)? onChangeNote,
    TResult? Function(OnSubmitTicket value)? onSubmitTicket,
    TResult? Function(OnDeleteTicket value)? onDeleteTicket,
    TResult? Function(OnResetForm value)? onResetForm,
  }) {
    return onSelectProject?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTickets value)? onLoadTickets,
    TResult Function(OnFilterByStatus value)? onFilterByStatus,
    TResult Function(OnChangeTitle value)? onChangeTitle,
    TResult Function(OnChangeDescription value)? onChangeDescription,
    TResult Function(OnSelectProject value)? onSelectProject,
    TResult Function(OnChangeNote value)? onChangeNote,
    TResult Function(OnSubmitTicket value)? onSubmitTicket,
    TResult Function(OnDeleteTicket value)? onDeleteTicket,
    TResult Function(OnResetForm value)? onResetForm,
    required TResult orElse(),
  }) {
    if (onSelectProject != null) {
      return onSelectProject(this);
    }
    return orElse();
  }
}

abstract class OnSelectProject implements TicketEvent {
  const factory OnSelectProject({required final ProjectModel? project}) =
      _$OnSelectProjectImpl;

  ProjectModel? get project;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnSelectProjectImplCopyWith<_$OnSelectProjectImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnChangeNoteImplCopyWith<$Res> {
  factory _$$OnChangeNoteImplCopyWith(
    _$OnChangeNoteImpl value,
    $Res Function(_$OnChangeNoteImpl) then,
  ) = __$$OnChangeNoteImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String note});
}

/// @nodoc
class __$$OnChangeNoteImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$OnChangeNoteImpl>
    implements _$$OnChangeNoteImplCopyWith<$Res> {
  __$$OnChangeNoteImplCopyWithImpl(
    _$OnChangeNoteImpl _value,
    $Res Function(_$OnChangeNoteImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? note = null}) {
    return _then(
      _$OnChangeNoteImpl(
        note: null == note
            ? _value.note
            : note // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$OnChangeNoteImpl implements OnChangeNote {
  const _$OnChangeNoteImpl({required this.note});

  @override
  final String note;

  @override
  String toString() {
    return 'TicketEvent.onChangeNote(note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnChangeNoteImpl &&
            (identical(other.note, note) || other.note == note));
  }

  @override
  int get hashCode => Object.hash(runtimeType, note);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnChangeNoteImplCopyWith<_$OnChangeNoteImpl> get copyWith =>
      __$$OnChangeNoteImplCopyWithImpl<_$OnChangeNoteImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadTickets,
    required TResult Function(TicketStatus? status) onFilterByStatus,
    required TResult Function(String title) onChangeTitle,
    required TResult Function(String description) onChangeDescription,
    required TResult Function(ProjectModel? project) onSelectProject,
    required TResult Function(String note) onChangeNote,
    required TResult Function() onSubmitTicket,
    required TResult Function(int ticketId) onDeleteTicket,
    required TResult Function() onResetForm,
  }) {
    return onChangeNote(note);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadTickets,
    TResult? Function(TicketStatus? status)? onFilterByStatus,
    TResult? Function(String title)? onChangeTitle,
    TResult? Function(String description)? onChangeDescription,
    TResult? Function(ProjectModel? project)? onSelectProject,
    TResult? Function(String note)? onChangeNote,
    TResult? Function()? onSubmitTicket,
    TResult? Function(int ticketId)? onDeleteTicket,
    TResult? Function()? onResetForm,
  }) {
    return onChangeNote?.call(note);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadTickets,
    TResult Function(TicketStatus? status)? onFilterByStatus,
    TResult Function(String title)? onChangeTitle,
    TResult Function(String description)? onChangeDescription,
    TResult Function(ProjectModel? project)? onSelectProject,
    TResult Function(String note)? onChangeNote,
    TResult Function()? onSubmitTicket,
    TResult Function(int ticketId)? onDeleteTicket,
    TResult Function()? onResetForm,
    required TResult orElse(),
  }) {
    if (onChangeNote != null) {
      return onChangeNote(note);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTickets value) onLoadTickets,
    required TResult Function(OnFilterByStatus value) onFilterByStatus,
    required TResult Function(OnChangeTitle value) onChangeTitle,
    required TResult Function(OnChangeDescription value) onChangeDescription,
    required TResult Function(OnSelectProject value) onSelectProject,
    required TResult Function(OnChangeNote value) onChangeNote,
    required TResult Function(OnSubmitTicket value) onSubmitTicket,
    required TResult Function(OnDeleteTicket value) onDeleteTicket,
    required TResult Function(OnResetForm value) onResetForm,
  }) {
    return onChangeNote(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTickets value)? onLoadTickets,
    TResult? Function(OnFilterByStatus value)? onFilterByStatus,
    TResult? Function(OnChangeTitle value)? onChangeTitle,
    TResult? Function(OnChangeDescription value)? onChangeDescription,
    TResult? Function(OnSelectProject value)? onSelectProject,
    TResult? Function(OnChangeNote value)? onChangeNote,
    TResult? Function(OnSubmitTicket value)? onSubmitTicket,
    TResult? Function(OnDeleteTicket value)? onDeleteTicket,
    TResult? Function(OnResetForm value)? onResetForm,
  }) {
    return onChangeNote?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTickets value)? onLoadTickets,
    TResult Function(OnFilterByStatus value)? onFilterByStatus,
    TResult Function(OnChangeTitle value)? onChangeTitle,
    TResult Function(OnChangeDescription value)? onChangeDescription,
    TResult Function(OnSelectProject value)? onSelectProject,
    TResult Function(OnChangeNote value)? onChangeNote,
    TResult Function(OnSubmitTicket value)? onSubmitTicket,
    TResult Function(OnDeleteTicket value)? onDeleteTicket,
    TResult Function(OnResetForm value)? onResetForm,
    required TResult orElse(),
  }) {
    if (onChangeNote != null) {
      return onChangeNote(this);
    }
    return orElse();
  }
}

abstract class OnChangeNote implements TicketEvent {
  const factory OnChangeNote({required final String note}) = _$OnChangeNoteImpl;

  String get note;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnChangeNoteImplCopyWith<_$OnChangeNoteImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSubmitTicketImplCopyWith<$Res> {
  factory _$$OnSubmitTicketImplCopyWith(
    _$OnSubmitTicketImpl value,
    $Res Function(_$OnSubmitTicketImpl) then,
  ) = __$$OnSubmitTicketImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnSubmitTicketImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$OnSubmitTicketImpl>
    implements _$$OnSubmitTicketImplCopyWith<$Res> {
  __$$OnSubmitTicketImplCopyWithImpl(
    _$OnSubmitTicketImpl _value,
    $Res Function(_$OnSubmitTicketImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnSubmitTicketImpl implements OnSubmitTicket {
  const _$OnSubmitTicketImpl();

  @override
  String toString() {
    return 'TicketEvent.onSubmitTicket()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnSubmitTicketImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadTickets,
    required TResult Function(TicketStatus? status) onFilterByStatus,
    required TResult Function(String title) onChangeTitle,
    required TResult Function(String description) onChangeDescription,
    required TResult Function(ProjectModel? project) onSelectProject,
    required TResult Function(String note) onChangeNote,
    required TResult Function() onSubmitTicket,
    required TResult Function(int ticketId) onDeleteTicket,
    required TResult Function() onResetForm,
  }) {
    return onSubmitTicket();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadTickets,
    TResult? Function(TicketStatus? status)? onFilterByStatus,
    TResult? Function(String title)? onChangeTitle,
    TResult? Function(String description)? onChangeDescription,
    TResult? Function(ProjectModel? project)? onSelectProject,
    TResult? Function(String note)? onChangeNote,
    TResult? Function()? onSubmitTicket,
    TResult? Function(int ticketId)? onDeleteTicket,
    TResult? Function()? onResetForm,
  }) {
    return onSubmitTicket?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadTickets,
    TResult Function(TicketStatus? status)? onFilterByStatus,
    TResult Function(String title)? onChangeTitle,
    TResult Function(String description)? onChangeDescription,
    TResult Function(ProjectModel? project)? onSelectProject,
    TResult Function(String note)? onChangeNote,
    TResult Function()? onSubmitTicket,
    TResult Function(int ticketId)? onDeleteTicket,
    TResult Function()? onResetForm,
    required TResult orElse(),
  }) {
    if (onSubmitTicket != null) {
      return onSubmitTicket();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTickets value) onLoadTickets,
    required TResult Function(OnFilterByStatus value) onFilterByStatus,
    required TResult Function(OnChangeTitle value) onChangeTitle,
    required TResult Function(OnChangeDescription value) onChangeDescription,
    required TResult Function(OnSelectProject value) onSelectProject,
    required TResult Function(OnChangeNote value) onChangeNote,
    required TResult Function(OnSubmitTicket value) onSubmitTicket,
    required TResult Function(OnDeleteTicket value) onDeleteTicket,
    required TResult Function(OnResetForm value) onResetForm,
  }) {
    return onSubmitTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTickets value)? onLoadTickets,
    TResult? Function(OnFilterByStatus value)? onFilterByStatus,
    TResult? Function(OnChangeTitle value)? onChangeTitle,
    TResult? Function(OnChangeDescription value)? onChangeDescription,
    TResult? Function(OnSelectProject value)? onSelectProject,
    TResult? Function(OnChangeNote value)? onChangeNote,
    TResult? Function(OnSubmitTicket value)? onSubmitTicket,
    TResult? Function(OnDeleteTicket value)? onDeleteTicket,
    TResult? Function(OnResetForm value)? onResetForm,
  }) {
    return onSubmitTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTickets value)? onLoadTickets,
    TResult Function(OnFilterByStatus value)? onFilterByStatus,
    TResult Function(OnChangeTitle value)? onChangeTitle,
    TResult Function(OnChangeDescription value)? onChangeDescription,
    TResult Function(OnSelectProject value)? onSelectProject,
    TResult Function(OnChangeNote value)? onChangeNote,
    TResult Function(OnSubmitTicket value)? onSubmitTicket,
    TResult Function(OnDeleteTicket value)? onDeleteTicket,
    TResult Function(OnResetForm value)? onResetForm,
    required TResult orElse(),
  }) {
    if (onSubmitTicket != null) {
      return onSubmitTicket(this);
    }
    return orElse();
  }
}

abstract class OnSubmitTicket implements TicketEvent {
  const factory OnSubmitTicket() = _$OnSubmitTicketImpl;
}

/// @nodoc
abstract class _$$OnDeleteTicketImplCopyWith<$Res> {
  factory _$$OnDeleteTicketImplCopyWith(
    _$OnDeleteTicketImpl value,
    $Res Function(_$OnDeleteTicketImpl) then,
  ) = __$$OnDeleteTicketImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int ticketId});
}

/// @nodoc
class __$$OnDeleteTicketImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$OnDeleteTicketImpl>
    implements _$$OnDeleteTicketImplCopyWith<$Res> {
  __$$OnDeleteTicketImplCopyWithImpl(
    _$OnDeleteTicketImpl _value,
    $Res Function(_$OnDeleteTicketImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ticketId = null}) {
    return _then(
      _$OnDeleteTicketImpl(
        ticketId: null == ticketId
            ? _value.ticketId
            : ticketId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$OnDeleteTicketImpl implements OnDeleteTicket {
  const _$OnDeleteTicketImpl({required this.ticketId});

  @override
  final int ticketId;

  @override
  String toString() {
    return 'TicketEvent.onDeleteTicket(ticketId: $ticketId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDeleteTicketImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticketId);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnDeleteTicketImplCopyWith<_$OnDeleteTicketImpl> get copyWith =>
      __$$OnDeleteTicketImplCopyWithImpl<_$OnDeleteTicketImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadTickets,
    required TResult Function(TicketStatus? status) onFilterByStatus,
    required TResult Function(String title) onChangeTitle,
    required TResult Function(String description) onChangeDescription,
    required TResult Function(ProjectModel? project) onSelectProject,
    required TResult Function(String note) onChangeNote,
    required TResult Function() onSubmitTicket,
    required TResult Function(int ticketId) onDeleteTicket,
    required TResult Function() onResetForm,
  }) {
    return onDeleteTicket(ticketId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadTickets,
    TResult? Function(TicketStatus? status)? onFilterByStatus,
    TResult? Function(String title)? onChangeTitle,
    TResult? Function(String description)? onChangeDescription,
    TResult? Function(ProjectModel? project)? onSelectProject,
    TResult? Function(String note)? onChangeNote,
    TResult? Function()? onSubmitTicket,
    TResult? Function(int ticketId)? onDeleteTicket,
    TResult? Function()? onResetForm,
  }) {
    return onDeleteTicket?.call(ticketId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadTickets,
    TResult Function(TicketStatus? status)? onFilterByStatus,
    TResult Function(String title)? onChangeTitle,
    TResult Function(String description)? onChangeDescription,
    TResult Function(ProjectModel? project)? onSelectProject,
    TResult Function(String note)? onChangeNote,
    TResult Function()? onSubmitTicket,
    TResult Function(int ticketId)? onDeleteTicket,
    TResult Function()? onResetForm,
    required TResult orElse(),
  }) {
    if (onDeleteTicket != null) {
      return onDeleteTicket(ticketId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTickets value) onLoadTickets,
    required TResult Function(OnFilterByStatus value) onFilterByStatus,
    required TResult Function(OnChangeTitle value) onChangeTitle,
    required TResult Function(OnChangeDescription value) onChangeDescription,
    required TResult Function(OnSelectProject value) onSelectProject,
    required TResult Function(OnChangeNote value) onChangeNote,
    required TResult Function(OnSubmitTicket value) onSubmitTicket,
    required TResult Function(OnDeleteTicket value) onDeleteTicket,
    required TResult Function(OnResetForm value) onResetForm,
  }) {
    return onDeleteTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTickets value)? onLoadTickets,
    TResult? Function(OnFilterByStatus value)? onFilterByStatus,
    TResult? Function(OnChangeTitle value)? onChangeTitle,
    TResult? Function(OnChangeDescription value)? onChangeDescription,
    TResult? Function(OnSelectProject value)? onSelectProject,
    TResult? Function(OnChangeNote value)? onChangeNote,
    TResult? Function(OnSubmitTicket value)? onSubmitTicket,
    TResult? Function(OnDeleteTicket value)? onDeleteTicket,
    TResult? Function(OnResetForm value)? onResetForm,
  }) {
    return onDeleteTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTickets value)? onLoadTickets,
    TResult Function(OnFilterByStatus value)? onFilterByStatus,
    TResult Function(OnChangeTitle value)? onChangeTitle,
    TResult Function(OnChangeDescription value)? onChangeDescription,
    TResult Function(OnSelectProject value)? onSelectProject,
    TResult Function(OnChangeNote value)? onChangeNote,
    TResult Function(OnSubmitTicket value)? onSubmitTicket,
    TResult Function(OnDeleteTicket value)? onDeleteTicket,
    TResult Function(OnResetForm value)? onResetForm,
    required TResult orElse(),
  }) {
    if (onDeleteTicket != null) {
      return onDeleteTicket(this);
    }
    return orElse();
  }
}

abstract class OnDeleteTicket implements TicketEvent {
  const factory OnDeleteTicket({required final int ticketId}) =
      _$OnDeleteTicketImpl;

  int get ticketId;

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnDeleteTicketImplCopyWith<_$OnDeleteTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnResetFormImplCopyWith<$Res> {
  factory _$$OnResetFormImplCopyWith(
    _$OnResetFormImpl value,
    $Res Function(_$OnResetFormImpl) then,
  ) = __$$OnResetFormImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$OnResetFormImplCopyWithImpl<$Res>
    extends _$TicketEventCopyWithImpl<$Res, _$OnResetFormImpl>
    implements _$$OnResetFormImplCopyWith<$Res> {
  __$$OnResetFormImplCopyWithImpl(
    _$OnResetFormImpl _value,
    $Res Function(_$OnResetFormImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$OnResetFormImpl implements OnResetForm {
  const _$OnResetFormImpl();

  @override
  String toString() {
    return 'TicketEvent.onResetForm()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$OnResetFormImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onLoadTickets,
    required TResult Function(TicketStatus? status) onFilterByStatus,
    required TResult Function(String title) onChangeTitle,
    required TResult Function(String description) onChangeDescription,
    required TResult Function(ProjectModel? project) onSelectProject,
    required TResult Function(String note) onChangeNote,
    required TResult Function() onSubmitTicket,
    required TResult Function(int ticketId) onDeleteTicket,
    required TResult Function() onResetForm,
  }) {
    return onResetForm();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onLoadTickets,
    TResult? Function(TicketStatus? status)? onFilterByStatus,
    TResult? Function(String title)? onChangeTitle,
    TResult? Function(String description)? onChangeDescription,
    TResult? Function(ProjectModel? project)? onSelectProject,
    TResult? Function(String note)? onChangeNote,
    TResult? Function()? onSubmitTicket,
    TResult? Function(int ticketId)? onDeleteTicket,
    TResult? Function()? onResetForm,
  }) {
    return onResetForm?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onLoadTickets,
    TResult Function(TicketStatus? status)? onFilterByStatus,
    TResult Function(String title)? onChangeTitle,
    TResult Function(String description)? onChangeDescription,
    TResult Function(ProjectModel? project)? onSelectProject,
    TResult Function(String note)? onChangeNote,
    TResult Function()? onSubmitTicket,
    TResult Function(int ticketId)? onDeleteTicket,
    TResult Function()? onResetForm,
    required TResult orElse(),
  }) {
    if (onResetForm != null) {
      return onResetForm();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadTickets value) onLoadTickets,
    required TResult Function(OnFilterByStatus value) onFilterByStatus,
    required TResult Function(OnChangeTitle value) onChangeTitle,
    required TResult Function(OnChangeDescription value) onChangeDescription,
    required TResult Function(OnSelectProject value) onSelectProject,
    required TResult Function(OnChangeNote value) onChangeNote,
    required TResult Function(OnSubmitTicket value) onSubmitTicket,
    required TResult Function(OnDeleteTicket value) onDeleteTicket,
    required TResult Function(OnResetForm value) onResetForm,
  }) {
    return onResetForm(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadTickets value)? onLoadTickets,
    TResult? Function(OnFilterByStatus value)? onFilterByStatus,
    TResult? Function(OnChangeTitle value)? onChangeTitle,
    TResult? Function(OnChangeDescription value)? onChangeDescription,
    TResult? Function(OnSelectProject value)? onSelectProject,
    TResult? Function(OnChangeNote value)? onChangeNote,
    TResult? Function(OnSubmitTicket value)? onSubmitTicket,
    TResult? Function(OnDeleteTicket value)? onDeleteTicket,
    TResult? Function(OnResetForm value)? onResetForm,
  }) {
    return onResetForm?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadTickets value)? onLoadTickets,
    TResult Function(OnFilterByStatus value)? onFilterByStatus,
    TResult Function(OnChangeTitle value)? onChangeTitle,
    TResult Function(OnChangeDescription value)? onChangeDescription,
    TResult Function(OnSelectProject value)? onSelectProject,
    TResult Function(OnChangeNote value)? onChangeNote,
    TResult Function(OnSubmitTicket value)? onSubmitTicket,
    TResult Function(OnDeleteTicket value)? onDeleteTicket,
    TResult Function(OnResetForm value)? onResetForm,
    required TResult orElse(),
  }) {
    if (onResetForm != null) {
      return onResetForm(this);
    }
    return orElse();
  }
}

abstract class OnResetForm implements TicketEvent {
  const factory OnResetForm() = _$OnResetFormImpl;
}

/// @nodoc
mixin _$TicketState {
  CommonScreenState get loadingState => throw _privateConstructorUsedError;
  List<TicketModel> get allTickets => throw _privateConstructorUsedError;
  List<TicketModel> get filteredTickets => throw _privateConstructorUsedError;
  TicketStatus? get selectedFilter => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get openCount => throw _privateConstructorUsedError;
  int get inProgressCount => throw _privateConstructorUsedError;
  int get resolvedCount => throw _privateConstructorUsedError;
  int get closedCount => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  ProjectModel? get selectedProject => throw _privateConstructorUsedError;
  String get clientNote => throw _privateConstructorUsedError;
  List<ProjectModel> get projects => throw _privateConstructorUsedError;
  bool get isTicketCreated => throw _privateConstructorUsedError;

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketStateCopyWith<TicketState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketStateCopyWith<$Res> {
  factory $TicketStateCopyWith(
    TicketState value,
    $Res Function(TicketState) then,
  ) = _$TicketStateCopyWithImpl<$Res, TicketState>;
  @useResult
  $Res call({
    CommonScreenState loadingState,
    List<TicketModel> allTickets,
    List<TicketModel> filteredTickets,
    TicketStatus? selectedFilter,
    int totalCount,
    int openCount,
    int inProgressCount,
    int resolvedCount,
    int closedCount,
    String title,
    String description,
    ProjectModel? selectedProject,
    String clientNote,
    List<ProjectModel> projects,
    bool isTicketCreated,
  });
}

/// @nodoc
class _$TicketStateCopyWithImpl<$Res, $Val extends TicketState>
    implements $TicketStateCopyWith<$Res> {
  _$TicketStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? allTickets = null,
    Object? filteredTickets = null,
    Object? selectedFilter = freezed,
    Object? totalCount = null,
    Object? openCount = null,
    Object? inProgressCount = null,
    Object? resolvedCount = null,
    Object? closedCount = null,
    Object? title = null,
    Object? description = null,
    Object? selectedProject = freezed,
    Object? clientNote = null,
    Object? projects = null,
    Object? isTicketCreated = null,
  }) {
    return _then(
      _value.copyWith(
            loadingState: null == loadingState
                ? _value.loadingState
                : loadingState // ignore: cast_nullable_to_non_nullable
                      as CommonScreenState,
            allTickets: null == allTickets
                ? _value.allTickets
                : allTickets // ignore: cast_nullable_to_non_nullable
                      as List<TicketModel>,
            filteredTickets: null == filteredTickets
                ? _value.filteredTickets
                : filteredTickets // ignore: cast_nullable_to_non_nullable
                      as List<TicketModel>,
            selectedFilter: freezed == selectedFilter
                ? _value.selectedFilter
                : selectedFilter // ignore: cast_nullable_to_non_nullable
                      as TicketStatus?,
            totalCount: null == totalCount
                ? _value.totalCount
                : totalCount // ignore: cast_nullable_to_non_nullable
                      as int,
            openCount: null == openCount
                ? _value.openCount
                : openCount // ignore: cast_nullable_to_non_nullable
                      as int,
            inProgressCount: null == inProgressCount
                ? _value.inProgressCount
                : inProgressCount // ignore: cast_nullable_to_non_nullable
                      as int,
            resolvedCount: null == resolvedCount
                ? _value.resolvedCount
                : resolvedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            closedCount: null == closedCount
                ? _value.closedCount
                : closedCount // ignore: cast_nullable_to_non_nullable
                      as int,
            title: null == title
                ? _value.title
                : title // ignore: cast_nullable_to_non_nullable
                      as String,
            description: null == description
                ? _value.description
                : description // ignore: cast_nullable_to_non_nullable
                      as String,
            selectedProject: freezed == selectedProject
                ? _value.selectedProject
                : selectedProject // ignore: cast_nullable_to_non_nullable
                      as ProjectModel?,
            clientNote: null == clientNote
                ? _value.clientNote
                : clientNote // ignore: cast_nullable_to_non_nullable
                      as String,
            projects: null == projects
                ? _value.projects
                : projects // ignore: cast_nullable_to_non_nullable
                      as List<ProjectModel>,
            isTicketCreated: null == isTicketCreated
                ? _value.isTicketCreated
                : isTicketCreated // ignore: cast_nullable_to_non_nullable
                      as bool,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TicketStateImplCopyWith<$Res>
    implements $TicketStateCopyWith<$Res> {
  factory _$$TicketStateImplCopyWith(
    _$TicketStateImpl value,
    $Res Function(_$TicketStateImpl) then,
  ) = __$$TicketStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CommonScreenState loadingState,
    List<TicketModel> allTickets,
    List<TicketModel> filteredTickets,
    TicketStatus? selectedFilter,
    int totalCount,
    int openCount,
    int inProgressCount,
    int resolvedCount,
    int closedCount,
    String title,
    String description,
    ProjectModel? selectedProject,
    String clientNote,
    List<ProjectModel> projects,
    bool isTicketCreated,
  });
}

/// @nodoc
class __$$TicketStateImplCopyWithImpl<$Res>
    extends _$TicketStateCopyWithImpl<$Res, _$TicketStateImpl>
    implements _$$TicketStateImplCopyWith<$Res> {
  __$$TicketStateImplCopyWithImpl(
    _$TicketStateImpl _value,
    $Res Function(_$TicketStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? allTickets = null,
    Object? filteredTickets = null,
    Object? selectedFilter = freezed,
    Object? totalCount = null,
    Object? openCount = null,
    Object? inProgressCount = null,
    Object? resolvedCount = null,
    Object? closedCount = null,
    Object? title = null,
    Object? description = null,
    Object? selectedProject = freezed,
    Object? clientNote = null,
    Object? projects = null,
    Object? isTicketCreated = null,
  }) {
    return _then(
      _$TicketStateImpl(
        loadingState: null == loadingState
            ? _value.loadingState
            : loadingState // ignore: cast_nullable_to_non_nullable
                  as CommonScreenState,
        allTickets: null == allTickets
            ? _value._allTickets
            : allTickets // ignore: cast_nullable_to_non_nullable
                  as List<TicketModel>,
        filteredTickets: null == filteredTickets
            ? _value._filteredTickets
            : filteredTickets // ignore: cast_nullable_to_non_nullable
                  as List<TicketModel>,
        selectedFilter: freezed == selectedFilter
            ? _value.selectedFilter
            : selectedFilter // ignore: cast_nullable_to_non_nullable
                  as TicketStatus?,
        totalCount: null == totalCount
            ? _value.totalCount
            : totalCount // ignore: cast_nullable_to_non_nullable
                  as int,
        openCount: null == openCount
            ? _value.openCount
            : openCount // ignore: cast_nullable_to_non_nullable
                  as int,
        inProgressCount: null == inProgressCount
            ? _value.inProgressCount
            : inProgressCount // ignore: cast_nullable_to_non_nullable
                  as int,
        resolvedCount: null == resolvedCount
            ? _value.resolvedCount
            : resolvedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        closedCount: null == closedCount
            ? _value.closedCount
            : closedCount // ignore: cast_nullable_to_non_nullable
                  as int,
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        selectedProject: freezed == selectedProject
            ? _value.selectedProject
            : selectedProject // ignore: cast_nullable_to_non_nullable
                  as ProjectModel?,
        clientNote: null == clientNote
            ? _value.clientNote
            : clientNote // ignore: cast_nullable_to_non_nullable
                  as String,
        projects: null == projects
            ? _value._projects
            : projects // ignore: cast_nullable_to_non_nullable
                  as List<ProjectModel>,
        isTicketCreated: null == isTicketCreated
            ? _value.isTicketCreated
            : isTicketCreated // ignore: cast_nullable_to_non_nullable
                  as bool,
      ),
    );
  }
}

/// @nodoc

class _$TicketStateImpl implements _TicketState {
  const _$TicketStateImpl({
    required this.loadingState,
    required final List<TicketModel> allTickets,
    required final List<TicketModel> filteredTickets,
    required this.selectedFilter,
    required this.totalCount,
    required this.openCount,
    required this.inProgressCount,
    required this.resolvedCount,
    required this.closedCount,
    required this.title,
    required this.description,
    required this.selectedProject,
    required this.clientNote,
    required final List<ProjectModel> projects,
    required this.isTicketCreated,
  }) : _allTickets = allTickets,
       _filteredTickets = filteredTickets,
       _projects = projects;

  @override
  final CommonScreenState loadingState;
  final List<TicketModel> _allTickets;
  @override
  List<TicketModel> get allTickets {
    if (_allTickets is EqualUnmodifiableListView) return _allTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_allTickets);
  }

  final List<TicketModel> _filteredTickets;
  @override
  List<TicketModel> get filteredTickets {
    if (_filteredTickets is EqualUnmodifiableListView) return _filteredTickets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_filteredTickets);
  }

  @override
  final TicketStatus? selectedFilter;
  @override
  final int totalCount;
  @override
  final int openCount;
  @override
  final int inProgressCount;
  @override
  final int resolvedCount;
  @override
  final int closedCount;
  @override
  final String title;
  @override
  final String description;
  @override
  final ProjectModel? selectedProject;
  @override
  final String clientNote;
  final List<ProjectModel> _projects;
  @override
  List<ProjectModel> get projects {
    if (_projects is EqualUnmodifiableListView) return _projects;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_projects);
  }

  @override
  final bool isTicketCreated;

  @override
  String toString() {
    return 'TicketState(loadingState: $loadingState, allTickets: $allTickets, filteredTickets: $filteredTickets, selectedFilter: $selectedFilter, totalCount: $totalCount, openCount: $openCount, inProgressCount: $inProgressCount, resolvedCount: $resolvedCount, closedCount: $closedCount, title: $title, description: $description, selectedProject: $selectedProject, clientNote: $clientNote, projects: $projects, isTicketCreated: $isTicketCreated)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketStateImpl &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            const DeepCollectionEquality().equals(
              other._allTickets,
              _allTickets,
            ) &&
            const DeepCollectionEquality().equals(
              other._filteredTickets,
              _filteredTickets,
            ) &&
            (identical(other.selectedFilter, selectedFilter) ||
                other.selectedFilter == selectedFilter) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.openCount, openCount) ||
                other.openCount == openCount) &&
            (identical(other.inProgressCount, inProgressCount) ||
                other.inProgressCount == inProgressCount) &&
            (identical(other.resolvedCount, resolvedCount) ||
                other.resolvedCount == resolvedCount) &&
            (identical(other.closedCount, closedCount) ||
                other.closedCount == closedCount) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.selectedProject, selectedProject) ||
                other.selectedProject == selectedProject) &&
            (identical(other.clientNote, clientNote) ||
                other.clientNote == clientNote) &&
            const DeepCollectionEquality().equals(other._projects, _projects) &&
            (identical(other.isTicketCreated, isTicketCreated) ||
                other.isTicketCreated == isTicketCreated));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loadingState,
    const DeepCollectionEquality().hash(_allTickets),
    const DeepCollectionEquality().hash(_filteredTickets),
    selectedFilter,
    totalCount,
    openCount,
    inProgressCount,
    resolvedCount,
    closedCount,
    title,
    description,
    selectedProject,
    clientNote,
    const DeepCollectionEquality().hash(_projects),
    isTicketCreated,
  );

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      __$$TicketStateImplCopyWithImpl<_$TicketStateImpl>(this, _$identity);
}

abstract class _TicketState implements TicketState {
  const factory _TicketState({
    required final CommonScreenState loadingState,
    required final List<TicketModel> allTickets,
    required final List<TicketModel> filteredTickets,
    required final TicketStatus? selectedFilter,
    required final int totalCount,
    required final int openCount,
    required final int inProgressCount,
    required final int resolvedCount,
    required final int closedCount,
    required final String title,
    required final String description,
    required final ProjectModel? selectedProject,
    required final String clientNote,
    required final List<ProjectModel> projects,
    required final bool isTicketCreated,
  }) = _$TicketStateImpl;

  @override
  CommonScreenState get loadingState;
  @override
  List<TicketModel> get allTickets;
  @override
  List<TicketModel> get filteredTickets;
  @override
  TicketStatus? get selectedFilter;
  @override
  int get totalCount;
  @override
  int get openCount;
  @override
  int get inProgressCount;
  @override
  int get resolvedCount;
  @override
  int get closedCount;
  @override
  String get title;
  @override
  String get description;
  @override
  ProjectModel? get selectedProject;
  @override
  String get clientNote;
  @override
  List<ProjectModel> get projects;
  @override
  bool get isTicketCreated;

  /// Create a copy of TicketState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketStateImplCopyWith<_$TicketStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
