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
mixin _$TicketDetailEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketDetailEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketDetailEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnLoadDetail value)?  onLoadDetail,TResult Function( OnSendMessage value)?  onSendMessage,TResult Function( OnDeleteMessage value)?  onDeleteMessage,TResult Function( OnUpdateTicket value)?  onUpdateTicket,TResult Function( OnDeleteTicket value)?  onDeleteTicket,TResult Function( OnStartReply value)?  onStartReply,TResult Function( OnCancelReply value)?  onCancelReply,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnLoadDetail() when onLoadDetail != null:
return onLoadDetail(_that);case OnSendMessage() when onSendMessage != null:
return onSendMessage(_that);case OnDeleteMessage() when onDeleteMessage != null:
return onDeleteMessage(_that);case OnUpdateTicket() when onUpdateTicket != null:
return onUpdateTicket(_that);case OnDeleteTicket() when onDeleteTicket != null:
return onDeleteTicket(_that);case OnStartReply() when onStartReply != null:
return onStartReply(_that);case OnCancelReply() when onCancelReply != null:
return onCancelReply(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnLoadDetail value)  onLoadDetail,required TResult Function( OnSendMessage value)  onSendMessage,required TResult Function( OnDeleteMessage value)  onDeleteMessage,required TResult Function( OnUpdateTicket value)  onUpdateTicket,required TResult Function( OnDeleteTicket value)  onDeleteTicket,required TResult Function( OnStartReply value)  onStartReply,required TResult Function( OnCancelReply value)  onCancelReply,}){
final _that = this;
switch (_that) {
case OnLoadDetail():
return onLoadDetail(_that);case OnSendMessage():
return onSendMessage(_that);case OnDeleteMessage():
return onDeleteMessage(_that);case OnUpdateTicket():
return onUpdateTicket(_that);case OnDeleteTicket():
return onDeleteTicket(_that);case OnStartReply():
return onStartReply(_that);case OnCancelReply():
return onCancelReply(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnLoadDetail value)?  onLoadDetail,TResult? Function( OnSendMessage value)?  onSendMessage,TResult? Function( OnDeleteMessage value)?  onDeleteMessage,TResult? Function( OnUpdateTicket value)?  onUpdateTicket,TResult? Function( OnDeleteTicket value)?  onDeleteTicket,TResult? Function( OnStartReply value)?  onStartReply,TResult? Function( OnCancelReply value)?  onCancelReply,}){
final _that = this;
switch (_that) {
case OnLoadDetail() when onLoadDetail != null:
return onLoadDetail(_that);case OnSendMessage() when onSendMessage != null:
return onSendMessage(_that);case OnDeleteMessage() when onDeleteMessage != null:
return onDeleteMessage(_that);case OnUpdateTicket() when onUpdateTicket != null:
return onUpdateTicket(_that);case OnDeleteTicket() when onDeleteTicket != null:
return onDeleteTicket(_that);case OnStartReply() when onStartReply != null:
return onStartReply(_that);case OnCancelReply() when onCancelReply != null:
return onCancelReply(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int ticketId)?  onLoadDetail,TResult Function( String message)?  onSendMessage,TResult Function( int messageId)?  onDeleteMessage,TResult Function( String title,  String description,  String? clientNote,  ProjectModel? project)?  onUpdateTicket,TResult Function()?  onDeleteTicket,TResult Function( HelpdeskCommentModel comment)?  onStartReply,TResult Function()?  onCancelReply,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnLoadDetail() when onLoadDetail != null:
return onLoadDetail(_that.ticketId);case OnSendMessage() when onSendMessage != null:
return onSendMessage(_that.message);case OnDeleteMessage() when onDeleteMessage != null:
return onDeleteMessage(_that.messageId);case OnUpdateTicket() when onUpdateTicket != null:
return onUpdateTicket(_that.title,_that.description,_that.clientNote,_that.project);case OnDeleteTicket() when onDeleteTicket != null:
return onDeleteTicket();case OnStartReply() when onStartReply != null:
return onStartReply(_that.comment);case OnCancelReply() when onCancelReply != null:
return onCancelReply();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int ticketId)  onLoadDetail,required TResult Function( String message)  onSendMessage,required TResult Function( int messageId)  onDeleteMessage,required TResult Function( String title,  String description,  String? clientNote,  ProjectModel? project)  onUpdateTicket,required TResult Function()  onDeleteTicket,required TResult Function( HelpdeskCommentModel comment)  onStartReply,required TResult Function()  onCancelReply,}) {final _that = this;
switch (_that) {
case OnLoadDetail():
return onLoadDetail(_that.ticketId);case OnSendMessage():
return onSendMessage(_that.message);case OnDeleteMessage():
return onDeleteMessage(_that.messageId);case OnUpdateTicket():
return onUpdateTicket(_that.title,_that.description,_that.clientNote,_that.project);case OnDeleteTicket():
return onDeleteTicket();case OnStartReply():
return onStartReply(_that.comment);case OnCancelReply():
return onCancelReply();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int ticketId)?  onLoadDetail,TResult? Function( String message)?  onSendMessage,TResult? Function( int messageId)?  onDeleteMessage,TResult? Function( String title,  String description,  String? clientNote,  ProjectModel? project)?  onUpdateTicket,TResult? Function()?  onDeleteTicket,TResult? Function( HelpdeskCommentModel comment)?  onStartReply,TResult? Function()?  onCancelReply,}) {final _that = this;
switch (_that) {
case OnLoadDetail() when onLoadDetail != null:
return onLoadDetail(_that.ticketId);case OnSendMessage() when onSendMessage != null:
return onSendMessage(_that.message);case OnDeleteMessage() when onDeleteMessage != null:
return onDeleteMessage(_that.messageId);case OnUpdateTicket() when onUpdateTicket != null:
return onUpdateTicket(_that.title,_that.description,_that.clientNote,_that.project);case OnDeleteTicket() when onDeleteTicket != null:
return onDeleteTicket();case OnStartReply() when onStartReply != null:
return onStartReply(_that.comment);case OnCancelReply() when onCancelReply != null:
return onCancelReply();case _:
  return null;

}
}

}

