// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$TicketDetailEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticketId) onLoadDetail,
    required TResult Function(String message) onSendMessage,
    required TResult Function(int messageId) onDeleteMessage,
    required TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )
    onUpdateTicket,
    required TResult Function(int messageId) onLikeMessage,
    required TResult Function(int messageId) onDislikeMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticketId)? onLoadDetail,
    TResult? Function(String message)? onSendMessage,
    TResult? Function(int messageId)? onDeleteMessage,
    TResult? Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult? Function(int messageId)? onLikeMessage,
    TResult? Function(int messageId)? onDislikeMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticketId)? onLoadDetail,
    TResult Function(String message)? onSendMessage,
    TResult Function(int messageId)? onDeleteMessage,
    TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult Function(int messageId)? onLikeMessage,
    TResult Function(int messageId)? onDislikeMessage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadDetail value) onLoadDetail,
    required TResult Function(OnSendMessage value) onSendMessage,
    required TResult Function(OnDeleteMessage value) onDeleteMessage,
    required TResult Function(OnUpdateTicket value) onUpdateTicket,
    required TResult Function(OnLikeMessage value) onLikeMessage,
    required TResult Function(OnDislikeMessage value) onDislikeMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadDetail value)? onLoadDetail,
    TResult? Function(OnSendMessage value)? onSendMessage,
    TResult? Function(OnDeleteMessage value)? onDeleteMessage,
    TResult? Function(OnUpdateTicket value)? onUpdateTicket,
    TResult? Function(OnLikeMessage value)? onLikeMessage,
    TResult? Function(OnDislikeMessage value)? onDislikeMessage,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadDetail value)? onLoadDetail,
    TResult Function(OnSendMessage value)? onSendMessage,
    TResult Function(OnDeleteMessage value)? onDeleteMessage,
    TResult Function(OnUpdateTicket value)? onUpdateTicket,
    TResult Function(OnLikeMessage value)? onLikeMessage,
    TResult Function(OnDislikeMessage value)? onDislikeMessage,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDetailEventCopyWith<$Res> {
  factory $TicketDetailEventCopyWith(
    TicketDetailEvent value,
    $Res Function(TicketDetailEvent) then,
  ) = _$TicketDetailEventCopyWithImpl<$Res, TicketDetailEvent>;
}

/// @nodoc
class _$TicketDetailEventCopyWithImpl<$Res, $Val extends TicketDetailEvent>
    implements $TicketDetailEventCopyWith<$Res> {
  _$TicketDetailEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$OnLoadDetailImplCopyWith<$Res> {
  factory _$$OnLoadDetailImplCopyWith(
    _$OnLoadDetailImpl value,
    $Res Function(_$OnLoadDetailImpl) then,
  ) = __$$OnLoadDetailImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int ticketId});
}

