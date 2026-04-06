// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_detail_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TicketDetailEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketDetailEvent()';
}


}

/// @nodoc
class $TicketDetailEventCopyWith<$Res>  {
$TicketDetailEventCopyWith(TicketDetailEvent _, $Res Function(TicketDetailEvent) __);
}


/// Adds pattern-matching-related methods to [TicketDetailEvent].
extension TicketDetailEventPatterns on TicketDetailEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnLoadDetail value)?  onLoadDetail,TResult Function( OnSendMessage value)?  onSendMessage,TResult Function( OnDeleteMessage value)?  onDeleteMessage,TResult Function( OnUpdateTicket value)?  onUpdateTicket,TResult Function( OnLikeMessage value)?  onLikeMessage,TResult Function( OnDislikeMessage value)?  onDislikeMessage,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnLoadDetail() when onLoadDetail != null:
return onLoadDetail(_that);case OnSendMessage() when onSendMessage != null:
return onSendMessage(_that);case OnDeleteMessage() when onDeleteMessage != null:
return onDeleteMessage(_that);case OnUpdateTicket() when onUpdateTicket != null:
return onUpdateTicket(_that);case OnLikeMessage() when onLikeMessage != null:
return onLikeMessage(_that);case OnDislikeMessage() when onDislikeMessage != null:
return onDislikeMessage(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnLoadDetail value)  onLoadDetail,required TResult Function( OnSendMessage value)  onSendMessage,required TResult Function( OnDeleteMessage value)  onDeleteMessage,required TResult Function( OnUpdateTicket value)  onUpdateTicket,required TResult Function( OnLikeMessage value)  onLikeMessage,required TResult Function( OnDislikeMessage value)  onDislikeMessage,}){
final _that = this;
switch (_that) {
case OnLoadDetail():
return onLoadDetail(_that);case OnSendMessage():
return onSendMessage(_that);case OnDeleteMessage():
return onDeleteMessage(_that);case OnUpdateTicket():
return onUpdateTicket(_that);case OnLikeMessage():
return onLikeMessage(_that);case OnDislikeMessage():
return onDislikeMessage(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnLoadDetail value)?  onLoadDetail,TResult? Function( OnSendMessage value)?  onSendMessage,TResult? Function( OnDeleteMessage value)?  onDeleteMessage,TResult? Function( OnUpdateTicket value)?  onUpdateTicket,TResult? Function( OnLikeMessage value)?  onLikeMessage,TResult? Function( OnDislikeMessage value)?  onDislikeMessage,}){
final _that = this;
switch (_that) {
case OnLoadDetail() when onLoadDetail != null:
return onLoadDetail(_that);case OnSendMessage() when onSendMessage != null:
return onSendMessage(_that);case OnDeleteMessage() when onDeleteMessage != null:
return onDeleteMessage(_that);case OnUpdateTicket() when onUpdateTicket != null:
return onUpdateTicket(_that);case OnLikeMessage() when onLikeMessage != null:
return onLikeMessage(_that);case OnDislikeMessage() when onDislikeMessage != null:
return onDislikeMessage(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int ticketId)?  onLoadDetail,TResult Function( String message)?  onSendMessage,TResult Function( int messageId)?  onDeleteMessage,TResult Function( String title,  String description,  String? clientNote,  ProjectModel? project)?  onUpdateTicket,TResult Function( int messageId)?  onLikeMessage,TResult Function( int messageId)?  onDislikeMessage,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnLoadDetail() when onLoadDetail != null:
return onLoadDetail(_that.ticketId);case OnSendMessage() when onSendMessage != null:
return onSendMessage(_that.message);case OnDeleteMessage() when onDeleteMessage != null:
return onDeleteMessage(_that.messageId);case OnUpdateTicket() when onUpdateTicket != null:
return onUpdateTicket(_that.title,_that.description,_that.clientNote,_that.project);case OnLikeMessage() when onLikeMessage != null:
return onLikeMessage(_that.messageId);case OnDislikeMessage() when onDislikeMessage != null:
return onDislikeMessage(_that.messageId);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int ticketId)  onLoadDetail,required TResult Function( String message)  onSendMessage,required TResult Function( int messageId)  onDeleteMessage,required TResult Function( String title,  String description,  String? clientNote,  ProjectModel? project)  onUpdateTicket,required TResult Function( int messageId)  onLikeMessage,required TResult Function( int messageId)  onDislikeMessage,}) {final _that = this;
switch (_that) {
case OnLoadDetail():
return onLoadDetail(_that.ticketId);case OnSendMessage():
return onSendMessage(_that.message);case OnDeleteMessage():
return onDeleteMessage(_that.messageId);case OnUpdateTicket():
return onUpdateTicket(_that.title,_that.description,_that.clientNote,_that.project);case OnLikeMessage():
return onLikeMessage(_that.messageId);case OnDislikeMessage():
return onDislikeMessage(_that.messageId);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int ticketId)?  onLoadDetail,TResult? Function( String message)?  onSendMessage,TResult? Function( int messageId)?  onDeleteMessage,TResult? Function( String title,  String description,  String? clientNote,  ProjectModel? project)?  onUpdateTicket,TResult? Function( int messageId)?  onLikeMessage,TResult? Function( int messageId)?  onDislikeMessage,}) {final _that = this;
switch (_that) {
case OnLoadDetail() when onLoadDetail != null:
return onLoadDetail(_that.ticketId);case OnSendMessage() when onSendMessage != null:
return onSendMessage(_that.message);case OnDeleteMessage() when onDeleteMessage != null:
return onDeleteMessage(_that.messageId);case OnUpdateTicket() when onUpdateTicket != null:
return onUpdateTicket(_that.title,_that.description,_that.clientNote,_that.project);case OnLikeMessage() when onLikeMessage != null:
return onLikeMessage(_that.messageId);case OnDislikeMessage() when onDislikeMessage != null:
return onDislikeMessage(_that.messageId);case _:
  return null;

}
}

}