/// @nodoc


class OnLoadDetail with DiagnosticableTreeMixin implements TicketDetailEvent {
  const OnLoadDetail({required this.ticketId});
  

 final  int ticketId;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnLoadDetailCopyWith<OnLoadDetail> get copyWith => _$OnLoadDetailCopyWithImpl<OnLoadDetail>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketDetailEvent.onLoadDetail'))
    ..add(DiagnosticsProperty('ticketId', ticketId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLoadDetail&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId));
}


@override
int get hashCode => Object.hash(runtimeType,ticketId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class OnSendMessage with DiagnosticableTreeMixin implements TicketDetailEvent {
  const OnSendMessage({required this.message});
  

 final  String message;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSendMessageCopyWith<OnSendMessage> get copyWith => _$OnSendMessageCopyWithImpl<OnSendMessage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketDetailEvent.onSendMessage'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSendMessage&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class OnDeleteMessage with DiagnosticableTreeMixin implements TicketDetailEvent {
  const OnDeleteMessage({required this.messageId});
  

 final  int messageId;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnDeleteMessageCopyWith<OnDeleteMessage> get copyWith => _$OnDeleteMessageCopyWithImpl<OnDeleteMessage>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketDetailEvent.onDeleteMessage'))
    ..add(DiagnosticsProperty('messageId', messageId));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnDeleteMessage&&(identical(other.messageId, messageId) || other.messageId == messageId));
}


@override
int get hashCode => Object.hash(runtimeType,messageId);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class OnUpdateTicket with DiagnosticableTreeMixin implements TicketDetailEvent {
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
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketDetailEvent.onUpdateTicket'))
    ..add(DiagnosticsProperty('title', title))..add(DiagnosticsProperty('description', description))..add(DiagnosticsProperty('clientNote', clientNote))..add(DiagnosticsProperty('project', project));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnUpdateTicket&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.clientNote, clientNote) || other.clientNote == clientNote)&&(identical(other.project, project) || other.project == project));
}


@override
int get hashCode => Object.hash(runtimeType,title,description,clientNote,project);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class OnDeleteTicket with DiagnosticableTreeMixin implements TicketDetailEvent {
  const OnDeleteTicket();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketDetailEvent.onDeleteTicket'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnDeleteTicket);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TicketDetailEvent.onDeleteTicket()';
}


}




/// @nodoc


class OnStartReply with DiagnosticableTreeMixin implements TicketDetailEvent {
  const OnStartReply({required this.comment});
  

 final  HelpdeskCommentModel comment;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnStartReplyCopyWith<OnStartReply> get copyWith => _$OnStartReplyCopyWithImpl<OnStartReply>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketDetailEvent.onStartReply'))
    ..add(DiagnosticsProperty('comment', comment));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnStartReply&&(identical(other.comment, comment) || other.comment == comment));
}


@override
int get hashCode => Object.hash(runtimeType,comment);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TicketDetailEvent.onStartReply(comment: $comment)';
}


}

/// @nodoc
abstract mixin class $OnStartReplyCopyWith<$Res> implements $TicketDetailEventCopyWith<$Res> {
  factory $OnStartReplyCopyWith(OnStartReply value, $Res Function(OnStartReply) _then) = _$OnStartReplyCopyWithImpl;
@useResult
$Res call({
 HelpdeskCommentModel comment
});




}
/// @nodoc
class _$OnStartReplyCopyWithImpl<$Res>
    implements $OnStartReplyCopyWith<$Res> {
  _$OnStartReplyCopyWithImpl(this._self, this._then);

  final OnStartReply _self;
  final $Res Function(OnStartReply) _then;

/// Create a copy of TicketDetailEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? comment = null,}) {
  return _then(OnStartReply(
comment: null == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as HelpdeskCommentModel,
  ));
}


}