/// @nodoc
class __$$OnLoadDetailImplCopyWithImpl<$Res>
    extends _$TicketDetailEventCopyWithImpl<$Res, _$OnLoadDetailImpl>
    implements _$$OnLoadDetailImplCopyWith<$Res> {
  __$$OnLoadDetailImplCopyWithImpl(
    _$OnLoadDetailImpl _value,
    $Res Function(_$OnLoadDetailImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? ticketId = null}) {
    return _then(
      _$OnLoadDetailImpl(
        ticketId: null == ticketId
            ? _value.ticketId
            : ticketId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$OnLoadDetailImpl implements OnLoadDetail {
  const _$OnLoadDetailImpl({required this.ticketId});

  @override
  final int ticketId;

  @override
  String toString() {
    return 'TicketDetailEvent.onLoadDetail(ticketId: $ticketId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLoadDetailImpl &&
            (identical(other.ticketId, ticketId) ||
                other.ticketId == ticketId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticketId);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLoadDetailImplCopyWith<_$OnLoadDetailImpl> get copyWith =>
      __$$OnLoadDetailImplCopyWithImpl<_$OnLoadDetailImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticketId) onLoadDetail,
    required TResult Function(String message) onSendMessage,
    required TResult Function(int messageId) onDeleteMessage,
    required TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )
    onUpdateTicket,
    required TResult Function(int messageId) onLikeMessage,
    required TResult Function(int messageId) onDislikeMessage,
  }) {
    return onLoadDetail(ticketId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticketId)? onLoadDetail,
    TResult? Function(String message)? onSendMessage,
    TResult? Function(int messageId)? onDeleteMessage,
    TResult? Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult? Function(int messageId)? onLikeMessage,
    TResult? Function(int messageId)? onDislikeMessage,
  }) {
    return onLoadDetail?.call(ticketId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticketId)? onLoadDetail,
    TResult Function(String message)? onSendMessage,
    TResult Function(int messageId)? onDeleteMessage,
    TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult Function(int messageId)? onLikeMessage,
    TResult Function(int messageId)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onLoadDetail != null) {
      return onLoadDetail(ticketId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadDetail value) onLoadDetail,
    required TResult Function(OnSendMessage value) onSendMessage,
    required TResult Function(OnDeleteMessage value) onDeleteMessage,
    required TResult Function(OnUpdateTicket value) onUpdateTicket,
    required TResult Function(OnLikeMessage value) onLikeMessage,
    required TResult Function(OnDislikeMessage value) onDislikeMessage,
  }) {
    return onLoadDetail(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadDetail value)? onLoadDetail,
    TResult? Function(OnSendMessage value)? onSendMessage,
    TResult? Function(OnDeleteMessage value)? onDeleteMessage,
    TResult? Function(OnUpdateTicket value)? onUpdateTicket,
    TResult? Function(OnLikeMessage value)? onLikeMessage,
    TResult? Function(OnDislikeMessage value)? onDislikeMessage,
  }) {
    return onLoadDetail?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadDetail value)? onLoadDetail,
    TResult Function(OnSendMessage value)? onSendMessage,
    TResult Function(OnDeleteMessage value)? onDeleteMessage,
    TResult Function(OnUpdateTicket value)? onUpdateTicket,
    TResult Function(OnLikeMessage value)? onLikeMessage,
    TResult Function(OnDislikeMessage value)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onLoadDetail != null) {
      return onLoadDetail(this);
    }
    return orElse();
  }
}

abstract class OnLoadDetail implements TicketDetailEvent {
  const factory OnLoadDetail({required final int ticketId}) =
      _$OnLoadDetailImpl;

