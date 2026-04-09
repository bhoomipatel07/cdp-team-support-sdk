// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ticket_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TicketEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketEvent()';
}


}

/// @nodoc
class $TicketEventCopyWith<$Res>  {
$TicketEventCopyWith(TicketEvent _, $Res Function(TicketEvent) __);
}


/// Adds pattern-matching-related methods to [TicketEvent].
extension TicketEventPatterns on TicketEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( OnLoadTickets value)?  onLoadTickets,TResult Function( OnLoadMoreTickets value)?  onLoadMoreTickets,TResult Function( OnFilterByStatus value)?  onFilterByStatus,TResult Function( OnChangeTitle value)?  onChangeTitle,TResult Function( OnChangeDescription value)?  onChangeDescription,TResult Function( OnChangeNote value)?  onChangeNote,TResult Function( OnSubmitTicket value)?  onSubmitTicket,TResult Function( OnDeleteTicket value)?  onDeleteTicket,TResult Function( OnResetForm value)?  onResetForm,required TResult orElse(),}){
final _that = this;
switch (_that) {
case OnLoadTickets() when onLoadTickets != null:
return onLoadTickets(_that);case OnLoadMoreTickets() when onLoadMoreTickets != null:
return onLoadMoreTickets(_that);case OnFilterByStatus() when onFilterByStatus != null:
return onFilterByStatus(_that);case OnChangeTitle() when onChangeTitle != null:
return onChangeTitle(_that);case OnChangeDescription() when onChangeDescription != null:
return onChangeDescription(_that);case OnChangeNote() when onChangeNote != null:
return onChangeNote(_that);case OnSubmitTicket() when onSubmitTicket != null:
return onSubmitTicket(_that);case OnDeleteTicket() when onDeleteTicket != null:
return onDeleteTicket(_that);case OnResetForm() when onResetForm != null:
return onResetForm(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( OnLoadTickets value)  onLoadTickets,required TResult Function( OnLoadMoreTickets value)  onLoadMoreTickets,required TResult Function( OnFilterByStatus value)  onFilterByStatus,required TResult Function( OnChangeTitle value)  onChangeTitle,required TResult Function( OnChangeDescription value)  onChangeDescription,required TResult Function( OnChangeNote value)  onChangeNote,required TResult Function( OnSubmitTicket value)  onSubmitTicket,required TResult Function( OnDeleteTicket value)  onDeleteTicket,required TResult Function( OnResetForm value)  onResetForm,}){
final _that = this;
switch (_that) {
case OnLoadTickets():
return onLoadTickets(_that);case OnLoadMoreTickets():
return onLoadMoreTickets(_that);case OnFilterByStatus():
return onFilterByStatus(_that);case OnChangeTitle():
return onChangeTitle(_that);case OnChangeDescription():
return onChangeDescription(_that);case OnChangeNote():
return onChangeNote(_that);case OnSubmitTicket():
return onSubmitTicket(_that);case OnDeleteTicket():
return onDeleteTicket(_that);case OnResetForm():
return onResetForm(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( OnLoadTickets value)?  onLoadTickets,TResult? Function( OnLoadMoreTickets value)?  onLoadMoreTickets,TResult? Function( OnFilterByStatus value)?  onFilterByStatus,TResult? Function( OnChangeTitle value)?  onChangeTitle,TResult? Function( OnChangeDescription value)?  onChangeDescription,TResult? Function( OnChangeNote value)?  onChangeNote,TResult? Function( OnSubmitTicket value)?  onSubmitTicket,TResult? Function( OnDeleteTicket value)?  onDeleteTicket,TResult? Function( OnResetForm value)?  onResetForm,}){
final _that = this;
switch (_that) {
case OnLoadTickets() when onLoadTickets != null:
return onLoadTickets(_that);case OnLoadMoreTickets() when onLoadMoreTickets != null:
return onLoadMoreTickets(_that);case OnFilterByStatus() when onFilterByStatus != null:
return onFilterByStatus(_that);case OnChangeTitle() when onChangeTitle != null:
return onChangeTitle(_that);case OnChangeDescription() when onChangeDescription != null:
return onChangeDescription(_that);case OnChangeNote() when onChangeNote != null:
return onChangeNote(_that);case OnSubmitTicket() when onSubmitTicket != null:
return onSubmitTicket(_that);case OnDeleteTicket() when onDeleteTicket != null:
return onDeleteTicket(_that);case OnResetForm() when onResetForm != null:
return onResetForm(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onLoadTickets,TResult Function()?  onLoadMoreTickets,TResult Function( HelpdeskTicketStatusModel? status)?  onFilterByStatus,TResult Function( String title)?  onChangeTitle,TResult Function( String description)?  onChangeDescription,TResult Function( String note)?  onChangeNote,TResult Function( int? helpdeskTicketId,  List<String> attachmentPaths)?  onSubmitTicket,TResult Function( int ticketId)?  onDeleteTicket,TResult Function()?  onResetForm,required TResult orElse(),}) {final _that = this;
switch (_that) {
case OnLoadTickets() when onLoadTickets != null:
return onLoadTickets();case OnLoadMoreTickets() when onLoadMoreTickets != null:
return onLoadMoreTickets();case OnFilterByStatus() when onFilterByStatus != null:
return onFilterByStatus(_that.status);case OnChangeTitle() when onChangeTitle != null:
return onChangeTitle(_that.title);case OnChangeDescription() when onChangeDescription != null:
return onChangeDescription(_that.description);case OnChangeNote() when onChangeNote != null:
return onChangeNote(_that.note);case OnSubmitTicket() when onSubmitTicket != null:
return onSubmitTicket(_that.helpdeskTicketId,_that.attachmentPaths);case OnDeleteTicket() when onDeleteTicket != null:
return onDeleteTicket(_that.ticketId);case OnResetForm() when onResetForm != null:
return onResetForm();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onLoadTickets,required TResult Function()  onLoadMoreTickets,required TResult Function( HelpdeskTicketStatusModel? status)  onFilterByStatus,required TResult Function( String title)  onChangeTitle,required TResult Function( String description)  onChangeDescription,required TResult Function( String note)  onChangeNote,required TResult Function( int? helpdeskTicketId,  List<String> attachmentPaths)  onSubmitTicket,required TResult Function( int ticketId)  onDeleteTicket,required TResult Function()  onResetForm,}) {final _that = this;
switch (_that) {
case OnLoadTickets():
return onLoadTickets();case OnLoadMoreTickets():
return onLoadMoreTickets();case OnFilterByStatus():
return onFilterByStatus(_that.status);case OnChangeTitle():
return onChangeTitle(_that.title);case OnChangeDescription():
return onChangeDescription(_that.description);case OnChangeNote():
return onChangeNote(_that.note);case OnSubmitTicket():
return onSubmitTicket(_that.helpdeskTicketId,_that.attachmentPaths);case OnDeleteTicket():
return onDeleteTicket(_that.ticketId);case OnResetForm():
return onResetForm();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onLoadTickets,TResult? Function()?  onLoadMoreTickets,TResult? Function( HelpdeskTicketStatusModel? status)?  onFilterByStatus,TResult? Function( String title)?  onChangeTitle,TResult? Function( String description)?  onChangeDescription,TResult? Function( String note)?  onChangeNote,TResult? Function( int? helpdeskTicketId,  List<String> attachmentPaths)?  onSubmitTicket,TResult? Function( int ticketId)?  onDeleteTicket,TResult? Function()?  onResetForm,}) {final _that = this;
switch (_that) {
case OnLoadTickets() when onLoadTickets != null:
return onLoadTickets();case OnLoadMoreTickets() when onLoadMoreTickets != null:
return onLoadMoreTickets();case OnFilterByStatus() when onFilterByStatus != null:
return onFilterByStatus(_that.status);case OnChangeTitle() when onChangeTitle != null:
return onChangeTitle(_that.title);case OnChangeDescription() when onChangeDescription != null:
return onChangeDescription(_that.description);case OnChangeNote() when onChangeNote != null:
return onChangeNote(_that.note);case OnSubmitTicket() when onSubmitTicket != null:
return onSubmitTicket(_that.helpdeskTicketId,_that.attachmentPaths);case OnDeleteTicket() when onDeleteTicket != null:
return onDeleteTicket(_that.ticketId);case OnResetForm() when onResetForm != null:
return onResetForm();case _:
  return null;

}
}

}

/// @nodoc


class OnLoadTickets implements TicketEvent {
  const OnLoadTickets();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLoadTickets);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketEvent.onLoadTickets()';
}


}