/// @nodoc


class OnCancelReply with DiagnosticableTreeMixin implements TicketDetailEvent {
  const OnCancelReply();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketDetailEvent.onCancelReply'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnCancelReply);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TicketDetailEvent.onCancelReply()';
}


}




/// @nodoc
mixin _$TicketDetailState implements DiagnosticableTreeMixin {

 CommonScreenState get loadingState; HelpdeskTicketDetailModel? get detail; List<HelpdeskCommentModel> get comments; bool get isSendingComment; bool get isDeleting; bool get isDeleted;/// Comment the user has tapped "Reply" on. When non-null the
/// message input shows a reply banner and the send handler prefixes
/// the message with the replied-to user's name.
 HelpdeskCommentModel? get replyingTo;
/// Create a copy of TicketDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketDetailStateCopyWith<TicketDetailState> get copyWith => _$TicketDetailStateCopyWithImpl<TicketDetailState>(this as TicketDetailState, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketDetailState'))
    ..add(DiagnosticsProperty('loadingState', loadingState))..add(DiagnosticsProperty('detail', detail))..add(DiagnosticsProperty('comments', comments))..add(DiagnosticsProperty('isSendingComment', isSendingComment))..add(DiagnosticsProperty('isDeleting', isDeleting))..add(DiagnosticsProperty('isDeleted', isDeleted))..add(DiagnosticsProperty('replyingTo', replyingTo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketDetailState&&(identical(other.loadingState, loadingState) || other.loadingState == loadingState)&&(identical(other.detail, detail) || other.detail == detail)&&const DeepCollectionEquality().equals(other.comments, comments)&&(identical(other.isSendingComment, isSendingComment) || other.isSendingComment == isSendingComment)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.replyingTo, replyingTo) || other.replyingTo == replyingTo));
}


@override
int get hashCode => Object.hash(runtimeType,loadingState,detail,const DeepCollectionEquality().hash(comments),isSendingComment,isDeleting,isDeleted,replyingTo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TicketDetailState(loadingState: $loadingState, detail: $detail, comments: $comments, isSendingComment: $isSendingComment, isDeleting: $isDeleting, isDeleted: $isDeleted, replyingTo: $replyingTo)';
}


}