  int get ticketId;

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnLoadDetailImplCopyWith<_$OnLoadDetailImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnSendMessageImplCopyWith<$Res> {
  factory _$$OnSendMessageImplCopyWith(
    _$OnSendMessageImpl value,
    $Res Function(_$OnSendMessageImpl) then,
  ) = __$$OnSendMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$OnSendMessageImplCopyWithImpl<$Res>
    extends _$TicketDetailEventCopyWithImpl<$Res, _$OnSendMessageImpl>
    implements _$$OnSendMessageImplCopyWith<$Res> {
  __$$OnSendMessageImplCopyWithImpl(
    _$OnSendMessageImpl _value,
    $Res Function(_$OnSendMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$OnSendMessageImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$OnSendMessageImpl implements OnSendMessage {
  const _$OnSendMessageImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'TicketDetailEvent.onSendMessage(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnSendMessageImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnSendMessageImplCopyWith<_$OnSendMessageImpl> get copyWith =>
      __$$OnSendMessageImplCopyWithImpl<_$OnSendMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticketId) onLoadDetail,
    required TResult Function(String message) onSendMessage,
    required TResult Function(int messageId) onDeleteMessage,
    required TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )
    onUpdateTicket,
    required TResult Function(int messageId) onLikeMessage,
    required TResult Function(int messageId) onDislikeMessage,
  }) {
    return onSendMessage(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticketId)? onLoadDetail,
    TResult? Function(String message)? onSendMessage,
    TResult? Function(int messageId)? onDeleteMessage,
    TResult? Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult? Function(int messageId)? onLikeMessage,
    TResult? Function(int messageId)? onDislikeMessage,
  }) {
    return onSendMessage?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticketId)? onLoadDetail,
    TResult Function(String message)? onSendMessage,
    TResult Function(int messageId)? onDeleteMessage,
    TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult Function(int messageId)? onLikeMessage,
    TResult Function(int messageId)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onSendMessage != null) {
      return onSendMessage(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadDetail value) onLoadDetail,
    required TResult Function(OnSendMessage value) onSendMessage,
    required TResult Function(OnDeleteMessage value) onDeleteMessage,
    required TResult Function(OnUpdateTicket value) onUpdateTicket,
    required TResult Function(OnLikeMessage value) onLikeMessage,
    required TResult Function(OnDislikeMessage value) onDislikeMessage,
  }) {
    return onSendMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadDetail value)? onLoadDetail,
    TResult? Function(OnSendMessage value)? onSendMessage,
    TResult? Function(OnDeleteMessage value)? onDeleteMessage,
    TResult? Function(OnUpdateTicket value)? onUpdateTicket,
    TResult? Function(OnLikeMessage value)? onLikeMessage,
    TResult? Function(OnDislikeMessage value)? onDislikeMessage,
  }) {
    return onSendMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadDetail value)? onLoadDetail,
    TResult Function(OnSendMessage value)? onSendMessage,
    TResult Function(OnDeleteMessage value)? onDeleteMessage,
    TResult Function(OnUpdateTicket value)? onUpdateTicket,
    TResult Function(OnLikeMessage value)? onLikeMessage,
    TResult Function(OnDislikeMessage value)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onSendMessage != null) {
      return onSendMessage(this);
    }
    return orElse();
  }
}

abstract class OnSendMessage implements TicketDetailEvent {
  const factory OnSendMessage({required final String message}) =
      _$OnSendMessageImpl;

  String get message;

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnSendMessageImplCopyWith<_$OnSendMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnDeleteMessageImplCopyWith<$Res> {
  factory _$$OnDeleteMessageImplCopyWith(
    _$OnDeleteMessageImpl value,
    $Res Function(_$OnDeleteMessageImpl) then,
  ) = __$$OnDeleteMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int messageId});
}

/// @nodoc
class __$$OnDeleteMessageImplCopyWithImpl<$Res>
    extends _$TicketDetailEventCopyWithImpl<$Res, _$OnDeleteMessageImpl>
    implements _$$OnDeleteMessageImplCopyWith<$Res> {
  __$$OnDeleteMessageImplCopyWithImpl(
    _$OnDeleteMessageImpl _value,
    $Res Function(_$OnDeleteMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? messageId = null}) {
    return _then(
      _$OnDeleteMessageImpl(
        messageId: null == messageId
            ? _value.messageId
            : messageId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$OnDeleteMessageImpl implements OnDeleteMessage {
  const _$OnDeleteMessageImpl({required this.messageId});

  @override
  final int messageId;

  @override
  String toString() {
    return 'TicketDetailEvent.onDeleteMessage(messageId: $messageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDeleteMessageImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageId);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnDeleteMessageImplCopyWith<_$OnDeleteMessageImpl> get copyWith =>
      __$$OnDeleteMessageImplCopyWithImpl<_$OnDeleteMessageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticketId) onLoadDetail,
    required TResult Function(String message) onSendMessage,
    required TResult Function(int messageId) onDeleteMessage,
    required TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )
    onUpdateTicket,
    required TResult Function(int messageId) onLikeMessage,
    required TResult Function(int messageId) onDislikeMessage,
  }) {
    return onDeleteMessage(messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticketId)? onLoadDetail,
    TResult? Function(String message)? onSendMessage,
    TResult? Function(int messageId)? onDeleteMessage,
    TResult? Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult? Function(int messageId)? onLikeMessage,
    TResult? Function(int messageId)? onDislikeMessage,
  }) {
    return onDeleteMessage?.call(messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticketId)? onLoadDetail,
    TResult Function(String message)? onSendMessage,
    TResult Function(int messageId)? onDeleteMessage,
    TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult Function(int messageId)? onLikeMessage,
    TResult Function(int messageId)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onDeleteMessage != null) {
      return onDeleteMessage(messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadDetail value) onLoadDetail,
    required TResult Function(OnSendMessage value) onSendMessage,
    required TResult Function(OnDeleteMessage value) onDeleteMessage,
    required TResult Function(OnUpdateTicket value) onUpdateTicket,
    required TResult Function(OnLikeMessage value) onLikeMessage,
    required TResult Function(OnDislikeMessage value) onDislikeMessage,
  }) {
    return onDeleteMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadDetail value)? onLoadDetail,
    TResult? Function(OnSendMessage value)? onSendMessage,
    TResult? Function(OnDeleteMessage value)? onDeleteMessage,
    TResult? Function(OnUpdateTicket value)? onUpdateTicket,
    TResult? Function(OnLikeMessage value)? onLikeMessage,
    TResult? Function(OnDislikeMessage value)? onDislikeMessage,
  }) {
    return onDeleteMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadDetail value)? onLoadDetail,
    TResult Function(OnSendMessage value)? onSendMessage,
    TResult Function(OnDeleteMessage value)? onDeleteMessage,
    TResult Function(OnUpdateTicket value)? onUpdateTicket,
    TResult Function(OnLikeMessage value)? onLikeMessage,
    TResult Function(OnDislikeMessage value)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onDeleteMessage != null) {
      return onDeleteMessage(this);
    }
    return orElse();
  }
}