/// @nodoc


class OnLoadMoreTickets implements TicketEvent {
  const OnLoadMoreTickets();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnLoadMoreTickets);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketEvent.onLoadMoreTickets()';
}


}




/// @nodoc


class OnFilterByStatus implements TicketEvent {
  const OnFilterByStatus({required this.status});
  

 final  HelpdeskTicketStatusModel? status;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnFilterByStatusCopyWith<OnFilterByStatus> get copyWith => _$OnFilterByStatusCopyWithImpl<OnFilterByStatus>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnFilterByStatus&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'TicketEvent.onFilterByStatus(status: $status)';
}


}

/// @nodoc
abstract mixin class $OnFilterByStatusCopyWith<$Res> implements $TicketEventCopyWith<$Res> {
  factory $OnFilterByStatusCopyWith(OnFilterByStatus value, $Res Function(OnFilterByStatus) _then) = _$OnFilterByStatusCopyWithImpl;
@useResult
$Res call({
 HelpdeskTicketStatusModel? status
});




}
/// @nodoc
class _$OnFilterByStatusCopyWithImpl<$Res>
    implements $OnFilterByStatusCopyWith<$Res> {
  _$OnFilterByStatusCopyWithImpl(this._self, this._then);

  final OnFilterByStatus _self;
  final $Res Function(OnFilterByStatus) _then;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(OnFilterByStatus(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as HelpdeskTicketStatusModel?,
  ));
}


}