/// @nodoc


class OnLoadDetail implements TicketDetailEvent {
  const OnLoadDetail({required this.ticketId});
  

 final  int ticketId;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnLoadDetailCopyWith<OnLoadDetail> get copyWith => _$OnLoadDetailCopyWithImpl<OnLoadDetail>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLoadDetail&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId));
}


@override
int get hashCode => Object.hash(runtimeType,ticketId);

@override
String toString() {
  return 'TicketDetailEvent.onLoadDetail(ticketId: $ticketId)';
}


}

/// @nodoc
abstract mixin class $OnLoadDetailCopyWith<$Res> implements $TicketDetailEventCopyWith<$Res> {
  factory $OnLoadDetailCopyWith(OnLoadDetail value, $Res Function(OnLoadDetail) _then) = _$OnLoadDetailCopyWithImpl;
@useResult
$Res call({
 int ticketId
});




}
/// @nodoc
class _$OnLoadDetailCopyWithImpl<$Res>
    implements $OnLoadDetailCopyWith<$Res> {
  _$OnLoadDetailCopyWithImpl(this._self, this._then);

  final OnLoadDetail _self;
  final $Res Function(OnLoadDetail) _then;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ticketId = null,}) {
  return _then(OnLoadDetail(
ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OnSendMessage implements TicketDetailEvent {
  const OnSendMessage({required this.message});
  

 final  String message;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSendMessageCopyWith<OnSendMessage> get copyWith => _$OnSendMessageCopyWithImpl<OnSendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSendMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'TicketDetailEvent.onSendMessage(message: $message)';
}


}

/// @nodoc
abstract mixin class $OnSendMessageCopyWith<$Res> implements $TicketDetailEventCopyWith<$Res> {
  factory $OnSendMessageCopyWith(OnSendMessage value, $Res Function(OnSendMessage) _then) = _$OnSendMessageCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$OnSendMessageCopyWithImpl<$Res>
    implements $OnSendMessageCopyWith<$Res> {
  _$OnSendMessageCopyWithImpl(this._self, this._then);

  final OnSendMessage _self;
  final $Res Function(OnSendMessage) _then;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(OnSendMessage(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnDeleteMessage implements TicketDetailEvent {
  const OnDeleteMessage({required this.messageId});
  

 final  int messageId;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnDeleteMessageCopyWith<OnDeleteMessage> get copyWith => _$OnDeleteMessageCopyWithImpl<OnDeleteMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnDeleteMessage&&(identical(other.messageId, messageId) || other.messageId == messageId));
}


@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'TicketDetailEvent.onDeleteMessage(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $OnDeleteMessageCopyWith<$Res> implements $TicketDetailEventCopyWith<$Res> {
  factory $OnDeleteMessageCopyWith(OnDeleteMessage value, $Res Function(OnDeleteMessage) _then) = _$OnDeleteMessageCopyWithImpl;
@useResult
$Res call({
 int messageId
});




}
/// @nodoc
class _$OnDeleteMessageCopyWithImpl<$Res>
    implements $OnDeleteMessageCopyWith<$Res> {
  _$OnDeleteMessageCopyWithImpl(this._self, this._then);

  final OnDeleteMessage _self;
  final $Res Function(OnDeleteMessage) _then;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(OnDeleteMessage(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OnUpdateTicket implements TicketDetailEvent {
  const OnUpdateTicket({required this.title, required this.description, required this.clientNote, required this.project});
  

 final  String title;
 final  String description;
 final  String? clientNote;
 final  ProjectModel? project;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnUpdateTicketCopyWith<OnUpdateTicket> get copyWith => _$OnUpdateTicketCopyWithImpl<OnUpdateTicket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnUpdateTicket&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.clientNote, clientNote) || other.clientNote == clientNote)&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,clientNote,project);

@override
String toString() {
  return 'TicketDetailEvent.onUpdateTicket(title: $title, description: $description, clientNote: $clientNote, project: $project)';
}


}

/// @nodoc
abstract mixin class $OnUpdateTicketCopyWith<$Res> implements $TicketDetailEventCopyWith<$Res> {
  factory $OnUpdateTicketCopyWith(OnUpdateTicket value, $Res Function(OnUpdateTicket) _then) = _$OnUpdateTicketCopyWithImpl;
@useResult
$Res call({
 String title, String description, String? clientNote, ProjectModel? project
});




}
/// @nodoc
class _$OnUpdateTicketCopyWithImpl<$Res>
    implements $OnUpdateTicketCopyWith<$Res> {
  _$OnUpdateTicketCopyWithImpl(this._self, this._then);

  final OnUpdateTicket _self;
  final $Res Function(OnUpdateTicket) _then;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,Object? description = null,Object? clientNote = freezed,Object? project = freezed,}) {
  return _then(OnUpdateTicket(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,clientNote: freezed == clientNote ? _self.clientNote : clientNote // ignore: cast_nullable_to_non_nullable
as String?,project: freezed == project ? _self.project : project // ignore: cast_nullable_to_non_nullable
as ProjectModel?,
  ));
}


}

/// @nodoc


class OnLikeMessage implements TicketDetailEvent {
  const OnLikeMessage({required this.messageId});
  

 final  int messageId;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnLikeMessageCopyWith<OnLikeMessage> get copyWith => _$OnLikeMessageCopyWithImpl<OnLikeMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLikeMessage&&(identical(other.messageId, messageId) || other.messageId == messageId));
}


@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'TicketDetailEvent.onLikeMessage(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $OnLikeMessageCopyWith<$Res> implements $TicketDetailEventCopyWith<$Res> {
  factory $OnLikeMessageCopyWith(OnLikeMessage value, $Res Function(OnLikeMessage) _then) = _$OnLikeMessageCopyWithImpl;
@useResult
$Res call({
 int messageId
});




}
/// @nodoc
class _$OnLikeMessageCopyWithImpl<$Res>
    implements $OnLikeMessageCopyWith<$Res> {
  _$OnLikeMessageCopyWithImpl(this._self, this._then);

  final OnLikeMessage _self;
  final $Res Function(OnLikeMessage) _then;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(OnLikeMessage(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OnDislikeMessage implements TicketDetailEvent {
  const OnDislikeMessage({required this.messageId});
  

 final  int messageId;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnDislikeMessageCopyWith<OnDislikeMessage> get copyWith => _$OnDislikeMessageCopyWithImpl<OnDislikeMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnDislikeMessage&&(identical(other.messageId, messageId) || other.messageId == messageId));
}


@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString() {
  return 'TicketDetailEvent.onDislikeMessage(messageId: $messageId)';
}


}

/// @nodoc
abstract mixin class $OnDislikeMessageCopyWith<$Res> implements $TicketDetailEventCopyWith<$Res> {
  factory $OnDislikeMessageCopyWith(OnDislikeMessage value, $Res Function(OnDislikeMessage) _then) = _$OnDislikeMessageCopyWithImpl;
@useResult
$Res call({
 int messageId
});




}
/// @nodoc
class _$OnDislikeMessageCopyWithImpl<$Res>
    implements $OnDislikeMessageCopyWith<$Res> {
  _$OnDislikeMessageCopyWithImpl(this._self, this._then);

  final OnDislikeMessage _self;
  final $Res Function(OnDislikeMessage) _then;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? messageId = null,}) {
  return _then(OnDislikeMessage(
messageId: null == messageId ? _self.messageId : messageId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$TicketDetailState {

 CommonScreenState get loadingState; TicketModel? get ticket; List<ConversationMessage> get conversations;
/// Create a copy of TicketDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketDetailStateCopyWith<TicketDetailState> get copyWith => _$TicketDetailStateCopyWithImpl<TicketDetailState>(this as TicketDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketDetailState&&(identical(other.loadingState, loadingState) || other.loadingState == loadingState)&&(identical(other.ticket, ticket) || other.ticket == ticket)&&const DeepCollectionEquality().equals(other.conversations, conversations));
}


@override
int get hashCode => Object.hash(runtimeType,loadingState,ticket,const DeepCollectionEquality().hash(conversations));

@override
String toString() {
  return 'TicketDetailState(loadingState: $loadingState, ticket: $ticket, conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class $TicketDetailStateCopyWith<$Res>  {
  factory $TicketDetailStateCopyWith(TicketDetailState value, $Res Function(TicketDetailState) _then) = _$TicketDetailStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState loadingState, TicketModel? ticket, List<ConversationMessage> conversations
});




}
/// @nodoc
class _$TicketDetailStateCopyWithImpl<$Res>
    implements $TicketDetailStateCopyWith<$Res> {
  _$TicketDetailStateCopyWithImpl(this._self, this._then);

  final TicketDetailState _self;
  final $Res Function(TicketDetailState) _then;

/// Create a copy of TicketDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadingState = null,Object? ticket = freezed,Object? conversations = null,}) {
  return _then(_self.copyWith(
loadingState: null == loadingState ? _self.loadingState : loadingState // ignore: cast_nullable_to_non_nullable
as CommonScreenState,ticket: freezed == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as TicketModel?,conversations: null == conversations ? _self.conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationMessage>,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketDetailState].
extension TicketDetailStatePatterns on TicketDetailState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketDetailState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketDetailState value)  $default,){
final _that = this;
switch (_that) {
case _TicketDetailState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _TicketDetailState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState loadingState,  TicketModel? ticket,  List<ConversationMessage> conversations)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketDetailState() when $default != null:
return $default(_that.loadingState,_that.ticket,_that.conversations);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState loadingState,  TicketModel? ticket,  List<ConversationMessage> conversations)  $default,) {final _that = this;
switch (_that) {
case _TicketDetailState():
return $default(_that.loadingState,_that.ticket,_that.conversations);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState loadingState,  TicketModel? ticket,  List<ConversationMessage> conversations)?  $default,) {final _that = this;
switch (_that) {
case _TicketDetailState() when $default != null:
return $default(_that.loadingState,_that.ticket,_that.conversations);case _:
  return null;

}
}

}