abstract class OnDeleteMessage implements TicketDetailEvent {
  const factory OnDeleteMessage({required final int messageId}) =
      _$OnDeleteMessageImpl;

  int get messageId;

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnDeleteMessageImplCopyWith<_$OnDeleteMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnUpdateTicketImplCopyWith<$Res> {
  factory _$$OnUpdateTicketImplCopyWith(
    _$OnUpdateTicketImpl value,
    $Res Function(_$OnUpdateTicketImpl) then,
  ) = __$$OnUpdateTicketImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    String title,
    String description,
    String? clientNote,
    ProjectModel? project,
  });
}

/// @nodoc
class __$$OnUpdateTicketImplCopyWithImpl<$Res>
    extends _$TicketDetailEventCopyWithImpl<$Res, _$OnUpdateTicketImpl>
    implements _$$OnUpdateTicketImplCopyWith<$Res> {
  __$$OnUpdateTicketImplCopyWithImpl(
    _$OnUpdateTicketImpl _value,
    $Res Function(_$OnUpdateTicketImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? title = null,
    Object? description = null,
    Object? clientNote = freezed,
    Object? project = freezed,
  }) {
    return _then(
      _$OnUpdateTicketImpl(
        title: null == title
            ? _value.title
            : title // ignore: cast_nullable_to_non_nullable
                  as String,
        description: null == description
            ? _value.description
            : description // ignore: cast_nullable_to_non_nullable
                  as String,
        clientNote: freezed == clientNote
            ? _value.clientNote
            : clientNote // ignore: cast_nullable_to_non_nullable
                  as String?,
        project: freezed == project
            ? _value.project
            : project // ignore: cast_nullable_to_non_nullable
                  as ProjectModel?,
      ),
    );
  }
}

/// @nodoc

class _$OnUpdateTicketImpl implements OnUpdateTicket {
  const _$OnUpdateTicketImpl({
    required this.title,
    required this.description,
    required this.clientNote,
    required this.project,
  });

  @override
  final String title;
  @override
  final String description;
  @override
  final String? clientNote;
  @override
  final ProjectModel? project;