/// @nodoc


class OnChangeTitle implements TicketEvent {
  const OnChangeTitle({required this.title});
  

 final  String title;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnChangeTitleCopyWith<OnChangeTitle> get copyWith => _$OnChangeTitleCopyWithImpl<OnChangeTitle>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnChangeTitle&&(identical(other.title, title) || other.title == title));
}


@override
int get hashCode => Object.hash(runtimeType,title);

@override
String toString() {
  return 'TicketEvent.onChangeTitle(title: $title)';
}


}

/// @nodoc
abstract mixin class $OnChangeTitleCopyWith<$Res> implements $TicketEventCopyWith<$Res> {
  factory $OnChangeTitleCopyWith(OnChangeTitle value, $Res Function(OnChangeTitle) _then) = _$OnChangeTitleCopyWithImpl;
@useResult
$Res call({
 String title
});




}
/// @nodoc
class _$OnChangeTitleCopyWithImpl<$Res>
    implements $OnChangeTitleCopyWith<$Res> {
  _$OnChangeTitleCopyWithImpl(this._self, this._then);

  final OnChangeTitle _self;
  final $Res Function(OnChangeTitle) _then;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? title = null,}) {
  return _then(OnChangeTitle(
title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnChangeDescription implements TicketEvent {
  const OnChangeDescription({required this.description});
  

 final  String description;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnChangeDescriptionCopyWith<OnChangeDescription> get copyWith => _$OnChangeDescriptionCopyWithImpl<OnChangeDescription>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnChangeDescription&&(identical(other.description, description) || other.description == description));
}


@override
int get hashCode => Object.hash(runtimeType,description);

@override
String toString() {
  return 'TicketEvent.onChangeDescription(description: $description)';
}


}

/// @nodoc
abstract mixin class $OnChangeDescriptionCopyWith<$Res> implements $TicketEventCopyWith<$Res> {
  factory $OnChangeDescriptionCopyWith(OnChangeDescription value, $Res Function(OnChangeDescription) _then) = _$OnChangeDescriptionCopyWithImpl;
@useResult
$Res call({
 String description
});




}
/// @nodoc
class _$OnChangeDescriptionCopyWithImpl<$Res>
    implements $OnChangeDescriptionCopyWith<$Res> {
  _$OnChangeDescriptionCopyWithImpl(this._self, this._then);

  final OnChangeDescription _self;
  final $Res Function(OnChangeDescription) _then;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? description = null,}) {
  return _then(OnChangeDescription(
description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnChangeNote implements TicketEvent {
  const OnChangeNote({required this.note});
  

 final  String note;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnChangeNoteCopyWith<OnChangeNote> get copyWith => _$OnChangeNoteCopyWithImpl<OnChangeNote>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnChangeNote&&(identical(other.note, note) || other.note == note));
}


@override
int get hashCode => Object.hash(runtimeType,note);

@override
String toString() {
  return 'TicketEvent.onChangeNote(note: $note)';
}


}

/// @nodoc
abstract mixin class $OnChangeNoteCopyWith<$Res> implements $TicketEventCopyWith<$Res> {
  factory $OnChangeNoteCopyWith(OnChangeNote value, $Res Function(OnChangeNote) _then) = _$OnChangeNoteCopyWithImpl;
@useResult
$Res call({
 String note
});




}
/// @nodoc
class _$OnChangeNoteCopyWithImpl<$Res>
    implements $OnChangeNoteCopyWith<$Res> {
  _$OnChangeNoteCopyWithImpl(this._self, this._then);

  final OnChangeNote _self;
  final $Res Function(OnChangeNote) _then;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? note = null,}) {
  return _then(OnChangeNote(
note: null == note ? _self.note : note // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class OnSubmitTicket implements TicketEvent {
  const OnSubmitTicket({this.helpdeskTicketId, final  List<String> attachmentPaths = const <String>[]}): _attachmentPaths = attachmentPaths;
  

/// Non-null when editing an existing ticket.
 final  int? helpdeskTicketId;
/// Absolute paths of any newly-picked files to upload after the
/// ticket is successfully created/updated.
 final  List<String> _attachmentPaths;
/// Absolute paths of any newly-picked files to upload after the
/// ticket is successfully created/updated.
@JsonKey() List<String> get attachmentPaths {
  if (_attachmentPaths is EqualUnmodifiableListView) return _attachmentPaths;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_attachmentPaths);
}


/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnSubmitTicketCopyWith<OnSubmitTicket> get copyWith => _$OnSubmitTicketCopyWithImpl<OnSubmitTicket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnSubmitTicket&&(identical(other.helpdeskTicketId, helpdeskTicketId) || other.helpdeskTicketId == helpdeskTicketId)&&const DeepCollectionEquality().equals(other._attachmentPaths, _attachmentPaths));
}