/// @nodoc


class _TicketDetailState implements TicketDetailState {
  const _TicketDetailState({required this.loadingState, required this.ticket, required final  List<ConversationMessage> conversations}): _conversations = conversations;
  

@override final  CommonScreenState loadingState;
@override final  TicketModel? ticket;
 final  List<ConversationMessage> _conversations;
@override List<ConversationMessage> get conversations {
  if (_conversations is EqualUnmodifiableListView) return _conversations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_conversations);
}


/// Create a copy of TicketDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketDetailStateCopyWith<_TicketDetailState> get copyWith => __$TicketDetailStateCopyWithImpl<_TicketDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketDetailState&&(identical(other.loadingState, loadingState) || other.loadingState == loadingState)&&(identical(other.ticket, ticket) || other.ticket == ticket)&&const DeepCollectionEquality().equals(other._conversations, _conversations));
}


@override
int get hashCode => Object.hash(runtimeType,loadingState,ticket,const DeepCollectionEquality().hash(_conversations));

@override
String toString() {
  return 'TicketDetailState(loadingState: $loadingState, ticket: $ticket, conversations: $conversations)';
}


}

/// @nodoc
abstract mixin class _$TicketDetailStateCopyWith<$Res> implements $TicketDetailStateCopyWith<$Res> {
  factory _$TicketDetailStateCopyWith(_TicketDetailState value, $Res Function(_TicketDetailState) _then) = __$TicketDetailStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState loadingState, TicketModel? ticket, List<ConversationMessage> conversations
});




}
/// @nodoc
class __$TicketDetailStateCopyWithImpl<$Res>
    implements _$TicketDetailStateCopyWith<$Res> {
  __$TicketDetailStateCopyWithImpl(this._self, this._then);

  final _TicketDetailState _self;
  final $Res Function(_TicketDetailState) _then;

/// Create a copy of TicketDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadingState = null,Object? ticket = freezed,Object? conversations = null,}) {
  return _then(_TicketDetailState(
loadingState: null == loadingState ? _self.loadingState : loadingState // ignore: cast_nullable_to_non_nullable
as CommonScreenState,ticket: freezed == ticket ? _self.ticket : ticket // ignore: cast_nullable_to_non_nullable
as TicketModel?,conversations: null == conversations ? _self._conversations : conversations // ignore: cast_nullable_to_non_nullable
as List<ConversationMessage>,
  ));
}


}

// dart format on