/// @nodoc
abstract mixin class $TicketDetailStateCopyWith<$Res>  {
  factory $TicketDetailStateCopyWith(TicketDetailState value, $Res Function(TicketDetailState) _then) = _$TicketDetailStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState loadingState, HelpdeskTicketDetailModel? detail, List<HelpdeskCommentModel> comments, bool isSendingComment, bool isDeleting, bool isDeleted, HelpdeskCommentModel? replyingTo
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
@pragma('vm:prefer-inline') @override $Res call({Object? loadingState = null,Object? detail = freezed,Object? comments = null,Object? isSendingComment = null,Object? isDeleting = null,Object? isDeleted = null,Object? replyingTo = freezed,}) {
  return _then(_self.copyWith(
loadingState: null == loadingState ? _self.loadingState : loadingState // ignore: cast_nullable_to_non_nullable
as CommonScreenState,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as HelpdeskTicketDetailModel?,comments: null == comments ? _self.comments : comments // ignore: cast_nullable_to_non_nullable
as List<HelpdeskCommentModel>,isSendingComment: null == isSendingComment ? _self.isSendingComment : isSendingComment // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,replyingTo: freezed == replyingTo ? _self.replyingTo : replyingTo // ignore: cast_nullable_to_non_nullable
as HelpdeskCommentModel?,
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState loadingState,  HelpdeskTicketDetailModel? detail,  List<HelpdeskCommentModel> comments,  bool isSendingComment,  bool isDeleting,  bool isDeleted,  HelpdeskCommentModel? replyingTo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketDetailState() when $default != null:
return $default(_that.loadingState,_that.detail,_that.comments,_that.isSendingComment,_that.isDeleting,_that.isDeleted,_that.replyingTo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState loadingState,  HelpdeskTicketDetailModel? detail,  List<HelpdeskCommentModel> comments,  bool isSendingComment,  bool isDeleting,  bool isDeleted,  HelpdeskCommentModel? replyingTo)  $default,) {final _that = this;
switch (_that) {
case _TicketDetailState():
return $default(_that.loadingState,_that.detail,_that.comments,_that.isSendingComment,_that.isDeleting,_that.isDeleted,_that.replyingTo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState loadingState,  HelpdeskTicketDetailModel? detail,  List<HelpdeskCommentModel> comments,  bool isSendingComment,  bool isDeleting,  bool isDeleted,  HelpdeskCommentModel? replyingTo)?  $default,) {final _that = this;
switch (_that) {
case _TicketDetailState() when $default != null:
return $default(_that.loadingState,_that.detail,_that.comments,_that.isSendingComment,_that.isDeleting,_that.isDeleted,_that.replyingTo);case _:
  return null;

}
}

}

/// @nodoc


class _TicketDetailState with DiagnosticableTreeMixin implements TicketDetailState {
  const _TicketDetailState({required this.loadingState, required this.detail, required final  List<HelpdeskCommentModel> comments, required this.isSendingComment, required this.isDeleting, required this.isDeleted, required this.replyingTo}): _comments = comments;
  

@override final  CommonScreenState loadingState;
@override final  HelpdeskTicketDetailModel? detail;
 final  List<HelpdeskCommentModel> _comments;
@override List<HelpdeskCommentModel> get comments {
  if (_comments is EqualUnmodifiableListView) return _comments;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_comments);
}

@override final  bool isSendingComment;
@override final  bool isDeleting;
@override final  bool isDeleted;
/// Comment the user has tapped "Reply" on. When non-null the
/// message input shows a reply banner and the send handler prefixes
/// the message with the replied-to user's name.
@override final  HelpdeskCommentModel? replyingTo;

/// Create a copy of TicketDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketDetailStateCopyWith<_TicketDetailState> get copyWith => __$TicketDetailStateCopyWithImpl<_TicketDetailState>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'TicketDetailState'))
    ..add(DiagnosticsProperty('loadingState', loadingState))..add(DiagnosticsProperty('detail', detail))..add(DiagnosticsProperty('comments', comments))..add(DiagnosticsProperty('isSendingComment', isSendingComment))..add(DiagnosticsProperty('isDeleting', isDeleting))..add(DiagnosticsProperty('isDeleted', isDeleted))..add(DiagnosticsProperty('replyingTo', replyingTo));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketDetailState&&(identical(other.loadingState, loadingState) || other.loadingState == loadingState)&&(identical(other.detail, detail) || other.detail == detail)&&const DeepCollectionEquality().equals(other._comments, _comments)&&(identical(other.isSendingComment, isSendingComment) || other.isSendingComment == isSendingComment)&&(identical(other.isDeleting, isDeleting) || other.isDeleting == isDeleting)&&(identical(other.isDeleted, isDeleted) || other.isDeleted == isDeleted)&&(identical(other.replyingTo, replyingTo) || other.replyingTo == replyingTo));
}


@override
int get hashCode => Object.hash(runtimeType,loadingState,detail,const DeepCollectionEquality().hash(_comments),isSendingComment,isDeleting,isDeleted,replyingTo);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'TicketDetailState(loadingState: $loadingState, detail: $detail, comments: $comments, isSendingComment: $isSendingComment, isDeleting: $isDeleting, isDeleted: $isDeleted, replyingTo: $replyingTo)';
}


}

/// @nodoc
abstract mixin class _$TicketDetailStateCopyWith<$Res> implements $TicketDetailStateCopyWith<$Res> {
  factory _$TicketDetailStateCopyWith(_TicketDetailState value, $Res Function(_TicketDetailState) _then) = __$TicketDetailStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState loadingState, HelpdeskTicketDetailModel? detail, List<HelpdeskCommentModel> comments, bool isSendingComment, bool isDeleting, bool isDeleted, HelpdeskCommentModel? replyingTo
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
@override @pragma('vm:prefer-inline') $Res call({Object? loadingState = null,Object? detail = freezed,Object? comments = null,Object? isSendingComment = null,Object? isDeleting = null,Object? isDeleted = null,Object? replyingTo = freezed,}) {
  return _then(_TicketDetailState(
loadingState: null == loadingState ? _self.loadingState : loadingState // ignore: cast_nullable_to_non_nullable
as CommonScreenState,detail: freezed == detail ? _self.detail : detail // ignore: cast_nullable_to_non_nullable
as HelpdeskTicketDetailModel?,comments: null == comments ? _self._comments : comments // ignore: cast_nullable_to_non_nullable
as List<HelpdeskCommentModel>,isSendingComment: null == isSendingComment ? _self.isSendingComment : isSendingComment // ignore: cast_nullable_to_non_nullable
as bool,isDeleting: null == isDeleting ? _self.isDeleting : isDeleting // ignore: cast_nullable_to_non_nullable
as bool,isDeleted: null == isDeleted ? _self.isDeleted : isDeleted // ignore: cast_nullable_to_non_nullable
as bool,replyingTo: freezed == replyingTo ? _self.replyingTo : replyingTo // ignore: cast_nullable_to_non_nullable
as HelpdeskCommentModel?,
  ));
}


}

// dart format on