@override
int get hashCode => Object.hash(runtimeType,helpdeskTicketId,const DeepCollectionEquality().hash(_attachmentPaths));

@override
String toString() {
  return 'TicketEvent.onSubmitTicket(helpdeskTicketId: $helpdeskTicketId, attachmentPaths: $attachmentPaths)';
}


}

/// @nodoc
abstract mixin class $OnSubmitTicketCopyWith<$Res> implements $TicketEventCopyWith<$Res> {
  factory $OnSubmitTicketCopyWith(OnSubmitTicket value, $Res Function(OnSubmitTicket) _then) = _$OnSubmitTicketCopyWithImpl;
@useResult
$Res call({
 int? helpdeskTicketId, List<String> attachmentPaths
});




}
/// @nodoc
class _$OnSubmitTicketCopyWithImpl<$Res>
    implements $OnSubmitTicketCopyWith<$Res> {
  _$OnSubmitTicketCopyWithImpl(this._self, this._then);

  final OnSubmitTicket _self;
  final $Res Function(OnSubmitTicket) _then;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? helpdeskTicketId = freezed,Object? attachmentPaths = null,}) {
  return _then(OnSubmitTicket(
helpdeskTicketId: freezed == helpdeskTicketId ? _self.helpdeskTicketId : helpdeskTicketId // ignore: cast_nullable_to_non_nullable
as int?,attachmentPaths: null == attachmentPaths ? _self._attachmentPaths : attachmentPaths // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

/// @nodoc


class OnDeleteTicket implements TicketEvent {
  const OnDeleteTicket({required this.ticketId});
  

 final  int ticketId;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OnDeleteTicketCopyWith<OnDeleteTicket> get copyWith => _$OnDeleteTicketCopyWithImpl<OnDeleteTicket>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnDeleteTicket&&(identical(other.ticketId, ticketId) || other.ticketId == ticketId));
}


@override
int get hashCode => Object.hash(runtimeType,ticketId);

@override
String toString() {
  return 'TicketEvent.onDeleteTicket(ticketId: $ticketId)';
}


}

/// @nodoc
abstract mixin class $OnDeleteTicketCopyWith<$Res> implements $TicketEventCopyWith<$Res> {
  factory $OnDeleteTicketCopyWith(OnDeleteTicket value, $Res Function(OnDeleteTicket) _then) = _$OnDeleteTicketCopyWithImpl;
@useResult
$Res call({
 int ticketId
});




}
/// @nodoc
class _$OnDeleteTicketCopyWithImpl<$Res>
    implements $OnDeleteTicketCopyWith<$Res> {
  _$OnDeleteTicketCopyWithImpl(this._self, this._then);

  final OnDeleteTicket _self;
  final $Res Function(OnDeleteTicket) _then;

/// Create a copy of TicketEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? ticketId = null,}) {
  return _then(OnDeleteTicket(
ticketId: null == ticketId ? _self.ticketId : ticketId // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class OnResetForm implements TicketEvent {
  const OnResetForm();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OnResetForm);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TicketEvent.onResetForm()';
}


}




/// @nodoc
mixin _$TicketState {

 CommonScreenState get loadingState; List<TicketModel> get allTickets; List<TicketModel> get filteredTickets; HelpdeskTicketStatusModel? get selectedFilter; int get totalCount; int get openCount; int get inProgressCount; int get resolvedCount; int get closedCount; String get title; String get description; String get clientNote;/// Dynamic ticket statuses fetched from the API. Used for filter
/// dropdowns / create forms — NOT for the dashboard count cards.
 List<HelpdeskTicketStatusModel> get statuses; bool get isTicketCreated; bool get isUploadingAttachments;// ── Pagination (GetMyHelpdeskTickets) ──────────────────────────
 int get currentPage; int get pageSize; int get totalTickets; bool get hasMore; bool get isLoadingMore;/// True while the list-only refresh (filter change / inline reload)
/// is running — drives a small spinner inside the list without
/// replacing the whole dashboard with the shimmer.
 bool get isRefreshingList;
/// Create a copy of TicketState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TicketStateCopyWith<TicketState> get copyWith => _$TicketStateCopyWithImpl<TicketState>(this as TicketState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TicketState&&(identical(other.loadingState, loadingState) || other.loadingState == loadingState)&&const DeepCollectionEquality().equals(other.allTickets, allTickets)&&const DeepCollectionEquality().equals(other.filteredTickets, filteredTickets)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.openCount, openCount) || other.openCount == openCount)&&(identical(other.inProgressCount, inProgressCount) || other.inProgressCount == inProgressCount)&&(identical(other.resolvedCount, resolvedCount) || other.resolvedCount == resolvedCount)&&(identical(other.closedCount, closedCount) || other.closedCount == closedCount)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.clientNote, clientNote) || other.clientNote == clientNote)&&const DeepCollectionEquality().equals(other.statuses, statuses)&&(identical(other.isTicketCreated, isTicketCreated) || other.isTicketCreated == isTicketCreated)&&(identical(other.isUploadingAttachments, isUploadingAttachments) || other.isUploadingAttachments == isUploadingAttachments)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalTickets, totalTickets) || other.totalTickets == totalTickets)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshingList, isRefreshingList) || other.isRefreshingList == isRefreshingList));
}


@override
int get hashCode => Object.hashAll([runtimeType,loadingState,const DeepCollectionEquality().hash(allTickets),const DeepCollectionEquality().hash(filteredTickets),selectedFilter,totalCount,openCount,inProgressCount,resolvedCount,closedCount,title,description,clientNote,const DeepCollectionEquality().hash(statuses),isTicketCreated,isUploadingAttachments,currentPage,pageSize,totalTickets,hasMore,isLoadingMore,isRefreshingList]);

@override
String toString() {
  return 'TicketState(loadingState: $loadingState, allTickets: $allTickets, filteredTickets: $filteredTickets, selectedFilter: $selectedFilter, totalCount: $totalCount, openCount: $openCount, inProgressCount: $inProgressCount, resolvedCount: $resolvedCount, closedCount: $closedCount, title: $title, description: $description, clientNote: $clientNote, statuses: $statuses, isTicketCreated: $isTicketCreated, isUploadingAttachments: $isUploadingAttachments, currentPage: $currentPage, pageSize: $pageSize, totalTickets: $totalTickets, hasMore: $hasMore, isLoadingMore: $isLoadingMore, isRefreshingList: $isRefreshingList)';
}


}