  @override
  String toString() {
    return 'TicketDetailEvent.onUpdateTicket(title: $title, description: $description, clientNote: $clientNote, project: $project)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnUpdateTicketImpl &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.clientNote, clientNote) ||
                other.clientNote == clientNote) &&
            (identical(other.project, project) || other.project == project));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, title, description, clientNote, project);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnUpdateTicketImplCopyWith<_$OnUpdateTicketImpl> get copyWith =>
      __$$OnUpdateTicketImplCopyWithImpl<_$OnUpdateTicketImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticketId) onLoadDetail,
    required TResult Function(String message) onSendMessage,
    required TResult Function(int messageId) onDeleteMessage,
    required TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )
    onUpdateTicket,
    required TResult Function(int messageId) onLikeMessage,
    required TResult Function(int messageId) onDislikeMessage,
  }) {
    return onUpdateTicket(title, description, clientNote, project);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticketId)? onLoadDetail,
    TResult? Function(String message)? onSendMessage,
    TResult? Function(int messageId)? onDeleteMessage,
    TResult? Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult? Function(int messageId)? onLikeMessage,
    TResult? Function(int messageId)? onDislikeMessage,
  }) {
    return onUpdateTicket?.call(title, description, clientNote, project);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticketId)? onLoadDetail,
    TResult Function(String message)? onSendMessage,
    TResult Function(int messageId)? onDeleteMessage,
    TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult Function(int messageId)? onLikeMessage,
    TResult Function(int messageId)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onUpdateTicket != null) {
      return onUpdateTicket(title, description, clientNote, project);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadDetail value) onLoadDetail,
    required TResult Function(OnSendMessage value) onSendMessage,
    required TResult Function(OnDeleteMessage value) onDeleteMessage,
    required TResult Function(OnUpdateTicket value) onUpdateTicket,
    required TResult Function(OnLikeMessage value) onLikeMessage,
    required TResult Function(OnDislikeMessage value) onDislikeMessage,
  }) {
    return onUpdateTicket(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadDetail value)? onLoadDetail,
    TResult? Function(OnSendMessage value)? onSendMessage,
    TResult? Function(OnDeleteMessage value)? onDeleteMessage,
    TResult? Function(OnUpdateTicket value)? onUpdateTicket,
    TResult? Function(OnLikeMessage value)? onLikeMessage,
    TResult? Function(OnDislikeMessage value)? onDislikeMessage,
  }) {
    return onUpdateTicket?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadDetail value)? onLoadDetail,
    TResult Function(OnSendMessage value)? onSendMessage,
    TResult Function(OnDeleteMessage value)? onDeleteMessage,
    TResult Function(OnUpdateTicket value)? onUpdateTicket,
    TResult Function(OnLikeMessage value)? onLikeMessage,
    TResult Function(OnDislikeMessage value)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onUpdateTicket != null) {
      return onUpdateTicket(this);
    }
    return orElse();
  }
}

abstract class OnUpdateTicket implements TicketDetailEvent {
  const factory OnUpdateTicket({
    required final String title,
    required final String description,
    required final String? clientNote,
    required final ProjectModel? project,
  }) = _$OnUpdateTicketImpl;

  String get title;
  String get description;
  String? get clientNote;
  ProjectModel? get project;

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnUpdateTicketImplCopyWith<_$OnUpdateTicketImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnLikeMessageImplCopyWith<$Res> {
  factory _$$OnLikeMessageImplCopyWith(
    _$OnLikeMessageImpl value,
    $Res Function(_$OnLikeMessageImpl) then,
  ) = __$$OnLikeMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int messageId});
}

/// @nodoc
class __$$OnLikeMessageImplCopyWithImpl<$Res>
    extends _$TicketDetailEventCopyWithImpl<$Res, _$OnLikeMessageImpl>
    implements _$$OnLikeMessageImplCopyWith<$Res> {
  __$$OnLikeMessageImplCopyWithImpl(
    _$OnLikeMessageImpl _value,
    $Res Function(_$OnLikeMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? messageId = null}) {
    return _then(
      _$OnLikeMessageImpl(
        messageId: null == messageId
            ? _value.messageId
            : messageId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$OnLikeMessageImpl implements OnLikeMessage {
  const _$OnLikeMessageImpl({required this.messageId});

  @override
  final int messageId;

  @override
  String toString() {
    return 'TicketDetailEvent.onLikeMessage(messageId: $messageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnLikeMessageImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageId);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnLikeMessageImplCopyWith<_$OnLikeMessageImpl> get copyWith =>
      __$$OnLikeMessageImplCopyWithImpl<_$OnLikeMessageImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticketId) onLoadDetail,
    required TResult Function(String message) onSendMessage,
    required TResult Function(int messageId) onDeleteMessage,
    required TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )
    onUpdateTicket,
    required TResult Function(int messageId) onLikeMessage,
    required TResult Function(int messageId) onDislikeMessage,
  }) {
    return onLikeMessage(messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticketId)? onLoadDetail,
    TResult? Function(String message)? onSendMessage,
    TResult? Function(int messageId)? onDeleteMessage,
    TResult? Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult? Function(int messageId)? onLikeMessage,
    TResult? Function(int messageId)? onDislikeMessage,
  }) {
    return onLikeMessage?.call(messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticketId)? onLoadDetail,
    TResult Function(String message)? onSendMessage,
    TResult Function(int messageId)? onDeleteMessage,
    TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult Function(int messageId)? onLikeMessage,
    TResult Function(int messageId)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onLikeMessage != null) {
      return onLikeMessage(messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadDetail value) onLoadDetail,
    required TResult Function(OnSendMessage value) onSendMessage,
    required TResult Function(OnDeleteMessage value) onDeleteMessage,
    required TResult Function(OnUpdateTicket value) onUpdateTicket,
    required TResult Function(OnLikeMessage value) onLikeMessage,
    required TResult Function(OnDislikeMessage value) onDislikeMessage,
  }) {
    return onLikeMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadDetail value)? onLoadDetail,
    TResult? Function(OnSendMessage value)? onSendMessage,
    TResult? Function(OnDeleteMessage value)? onDeleteMessage,
    TResult? Function(OnUpdateTicket value)? onUpdateTicket,
    TResult? Function(OnLikeMessage value)? onLikeMessage,
    TResult? Function(OnDislikeMessage value)? onDislikeMessage,
  }) {
    return onLikeMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadDetail value)? onLoadDetail,
    TResult Function(OnSendMessage value)? onSendMessage,
    TResult Function(OnDeleteMessage value)? onDeleteMessage,
    TResult Function(OnUpdateTicket value)? onUpdateTicket,
    TResult Function(OnLikeMessage value)? onLikeMessage,
    TResult Function(OnDislikeMessage value)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onLikeMessage != null) {
      return onLikeMessage(this);
    }
    return orElse();
  }
}

abstract class OnLikeMessage implements TicketDetailEvent {
  const factory OnLikeMessage({required final int messageId}) =
      _$OnLikeMessageImpl;

  int get messageId;

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnLikeMessageImplCopyWith<_$OnLikeMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OnDislikeMessageImplCopyWith<$Res> {
  factory _$$OnDislikeMessageImplCopyWith(
    _$OnDislikeMessageImpl value,
    $Res Function(_$OnDislikeMessageImpl) then,
  ) = __$$OnDislikeMessageImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int messageId});
}