/// @nodoc
abstract mixin class $TicketStateCopyWith<$Res>  {
  factory $TicketStateCopyWith(TicketState value, $Res Function(TicketState) _then) = _$TicketStateCopyWithImpl;
@useResult
$Res call({
 CommonScreenState loadingState, List<TicketModel> allTickets, List<TicketModel> filteredTickets, HelpdeskTicketStatusModel? selectedFilter, int totalCount, int openCount, int inProgressCount, int resolvedCount, int closedCount, String title, String description, String clientNote, List<HelpdeskTicketStatusModel> statuses, bool isTicketCreated, bool isUploadingAttachments, int currentPage, int pageSize, int totalTickets, bool hasMore, bool isLoadingMore, bool isRefreshingList
});




}
/// @nodoc
class _$TicketStateCopyWithImpl<$Res>
    implements $TicketStateCopyWith<$Res> {
  _$TicketStateCopyWithImpl(this._self, this._then);

  final TicketState _self;
  final $Res Function(TicketState) _then;

/// Create a copy of TicketState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? loadingState = null,Object? allTickets = null,Object? filteredTickets = null,Object? selectedFilter = freezed,Object? totalCount = null,Object? openCount = null,Object? inProgressCount = null,Object? resolvedCount = null,Object? closedCount = null,Object? title = null,Object? description = null,Object? clientNote = null,Object? statuses = null,Object? isTicketCreated = null,Object? isUploadingAttachments = null,Object? currentPage = null,Object? pageSize = null,Object? totalTickets = null,Object? hasMore = null,Object? isLoadingMore = null,Object? isRefreshingList = null,}) {
  return _then(_self.copyWith(
loadingState: null == loadingState ? _self.loadingState : loadingState // ignore: cast_nullable_to_non_nullable
as CommonScreenState,allTickets: null == allTickets ? _self.allTickets : allTickets // ignore: cast_nullable_to_non_nullable
as List<TicketModel>,filteredTickets: null == filteredTickets ? _self.filteredTickets : filteredTickets // ignore: cast_nullable_to_non_nullable
as List<TicketModel>,selectedFilter: freezed == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as HelpdeskTicketStatusModel?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,openCount: null == openCount ? _self.openCount : openCount // ignore: cast_nullable_to_non_nullable
as int,inProgressCount: null == inProgressCount ? _self.inProgressCount : inProgressCount // ignore: cast_nullable_to_non_nullable
as int,resolvedCount: null == resolvedCount ? _self.resolvedCount : resolvedCount // ignore: cast_nullable_to_non_nullable
as int,closedCount: null == closedCount ? _self.closedCount : closedCount // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,clientNote: null == clientNote ? _self.clientNote : clientNote // ignore: cast_nullable_to_non_nullable
as String,statuses: null == statuses ? _self.statuses : statuses // ignore: cast_nullable_to_non_nullable
as List<HelpdeskTicketStatusModel>,isTicketCreated: null == isTicketCreated ? _self.isTicketCreated : isTicketCreated // ignore: cast_nullable_to_non_nullable
as bool,isUploadingAttachments: null == isUploadingAttachments ? _self.isUploadingAttachments : isUploadingAttachments // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalTickets: null == totalTickets ? _self.totalTickets : totalTickets // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshingList: null == isRefreshingList ? _self.isRefreshingList : isRefreshingList // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [TicketState].
extension TicketStatePatterns on TicketState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TicketState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TicketState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TicketState value)  $default,){
final _that = this;
switch (_that) {
case _TicketState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TicketState value)?  $default,){
final _that = this;
switch (_that) {
case _TicketState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( CommonScreenState loadingState,  List<TicketModel> allTickets,  List<TicketModel> filteredTickets,  HelpdeskTicketStatusModel? selectedFilter,  int totalCount,  int openCount,  int inProgressCount,  int resolvedCount,  int closedCount,  String title,  String description,  String clientNote,  List<HelpdeskTicketStatusModel> statuses,  bool isTicketCreated,  bool isUploadingAttachments,  int currentPage,  int pageSize,  int totalTickets,  bool hasMore,  bool isLoadingMore,  bool isRefreshingList)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TicketState() when $default != null:
return $default(_that.loadingState,_that.allTickets,_that.filteredTickets,_that.selectedFilter,_that.totalCount,_that.openCount,_that.inProgressCount,_that.resolvedCount,_that.closedCount,_that.title,_that.description,_that.clientNote,_that.statuses,_that.isTicketCreated,_that.isUploadingAttachments,_that.currentPage,_that.pageSize,_that.totalTickets,_that.hasMore,_that.isLoadingMore,_that.isRefreshingList);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( CommonScreenState loadingState,  List<TicketModel> allTickets,  List<TicketModel> filteredTickets,  HelpdeskTicketStatusModel? selectedFilter,  int totalCount,  int openCount,  int inProgressCount,  int resolvedCount,  int closedCount,  String title,  String description,  String clientNote,  List<HelpdeskTicketStatusModel> statuses,  bool isTicketCreated,  bool isUploadingAttachments,  int currentPage,  int pageSize,  int totalTickets,  bool hasMore,  bool isLoadingMore,  bool isRefreshingList)  $default,) {final _that = this;
switch (_that) {
case _TicketState():
return $default(_that.loadingState,_that.allTickets,_that.filteredTickets,_that.selectedFilter,_that.totalCount,_that.openCount,_that.inProgressCount,_that.resolvedCount,_that.closedCount,_that.title,_that.description,_that.clientNote,_that.statuses,_that.isTicketCreated,_that.isUploadingAttachments,_that.currentPage,_that.pageSize,_that.totalTickets,_that.hasMore,_that.isLoadingMore,_that.isRefreshingList);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( CommonScreenState loadingState,  List<TicketModel> allTickets,  List<TicketModel> filteredTickets,  HelpdeskTicketStatusModel? selectedFilter,  int totalCount,  int openCount,  int inProgressCount,  int resolvedCount,  int closedCount,  String title,  String description,  String clientNote,  List<HelpdeskTicketStatusModel> statuses,  bool isTicketCreated,  bool isUploadingAttachments,  int currentPage,  int pageSize,  int totalTickets,  bool hasMore,  bool isLoadingMore,  bool isRefreshingList)?  $default,) {final _that = this;
switch (_that) {
case _TicketState() when $default != null:
return $default(_that.loadingState,_that.allTickets,_that.filteredTickets,_that.selectedFilter,_that.totalCount,_that.openCount,_that.inProgressCount,_that.resolvedCount,_that.closedCount,_that.title,_that.description,_that.clientNote,_that.statuses,_that.isTicketCreated,_that.isUploadingAttachments,_that.currentPage,_that.pageSize,_that.totalTickets,_that.hasMore,_that.isLoadingMore,_that.isRefreshingList);case _:
  return null;

}
}

}

/// @nodoc


class _TicketState implements TicketState {
  const _TicketState({required this.loadingState, required final  List<TicketModel> allTickets, required final  List<TicketModel> filteredTickets, required this.selectedFilter, required this.totalCount, required this.openCount, required this.inProgressCount, required this.resolvedCount, required this.closedCount, required this.title, required this.description, required this.clientNote, required final  List<HelpdeskTicketStatusModel> statuses, required this.isTicketCreated, required this.isUploadingAttachments, required this.currentPage, required this.pageSize, required this.totalTickets, required this.hasMore, required this.isLoadingMore, required this.isRefreshingList}): _allTickets = allTickets,_filteredTickets = filteredTickets,_statuses = statuses;
  

@override final  CommonScreenState loadingState;
 final  List<TicketModel> _allTickets;
@override List<TicketModel> get allTickets {
  if (_allTickets is EqualUnmodifiableListView) return _allTickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allTickets);
}

 final  List<TicketModel> _filteredTickets;
@override List<TicketModel> get filteredTickets {
  if (_filteredTickets is EqualUnmodifiableListView) return _filteredTickets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_filteredTickets);
}

@override final  HelpdeskTicketStatusModel? selectedFilter;
@override final  int totalCount;
@override final  int openCount;
@override final  int inProgressCount;
@override final  int resolvedCount;
@override final  int closedCount;
@override final  String title;
@override final  String description;
@override final  String clientNote;
/// Dynamic ticket statuses fetched from the API. Used for filter
/// dropdowns / create forms — NOT for the dashboard count cards.
 final  List<HelpdeskTicketStatusModel> _statuses;
/// Dynamic ticket statuses fetched from the API. Used for filter
/// dropdowns / create forms — NOT for the dashboard count cards.
@override List<HelpdeskTicketStatusModel> get statuses {
  if (_statuses is EqualUnmodifiableListView) return _statuses;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_statuses);
}