/// @nodoc
class __$$OnDislikeMessageImplCopyWithImpl<$Res>
    extends _$TicketDetailEventCopyWithImpl<$Res, _$OnDislikeMessageImpl>
    implements _$$OnDislikeMessageImplCopyWith<$Res> {
  __$$OnDislikeMessageImplCopyWithImpl(
    _$OnDislikeMessageImpl _value,
    $Res Function(_$OnDislikeMessageImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? messageId = null}) {
    return _then(
      _$OnDislikeMessageImpl(
        messageId: null == messageId
            ? _value.messageId
            : messageId // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$OnDislikeMessageImpl implements OnDislikeMessage {
  const _$OnDislikeMessageImpl({required this.messageId});

  @override
  final int messageId;

  @override
  String toString() {
    return 'TicketDetailEvent.onDislikeMessage(messageId: $messageId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OnDislikeMessageImpl &&
            (identical(other.messageId, messageId) ||
                other.messageId == messageId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, messageId);

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OnDislikeMessageImplCopyWith<_$OnDislikeMessageImpl> get copyWith =>
      __$$OnDislikeMessageImplCopyWithImpl<_$OnDislikeMessageImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int ticketId) onLoadDetail,
    required TResult Function(String message) onSendMessage,
    required TResult Function(int messageId) onDeleteMessage,
    required TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )
    onUpdateTicket,
    required TResult Function(int messageId) onLikeMessage,
    required TResult Function(int messageId) onDislikeMessage,
  }) {
    return onDislikeMessage(messageId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int ticketId)? onLoadDetail,
    TResult? Function(String message)? onSendMessage,
    TResult? Function(int messageId)? onDeleteMessage,
    TResult? Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult? Function(int messageId)? onLikeMessage,
    TResult? Function(int messageId)? onDislikeMessage,
  }) {
    return onDislikeMessage?.call(messageId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int ticketId)? onLoadDetail,
    TResult Function(String message)? onSendMessage,
    TResult Function(int messageId)? onDeleteMessage,
    TResult Function(
      String title,
      String description,
      String? clientNote,
      ProjectModel? project,
    )?
    onUpdateTicket,
    TResult Function(int messageId)? onLikeMessage,
    TResult Function(int messageId)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onDislikeMessage != null) {
      return onDislikeMessage(messageId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(OnLoadDetail value) onLoadDetail,
    required TResult Function(OnSendMessage value) onSendMessage,
    required TResult Function(OnDeleteMessage value) onDeleteMessage,
    required TResult Function(OnUpdateTicket value) onUpdateTicket,
    required TResult Function(OnLikeMessage value) onLikeMessage,
    required TResult Function(OnDislikeMessage value) onDislikeMessage,
  }) {
    return onDislikeMessage(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(OnLoadDetail value)? onLoadDetail,
    TResult? Function(OnSendMessage value)? onSendMessage,
    TResult? Function(OnDeleteMessage value)? onDeleteMessage,
    TResult? Function(OnUpdateTicket value)? onUpdateTicket,
    TResult? Function(OnLikeMessage value)? onLikeMessage,
    TResult? Function(OnDislikeMessage value)? onDislikeMessage,
  }) {
    return onDislikeMessage?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(OnLoadDetail value)? onLoadDetail,
    TResult Function(OnSendMessage value)? onSendMessage,
    TResult Function(OnDeleteMessage value)? onDeleteMessage,
    TResult Function(OnUpdateTicket value)? onUpdateTicket,
    TResult Function(OnLikeMessage value)? onLikeMessage,
    TResult Function(OnDislikeMessage value)? onDislikeMessage,
    required TResult orElse(),
  }) {
    if (onDislikeMessage != null) {
      return onDislikeMessage(this);
    }
    return orElse();
  }
}

abstract class OnDislikeMessage implements TicketDetailEvent {
  const factory OnDislikeMessage({required final int messageId}) =
      _$OnDislikeMessageImpl;

  int get messageId;

  /// Create a copy of TicketDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OnDislikeMessageImplCopyWith<_$OnDislikeMessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TicketDetailState {
  CommonScreenState get loadingState => throw _privateConstructorUsedError;
  TicketModel? get ticket => throw _privateConstructorUsedError;
  List<ConversationMessage> get conversations =>
      throw _privateConstructorUsedError;

  /// Create a copy of TicketDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TicketDetailStateCopyWith<TicketDetailState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TicketDetailStateCopyWith<$Res> {
  factory $TicketDetailStateCopyWith(
    TicketDetailState value,
    $Res Function(TicketDetailState) then,
  ) = _$TicketDetailStateCopyWithImpl<$Res, TicketDetailState>;
  @useResult
  $Res call({
    CommonScreenState loadingState,
    TicketModel? ticket,
    List<ConversationMessage> conversations,
  });
}