@override final  bool isTicketCreated;
@override final  bool isUploadingAttachments;
// ── Pagination (GetMyHelpdeskTickets) ──────────────────────────
@override final  int currentPage;
@override final  int pageSize;
@override final  int totalTickets;
@override final  bool hasMore;
@override final  bool isLoadingMore;
/// True while the list-only refresh (filter change / inline reload)
/// is running — drives a small spinner inside the list without
/// replacing the whole dashboard with the shimmer.
@override final  bool isRefreshingList;

/// Create a copy of TicketState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TicketStateCopyWith<_TicketState> get copyWith => __$TicketStateCopyWithImpl<_TicketState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TicketState&&(identical(other.loadingState, loadingState) || other.loadingState == loadingState)&&const DeepCollectionEquality().equals(other._allTickets, _allTickets)&&const DeepCollectionEquality().equals(other._filteredTickets, _filteredTickets)&&(identical(other.selectedFilter, selectedFilter) || other.selectedFilter == selectedFilter)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.openCount, openCount) || other.openCount == openCount)&&(identical(other.inProgressCount, inProgressCount) || other.inProgressCount == inProgressCount)&&(identical(other.resolvedCount, resolvedCount) || other.resolvedCount == resolvedCount)&&(identical(other.closedCount, closedCount) || other.closedCount == closedCount)&&(identical(other.title, title) || other.title == title)&&(identical(other.description, description) || other.description == description)&&(identical(other.clientNote, clientNote) || other.clientNote == clientNote)&&const DeepCollectionEquality().equals(other._statuses, _statuses)&&(identical(other.isTicketCreated, isTicketCreated) || other.isTicketCreated == isTicketCreated)&&(identical(other.isUploadingAttachments, isUploadingAttachments) || other.isUploadingAttachments == isUploadingAttachments)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalTickets, totalTickets) || other.totalTickets == totalTickets)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.isRefreshingList, isRefreshingList) || other.isRefreshingList == isRefreshingList));
}


@override
int get hashCode => Object.hashAll([runtimeType,loadingState,const DeepCollectionEquality().hash(_allTickets),const DeepCollectionEquality().hash(_filteredTickets),selectedFilter,totalCount,openCount,inProgressCount,resolvedCount,closedCount,title,description,clientNote,const DeepCollectionEquality().hash(_statuses),isTicketCreated,isUploadingAttachments,currentPage,pageSize,totalTickets,hasMore,isLoadingMore,isRefreshingList]);

@override
String toString() {
  return 'TicketState(loadingState: $loadingState, allTickets: $allTickets, filteredTickets: $filteredTickets, selectedFilter: $selectedFilter, totalCount: $totalCount, openCount: $openCount, inProgressCount: $inProgressCount, resolvedCount: $resolvedCount, closedCount: $closedCount, title: $title, description: $description, clientNote: $clientNote, statuses: $statuses, isTicketCreated: $isTicketCreated, isUploadingAttachments: $isUploadingAttachments, currentPage: $currentPage, pageSize: $pageSize, totalTickets: $totalTickets, hasMore: $hasMore, isLoadingMore: $isLoadingMore, isRefreshingList: $isRefreshingList)';
}


}

/// @nodoc
abstract mixin class _$TicketStateCopyWith<$Res> implements $TicketStateCopyWith<$Res> {
  factory _$TicketStateCopyWith(_TicketState value, $Res Function(_TicketState) _then) = __$TicketStateCopyWithImpl;
@override @useResult
$Res call({
 CommonScreenState loadingState, List<TicketModel> allTickets, List<TicketModel> filteredTickets, HelpdeskTicketStatusModel? selectedFilter, int totalCount, int openCount, int inProgressCount, int resolvedCount, int closedCount, String title, String description, String clientNote, List<HelpdeskTicketStatusModel> statuses, bool isTicketCreated, bool isUploadingAttachments, int currentPage, int pageSize, int totalTickets, bool hasMore, bool isLoadingMore, bool isRefreshingList
});




}
/// @nodoc
class __$TicketStateCopyWithImpl<$Res>
    implements _$TicketStateCopyWith<$Res> {
  __$TicketStateCopyWithImpl(this._self, this._then);

  final _TicketState _self;
  final $Res Function(_TicketState) _then;

/// Create a copy of TicketState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? loadingState = null,Object? allTickets = null,Object? filteredTickets = null,Object? selectedFilter = freezed,Object? totalCount = null,Object? openCount = null,Object? inProgressCount = null,Object? resolvedCount = null,Object? closedCount = null,Object? title = null,Object? description = null,Object? clientNote = null,Object? statuses = null,Object? isTicketCreated = null,Object? isUploadingAttachments = null,Object? currentPage = null,Object? pageSize = null,Object? totalTickets = null,Object? hasMore = null,Object? isLoadingMore = null,Object? isRefreshingList = null,}) {
  return _then(_TicketState(
loadingState: null == loadingState ? _self.loadingState : loadingState // ignore: cast_nullable_to_non_nullable
as CommonScreenState,allTickets: null == allTickets ? _self._allTickets : allTickets // ignore: cast_nullable_to_non_nullable
as List<TicketModel>,filteredTickets: null == filteredTickets ? _self._filteredTickets : filteredTickets // ignore: cast_nullable_to_non_nullable
as List<TicketModel>,selectedFilter: freezed == selectedFilter ? _self.selectedFilter : selectedFilter // ignore: cast_nullable_to_non_nullable
as HelpdeskTicketStatusModel?,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,openCount: null == openCount ? _self.openCount : openCount // ignore: cast_nullable_to_non_nullable
as int,inProgressCount: null == inProgressCount ? _self.inProgressCount : inProgressCount // ignore: cast_nullable_to_non_nullable
as int,resolvedCount: null == resolvedCount ? _self.resolvedCount : resolvedCount // ignore: cast_nullable_to_non_nullable
as int,closedCount: null == closedCount ? _self.closedCount : closedCount // ignore: cast_nullable_to_non_nullable
as int,title: null == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,clientNote: null == clientNote ? _self.clientNote : clientNote // ignore: cast_nullable_to_non_nullable
as String,statuses: null == statuses ? _self._statuses : statuses // ignore: cast_nullable_to_non_nullable
as List<HelpdeskTicketStatusModel>,isTicketCreated: null == isTicketCreated ? _self.isTicketCreated : isTicketCreated // ignore: cast_nullable_to_non_nullable
as bool,isUploadingAttachments: null == isUploadingAttachments ? _self.isUploadingAttachments : isUploadingAttachments // ignore: cast_nullable_to_non_nullable
as bool,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalTickets: null == totalTickets ? _self.totalTickets : totalTickets // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,isRefreshingList: null == isRefreshingList ? _self.isRefreshingList : isRefreshingList // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