/// @nodoc
class _$TicketDetailStateCopyWithImpl<$Res, $Val extends TicketDetailState>
    implements $TicketDetailStateCopyWith<$Res> {
  _$TicketDetailStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of TicketDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? ticket = freezed,
    Object? conversations = null,
  }) {
    return _then(
      _value.copyWith(
            loadingState: null == loadingState
                ? _value.loadingState
                : loadingState // ignore: cast_nullable_to_non_nullable
                      as CommonScreenState,
            ticket: freezed == ticket
                ? _value.ticket
                : ticket // ignore: cast_nullable_to_non_nullable
                      as TicketModel?,
            conversations: null == conversations
                ? _value.conversations
                : conversations // ignore: cast_nullable_to_non_nullable
                      as List<ConversationMessage>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$TicketDetailStateImplCopyWith<$Res>
    implements $TicketDetailStateCopyWith<$Res> {
  factory _$$TicketDetailStateImplCopyWith(
    _$TicketDetailStateImpl value,
    $Res Function(_$TicketDetailStateImpl) then,
  ) = __$$TicketDetailStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    CommonScreenState loadingState,
    TicketModel? ticket,
    List<ConversationMessage> conversations,
  });
}

/// @nodoc
class __$$TicketDetailStateImplCopyWithImpl<$Res>
    extends _$TicketDetailStateCopyWithImpl<$Res, _$TicketDetailStateImpl>
    implements _$$TicketDetailStateImplCopyWith<$Res> {
  __$$TicketDetailStateImplCopyWithImpl(
    _$TicketDetailStateImpl _value,
    $Res Function(_$TicketDetailStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of TicketDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loadingState = null,
    Object? ticket = freezed,
    Object? conversations = null,
  }) {
    return _then(
      _$TicketDetailStateImpl(
        loadingState: null == loadingState
            ? _value.loadingState
            : loadingState // ignore: cast_nullable_to_non_nullable
                  as CommonScreenState,
        ticket: freezed == ticket
            ? _value.ticket
            : ticket // ignore: cast_nullable_to_non_nullable
                  as TicketModel?,
        conversations: null == conversations
            ? _value._conversations
            : conversations // ignore: cast_nullable_to_non_nullable
                  as List<ConversationMessage>,
      ),
    );
  }
}

/// @nodoc

class _$TicketDetailStateImpl implements _TicketDetailState {
  const _$TicketDetailStateImpl({
    required this.loadingState,
    required this.ticket,
    required final List<ConversationMessage> conversations,
  }) : _conversations = conversations;

  @override
  final CommonScreenState loadingState;
  @override
  final TicketModel? ticket;
  final List<ConversationMessage> _conversations;
  @override
  List<ConversationMessage> get conversations {
    if (_conversations is EqualUnmodifiableListView) return _conversations;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_conversations);
  }

  @override
  String toString() {
    return 'TicketDetailState(loadingState: $loadingState, ticket: $ticket, conversations: $conversations)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TicketDetailStateImpl &&
            (identical(other.loadingState, loadingState) ||
                other.loadingState == loadingState) &&
            (identical(other.ticket, ticket) || other.ticket == ticket) &&
            const DeepCollectionEquality().equals(
              other._conversations,
              _conversations,
            ));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    loadingState,
    ticket,
    const DeepCollectionEquality().hash(_conversations),
  );

  /// Create a copy of TicketDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TicketDetailStateImplCopyWith<_$TicketDetailStateImpl> get copyWith =>
      __$$TicketDetailStateImplCopyWithImpl<_$TicketDetailStateImpl>(
        this,
        _$identity,
      );
}

abstract class _TicketDetailState implements TicketDetailState {
  const factory _TicketDetailState({
    required final CommonScreenState loadingState,
    required final TicketModel? ticket,
    required final List<ConversationMessage> conversations,
  }) = _$TicketDetailStateImpl;

  @override
  CommonScreenState get loadingState;
  @override
  TicketModel? get ticket;
  @override
  List<ConversationMessage> get conversations;

  /// Create a copy of TicketDetailState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TicketDetailStateImplCopyWith<_$TicketDetailStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
