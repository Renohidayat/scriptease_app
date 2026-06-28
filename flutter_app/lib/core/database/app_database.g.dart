// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $DocumentsTable extends Documents
    with TableInfo<$DocumentsTable, Document> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 500,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _contentDeltaMeta = const VerificationMeta(
    'contentDelta',
  );
  @override
  late final GeneratedColumn<String> contentDelta = GeneratedColumn<String>(
    'content_delta',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _contentPlainTextMeta = const VerificationMeta(
    'contentPlainText',
  );
  @override
  late final GeneratedColumn<String> contentPlainText = GeneratedColumn<String>(
    'content_plain_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _wordCountMeta = const VerificationMeta(
    'wordCount',
  );
  @override
  late final GeneratedColumn<int> wordCount = GeneratedColumn<int>(
    'word_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _citationStyleMeta = const VerificationMeta(
    'citationStyle',
  );
  @override
  late final GeneratedColumn<String> citationStyle = GeneratedColumn<String>(
    'citation_style',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('APA'),
  );
  static const VerificationMeta _academicFormatMeta = const VerificationMeta(
    'academicFormat',
  );
  @override
  late final GeneratedColumn<String> academicFormat = GeneratedColumn<String>(
    'academic_format',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('SKRIPSI'),
  );
  static const VerificationMeta _isDeletedMeta = const VerificationMeta(
    'isDeleted',
  );
  @override
  late final GeneratedColumn<bool> isDeleted = GeneratedColumn<bool>(
    'is_deleted',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_deleted" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _lastOpenedAtMeta = const VerificationMeta(
    'lastOpenedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastOpenedAt = GeneratedColumn<DateTime>(
    'last_opened_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    title,
    filePath,
    contentDelta,
    contentPlainText,
    wordCount,
    citationStyle,
    academicFormat,
    isDeleted,
    createdAt,
    updatedAt,
    lastOpenedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'documents';
  @override
  VerificationContext validateIntegrity(
    Insertable<Document> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    }
    if (data.containsKey('content_delta')) {
      context.handle(
        _contentDeltaMeta,
        contentDelta.isAcceptableOrUnknown(
          data['content_delta']!,
          _contentDeltaMeta,
        ),
      );
    }
    if (data.containsKey('content_plain_text')) {
      context.handle(
        _contentPlainTextMeta,
        contentPlainText.isAcceptableOrUnknown(
          data['content_plain_text']!,
          _contentPlainTextMeta,
        ),
      );
    }
    if (data.containsKey('word_count')) {
      context.handle(
        _wordCountMeta,
        wordCount.isAcceptableOrUnknown(data['word_count']!, _wordCountMeta),
      );
    }
    if (data.containsKey('citation_style')) {
      context.handle(
        _citationStyleMeta,
        citationStyle.isAcceptableOrUnknown(
          data['citation_style']!,
          _citationStyleMeta,
        ),
      );
    }
    if (data.containsKey('academic_format')) {
      context.handle(
        _academicFormatMeta,
        academicFormat.isAcceptableOrUnknown(
          data['academic_format']!,
          _academicFormatMeta,
        ),
      );
    }
    if (data.containsKey('is_deleted')) {
      context.handle(
        _isDeletedMeta,
        isDeleted.isAcceptableOrUnknown(data['is_deleted']!, _isDeletedMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    if (data.containsKey('last_opened_at')) {
      context.handle(
        _lastOpenedAtMeta,
        lastOpenedAt.isAcceptableOrUnknown(
          data['last_opened_at']!,
          _lastOpenedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Document map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Document(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      ),
      contentDelta: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_delta'],
      )!,
      contentPlainText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content_plain_text'],
      )!,
      wordCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}word_count'],
      )!,
      citationStyle: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}citation_style'],
      )!,
      academicFormat: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}academic_format'],
      )!,
      isDeleted: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_deleted'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
      lastOpenedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_opened_at'],
      )!,
    );
  }

  @override
  $DocumentsTable createAlias(String alias) {
    return $DocumentsTable(attachedDatabase, alias);
  }
}

class Document extends DataClass implements Insertable<Document> {
  final int id;
  final String title;
  final String? filePath;
  final String contentDelta;
  final String contentPlainText;
  final int wordCount;
  final String citationStyle;
  final String academicFormat;
  final bool isDeleted;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime lastOpenedAt;
  const Document({
    required this.id,
    required this.title,
    this.filePath,
    required this.contentDelta,
    required this.contentPlainText,
    required this.wordCount,
    required this.citationStyle,
    required this.academicFormat,
    required this.isDeleted,
    required this.createdAt,
    required this.updatedAt,
    required this.lastOpenedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['title'] = Variable<String>(title);
    if (!nullToAbsent || filePath != null) {
      map['file_path'] = Variable<String>(filePath);
    }
    map['content_delta'] = Variable<String>(contentDelta);
    map['content_plain_text'] = Variable<String>(contentPlainText);
    map['word_count'] = Variable<int>(wordCount);
    map['citation_style'] = Variable<String>(citationStyle);
    map['academic_format'] = Variable<String>(academicFormat);
    map['is_deleted'] = Variable<bool>(isDeleted);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    map['last_opened_at'] = Variable<DateTime>(lastOpenedAt);
    return map;
  }

  DocumentsCompanion toCompanion(bool nullToAbsent) {
    return DocumentsCompanion(
      id: Value(id),
      title: Value(title),
      filePath: filePath == null && nullToAbsent
          ? const Value.absent()
          : Value(filePath),
      contentDelta: Value(contentDelta),
      contentPlainText: Value(contentPlainText),
      wordCount: Value(wordCount),
      citationStyle: Value(citationStyle),
      academicFormat: Value(academicFormat),
      isDeleted: Value(isDeleted),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      lastOpenedAt: Value(lastOpenedAt),
    );
  }

  factory Document.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Document(
      id: serializer.fromJson<int>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      filePath: serializer.fromJson<String?>(json['filePath']),
      contentDelta: serializer.fromJson<String>(json['contentDelta']),
      contentPlainText: serializer.fromJson<String>(json['contentPlainText']),
      wordCount: serializer.fromJson<int>(json['wordCount']),
      citationStyle: serializer.fromJson<String>(json['citationStyle']),
      academicFormat: serializer.fromJson<String>(json['academicFormat']),
      isDeleted: serializer.fromJson<bool>(json['isDeleted']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      lastOpenedAt: serializer.fromJson<DateTime>(json['lastOpenedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'title': serializer.toJson<String>(title),
      'filePath': serializer.toJson<String?>(filePath),
      'contentDelta': serializer.toJson<String>(contentDelta),
      'contentPlainText': serializer.toJson<String>(contentPlainText),
      'wordCount': serializer.toJson<int>(wordCount),
      'citationStyle': serializer.toJson<String>(citationStyle),
      'academicFormat': serializer.toJson<String>(academicFormat),
      'isDeleted': serializer.toJson<bool>(isDeleted),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'lastOpenedAt': serializer.toJson<DateTime>(lastOpenedAt),
    };
  }

  Document copyWith({
    int? id,
    String? title,
    Value<String?> filePath = const Value.absent(),
    String? contentDelta,
    String? contentPlainText,
    int? wordCount,
    String? citationStyle,
    String? academicFormat,
    bool? isDeleted,
    DateTime? createdAt,
    DateTime? updatedAt,
    DateTime? lastOpenedAt,
  }) => Document(
    id: id ?? this.id,
    title: title ?? this.title,
    filePath: filePath.present ? filePath.value : this.filePath,
    contentDelta: contentDelta ?? this.contentDelta,
    contentPlainText: contentPlainText ?? this.contentPlainText,
    wordCount: wordCount ?? this.wordCount,
    citationStyle: citationStyle ?? this.citationStyle,
    academicFormat: academicFormat ?? this.academicFormat,
    isDeleted: isDeleted ?? this.isDeleted,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
    lastOpenedAt: lastOpenedAt ?? this.lastOpenedAt,
  );
  Document copyWithCompanion(DocumentsCompanion data) {
    return Document(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      contentDelta: data.contentDelta.present
          ? data.contentDelta.value
          : this.contentDelta,
      contentPlainText: data.contentPlainText.present
          ? data.contentPlainText.value
          : this.contentPlainText,
      wordCount: data.wordCount.present ? data.wordCount.value : this.wordCount,
      citationStyle: data.citationStyle.present
          ? data.citationStyle.value
          : this.citationStyle,
      academicFormat: data.academicFormat.present
          ? data.academicFormat.value
          : this.academicFormat,
      isDeleted: data.isDeleted.present ? data.isDeleted.value : this.isDeleted,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      lastOpenedAt: data.lastOpenedAt.present
          ? data.lastOpenedAt.value
          : this.lastOpenedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Document(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath, ')
          ..write('contentDelta: $contentDelta, ')
          ..write('contentPlainText: $contentPlainText, ')
          ..write('wordCount: $wordCount, ')
          ..write('citationStyle: $citationStyle, ')
          ..write('academicFormat: $academicFormat, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastOpenedAt: $lastOpenedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    title,
    filePath,
    contentDelta,
    contentPlainText,
    wordCount,
    citationStyle,
    academicFormat,
    isDeleted,
    createdAt,
    updatedAt,
    lastOpenedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Document &&
          other.id == this.id &&
          other.title == this.title &&
          other.filePath == this.filePath &&
          other.contentDelta == this.contentDelta &&
          other.contentPlainText == this.contentPlainText &&
          other.wordCount == this.wordCount &&
          other.citationStyle == this.citationStyle &&
          other.academicFormat == this.academicFormat &&
          other.isDeleted == this.isDeleted &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.lastOpenedAt == this.lastOpenedAt);
}

class DocumentsCompanion extends UpdateCompanion<Document> {
  final Value<int> id;
  final Value<String> title;
  final Value<String?> filePath;
  final Value<String> contentDelta;
  final Value<String> contentPlainText;
  final Value<int> wordCount;
  final Value<String> citationStyle;
  final Value<String> academicFormat;
  final Value<bool> isDeleted;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime> lastOpenedAt;
  const DocumentsCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.filePath = const Value.absent(),
    this.contentDelta = const Value.absent(),
    this.contentPlainText = const Value.absent(),
    this.wordCount = const Value.absent(),
    this.citationStyle = const Value.absent(),
    this.academicFormat = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastOpenedAt = const Value.absent(),
  });
  DocumentsCompanion.insert({
    this.id = const Value.absent(),
    required String title,
    this.filePath = const Value.absent(),
    this.contentDelta = const Value.absent(),
    this.contentPlainText = const Value.absent(),
    this.wordCount = const Value.absent(),
    this.citationStyle = const Value.absent(),
    this.academicFormat = const Value.absent(),
    this.isDeleted = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.lastOpenedAt = const Value.absent(),
  }) : title = Value(title);
  static Insertable<Document> custom({
    Expression<int>? id,
    Expression<String>? title,
    Expression<String>? filePath,
    Expression<String>? contentDelta,
    Expression<String>? contentPlainText,
    Expression<int>? wordCount,
    Expression<String>? citationStyle,
    Expression<String>? academicFormat,
    Expression<bool>? isDeleted,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? lastOpenedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (title != null) 'title': title,
      if (filePath != null) 'file_path': filePath,
      if (contentDelta != null) 'content_delta': contentDelta,
      if (contentPlainText != null) 'content_plain_text': contentPlainText,
      if (wordCount != null) 'word_count': wordCount,
      if (citationStyle != null) 'citation_style': citationStyle,
      if (academicFormat != null) 'academic_format': academicFormat,
      if (isDeleted != null) 'is_deleted': isDeleted,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (lastOpenedAt != null) 'last_opened_at': lastOpenedAt,
    });
  }

  DocumentsCompanion copyWith({
    Value<int>? id,
    Value<String>? title,
    Value<String?>? filePath,
    Value<String>? contentDelta,
    Value<String>? contentPlainText,
    Value<int>? wordCount,
    Value<String>? citationStyle,
    Value<String>? academicFormat,
    Value<bool>? isDeleted,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
    Value<DateTime>? lastOpenedAt,
  }) {
    return DocumentsCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      filePath: filePath ?? this.filePath,
      contentDelta: contentDelta ?? this.contentDelta,
      contentPlainText: contentPlainText ?? this.contentPlainText,
      wordCount: wordCount ?? this.wordCount,
      citationStyle: citationStyle ?? this.citationStyle,
      academicFormat: academicFormat ?? this.academicFormat,
      isDeleted: isDeleted ?? this.isDeleted,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      lastOpenedAt: lastOpenedAt ?? this.lastOpenedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (contentDelta.present) {
      map['content_delta'] = Variable<String>(contentDelta.value);
    }
    if (contentPlainText.present) {
      map['content_plain_text'] = Variable<String>(contentPlainText.value);
    }
    if (wordCount.present) {
      map['word_count'] = Variable<int>(wordCount.value);
    }
    if (citationStyle.present) {
      map['citation_style'] = Variable<String>(citationStyle.value);
    }
    if (academicFormat.present) {
      map['academic_format'] = Variable<String>(academicFormat.value);
    }
    if (isDeleted.present) {
      map['is_deleted'] = Variable<bool>(isDeleted.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (lastOpenedAt.present) {
      map['last_opened_at'] = Variable<DateTime>(lastOpenedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentsCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('filePath: $filePath, ')
          ..write('contentDelta: $contentDelta, ')
          ..write('contentPlainText: $contentPlainText, ')
          ..write('wordCount: $wordCount, ')
          ..write('citationStyle: $citationStyle, ')
          ..write('academicFormat: $academicFormat, ')
          ..write('isDeleted: $isDeleted, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('lastOpenedAt: $lastOpenedAt')
          ..write(')'))
        .toString();
  }
}

class $ChatHistoryEntriesTable extends ChatHistoryEntries
    with TableInfo<$ChatHistoryEntriesTable, ChatHistoryEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChatHistoryEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<int> documentId = GeneratedColumn<int>(
    'document_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES documents (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _sessionIdMeta = const VerificationMeta(
    'sessionId',
  );
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
    'session_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'content',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _tokenCountInputMeta = const VerificationMeta(
    'tokenCountInput',
  );
  @override
  late final GeneratedColumn<int> tokenCountInput = GeneratedColumn<int>(
    'token_count_input',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _tokenCountOutputMeta = const VerificationMeta(
    'tokenCountOutput',
  );
  @override
  late final GeneratedColumn<int> tokenCountOutput = GeneratedColumn<int>(
    'token_count_output',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _llmProviderMeta = const VerificationMeta(
    'llmProvider',
  );
  @override
  late final GeneratedColumn<String> llmProvider = GeneratedColumn<String>(
    'llm_provider',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _llmModelMeta = const VerificationMeta(
    'llmModel',
  );
  @override
  late final GeneratedColumn<String> llmModel = GeneratedColumn<String>(
    'llm_model',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _latencyMsMeta = const VerificationMeta(
    'latencyMs',
  );
  @override
  late final GeneratedColumn<int> latencyMs = GeneratedColumn<int>(
    'latency_ms',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    documentId,
    sessionId,
    role,
    content,
    tokenCountInput,
    tokenCountOutput,
    llmProvider,
    llmModel,
    latencyMs,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'chat_history_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ChatHistoryEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('document_id')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['document_id']!, _documentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_documentIdMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(
        _sessionIdMeta,
        sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('content')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['content']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('token_count_input')) {
      context.handle(
        _tokenCountInputMeta,
        tokenCountInput.isAcceptableOrUnknown(
          data['token_count_input']!,
          _tokenCountInputMeta,
        ),
      );
    }
    if (data.containsKey('token_count_output')) {
      context.handle(
        _tokenCountOutputMeta,
        tokenCountOutput.isAcceptableOrUnknown(
          data['token_count_output']!,
          _tokenCountOutputMeta,
        ),
      );
    }
    if (data.containsKey('llm_provider')) {
      context.handle(
        _llmProviderMeta,
        llmProvider.isAcceptableOrUnknown(
          data['llm_provider']!,
          _llmProviderMeta,
        ),
      );
    }
    if (data.containsKey('llm_model')) {
      context.handle(
        _llmModelMeta,
        llmModel.isAcceptableOrUnknown(data['llm_model']!, _llmModelMeta),
      );
    }
    if (data.containsKey('latency_ms')) {
      context.handle(
        _latencyMsMeta,
        latencyMs.isAcceptableOrUnknown(data['latency_ms']!, _latencyMsMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ChatHistoryEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ChatHistoryEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}document_id'],
      )!,
      sessionId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}session_id'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      content: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}content'],
      )!,
      tokenCountInput: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}token_count_input'],
      )!,
      tokenCountOutput: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}token_count_output'],
      )!,
      llmProvider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}llm_provider'],
      ),
      llmModel: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}llm_model'],
      ),
      latencyMs: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}latency_ms'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ChatHistoryEntriesTable createAlias(String alias) {
    return $ChatHistoryEntriesTable(attachedDatabase, alias);
  }
}

class ChatHistoryEntry extends DataClass
    implements Insertable<ChatHistoryEntry> {
  final int id;
  final int documentId;
  final String sessionId;
  final String role;
  final String content;
  final int tokenCountInput;
  final int tokenCountOutput;
  final String? llmProvider;
  final String? llmModel;
  final int? latencyMs;
  final DateTime createdAt;
  const ChatHistoryEntry({
    required this.id,
    required this.documentId,
    required this.sessionId,
    required this.role,
    required this.content,
    required this.tokenCountInput,
    required this.tokenCountOutput,
    this.llmProvider,
    this.llmModel,
    this.latencyMs,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['document_id'] = Variable<int>(documentId);
    map['session_id'] = Variable<String>(sessionId);
    map['role'] = Variable<String>(role);
    map['content'] = Variable<String>(content);
    map['token_count_input'] = Variable<int>(tokenCountInput);
    map['token_count_output'] = Variable<int>(tokenCountOutput);
    if (!nullToAbsent || llmProvider != null) {
      map['llm_provider'] = Variable<String>(llmProvider);
    }
    if (!nullToAbsent || llmModel != null) {
      map['llm_model'] = Variable<String>(llmModel);
    }
    if (!nullToAbsent || latencyMs != null) {
      map['latency_ms'] = Variable<int>(latencyMs);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ChatHistoryEntriesCompanion toCompanion(bool nullToAbsent) {
    return ChatHistoryEntriesCompanion(
      id: Value(id),
      documentId: Value(documentId),
      sessionId: Value(sessionId),
      role: Value(role),
      content: Value(content),
      tokenCountInput: Value(tokenCountInput),
      tokenCountOutput: Value(tokenCountOutput),
      llmProvider: llmProvider == null && nullToAbsent
          ? const Value.absent()
          : Value(llmProvider),
      llmModel: llmModel == null && nullToAbsent
          ? const Value.absent()
          : Value(llmModel),
      latencyMs: latencyMs == null && nullToAbsent
          ? const Value.absent()
          : Value(latencyMs),
      createdAt: Value(createdAt),
    );
  }

  factory ChatHistoryEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ChatHistoryEntry(
      id: serializer.fromJson<int>(json['id']),
      documentId: serializer.fromJson<int>(json['documentId']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      role: serializer.fromJson<String>(json['role']),
      content: serializer.fromJson<String>(json['content']),
      tokenCountInput: serializer.fromJson<int>(json['tokenCountInput']),
      tokenCountOutput: serializer.fromJson<int>(json['tokenCountOutput']),
      llmProvider: serializer.fromJson<String?>(json['llmProvider']),
      llmModel: serializer.fromJson<String?>(json['llmModel']),
      latencyMs: serializer.fromJson<int?>(json['latencyMs']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'documentId': serializer.toJson<int>(documentId),
      'sessionId': serializer.toJson<String>(sessionId),
      'role': serializer.toJson<String>(role),
      'content': serializer.toJson<String>(content),
      'tokenCountInput': serializer.toJson<int>(tokenCountInput),
      'tokenCountOutput': serializer.toJson<int>(tokenCountOutput),
      'llmProvider': serializer.toJson<String?>(llmProvider),
      'llmModel': serializer.toJson<String?>(llmModel),
      'latencyMs': serializer.toJson<int?>(latencyMs),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  ChatHistoryEntry copyWith({
    int? id,
    int? documentId,
    String? sessionId,
    String? role,
    String? content,
    int? tokenCountInput,
    int? tokenCountOutput,
    Value<String?> llmProvider = const Value.absent(),
    Value<String?> llmModel = const Value.absent(),
    Value<int?> latencyMs = const Value.absent(),
    DateTime? createdAt,
  }) => ChatHistoryEntry(
    id: id ?? this.id,
    documentId: documentId ?? this.documentId,
    sessionId: sessionId ?? this.sessionId,
    role: role ?? this.role,
    content: content ?? this.content,
    tokenCountInput: tokenCountInput ?? this.tokenCountInput,
    tokenCountOutput: tokenCountOutput ?? this.tokenCountOutput,
    llmProvider: llmProvider.present ? llmProvider.value : this.llmProvider,
    llmModel: llmModel.present ? llmModel.value : this.llmModel,
    latencyMs: latencyMs.present ? latencyMs.value : this.latencyMs,
    createdAt: createdAt ?? this.createdAt,
  );
  ChatHistoryEntry copyWithCompanion(ChatHistoryEntriesCompanion data) {
    return ChatHistoryEntry(
      id: data.id.present ? data.id.value : this.id,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      role: data.role.present ? data.role.value : this.role,
      content: data.content.present ? data.content.value : this.content,
      tokenCountInput: data.tokenCountInput.present
          ? data.tokenCountInput.value
          : this.tokenCountInput,
      tokenCountOutput: data.tokenCountOutput.present
          ? data.tokenCountOutput.value
          : this.tokenCountOutput,
      llmProvider: data.llmProvider.present
          ? data.llmProvider.value
          : this.llmProvider,
      llmModel: data.llmModel.present ? data.llmModel.value : this.llmModel,
      latencyMs: data.latencyMs.present ? data.latencyMs.value : this.latencyMs,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ChatHistoryEntry(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('sessionId: $sessionId, ')
          ..write('role: $role, ')
          ..write('content: $content, ')
          ..write('tokenCountInput: $tokenCountInput, ')
          ..write('tokenCountOutput: $tokenCountOutput, ')
          ..write('llmProvider: $llmProvider, ')
          ..write('llmModel: $llmModel, ')
          ..write('latencyMs: $latencyMs, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    documentId,
    sessionId,
    role,
    content,
    tokenCountInput,
    tokenCountOutput,
    llmProvider,
    llmModel,
    latencyMs,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ChatHistoryEntry &&
          other.id == this.id &&
          other.documentId == this.documentId &&
          other.sessionId == this.sessionId &&
          other.role == this.role &&
          other.content == this.content &&
          other.tokenCountInput == this.tokenCountInput &&
          other.tokenCountOutput == this.tokenCountOutput &&
          other.llmProvider == this.llmProvider &&
          other.llmModel == this.llmModel &&
          other.latencyMs == this.latencyMs &&
          other.createdAt == this.createdAt);
}

class ChatHistoryEntriesCompanion extends UpdateCompanion<ChatHistoryEntry> {
  final Value<int> id;
  final Value<int> documentId;
  final Value<String> sessionId;
  final Value<String> role;
  final Value<String> content;
  final Value<int> tokenCountInput;
  final Value<int> tokenCountOutput;
  final Value<String?> llmProvider;
  final Value<String?> llmModel;
  final Value<int?> latencyMs;
  final Value<DateTime> createdAt;
  const ChatHistoryEntriesCompanion({
    this.id = const Value.absent(),
    this.documentId = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.role = const Value.absent(),
    this.content = const Value.absent(),
    this.tokenCountInput = const Value.absent(),
    this.tokenCountOutput = const Value.absent(),
    this.llmProvider = const Value.absent(),
    this.llmModel = const Value.absent(),
    this.latencyMs = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ChatHistoryEntriesCompanion.insert({
    this.id = const Value.absent(),
    required int documentId,
    required String sessionId,
    required String role,
    required String content,
    this.tokenCountInput = const Value.absent(),
    this.tokenCountOutput = const Value.absent(),
    this.llmProvider = const Value.absent(),
    this.llmModel = const Value.absent(),
    this.latencyMs = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : documentId = Value(documentId),
       sessionId = Value(sessionId),
       role = Value(role),
       content = Value(content);
  static Insertable<ChatHistoryEntry> custom({
    Expression<int>? id,
    Expression<int>? documentId,
    Expression<String>? sessionId,
    Expression<String>? role,
    Expression<String>? content,
    Expression<int>? tokenCountInput,
    Expression<int>? tokenCountOutput,
    Expression<String>? llmProvider,
    Expression<String>? llmModel,
    Expression<int>? latencyMs,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (documentId != null) 'document_id': documentId,
      if (sessionId != null) 'session_id': sessionId,
      if (role != null) 'role': role,
      if (content != null) 'content': content,
      if (tokenCountInput != null) 'token_count_input': tokenCountInput,
      if (tokenCountOutput != null) 'token_count_output': tokenCountOutput,
      if (llmProvider != null) 'llm_provider': llmProvider,
      if (llmModel != null) 'llm_model': llmModel,
      if (latencyMs != null) 'latency_ms': latencyMs,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ChatHistoryEntriesCompanion copyWith({
    Value<int>? id,
    Value<int>? documentId,
    Value<String>? sessionId,
    Value<String>? role,
    Value<String>? content,
    Value<int>? tokenCountInput,
    Value<int>? tokenCountOutput,
    Value<String?>? llmProvider,
    Value<String?>? llmModel,
    Value<int?>? latencyMs,
    Value<DateTime>? createdAt,
  }) {
    return ChatHistoryEntriesCompanion(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      sessionId: sessionId ?? this.sessionId,
      role: role ?? this.role,
      content: content ?? this.content,
      tokenCountInput: tokenCountInput ?? this.tokenCountInput,
      tokenCountOutput: tokenCountOutput ?? this.tokenCountOutput,
      llmProvider: llmProvider ?? this.llmProvider,
      llmModel: llmModel ?? this.llmModel,
      latencyMs: latencyMs ?? this.latencyMs,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (documentId.present) {
      map['document_id'] = Variable<int>(documentId.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
    }
    if (tokenCountInput.present) {
      map['token_count_input'] = Variable<int>(tokenCountInput.value);
    }
    if (tokenCountOutput.present) {
      map['token_count_output'] = Variable<int>(tokenCountOutput.value);
    }
    if (llmProvider.present) {
      map['llm_provider'] = Variable<String>(llmProvider.value);
    }
    if (llmModel.present) {
      map['llm_model'] = Variable<String>(llmModel.value);
    }
    if (latencyMs.present) {
      map['latency_ms'] = Variable<int>(latencyMs.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChatHistoryEntriesCompanion(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('sessionId: $sessionId, ')
          ..write('role: $role, ')
          ..write('content: $content, ')
          ..write('tokenCountInput: $tokenCountInput, ')
          ..write('tokenCountOutput: $tokenCountOutput, ')
          ..write('llmProvider: $llmProvider, ')
          ..write('llmModel: $llmModel, ')
          ..write('latencyMs: $latencyMs, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $PromptTemplatesTable extends PromptTemplates
    with TableInfo<$PromptTemplatesTable, PromptTemplate> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PromptTemplatesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 200,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryMeta = const VerificationMeta(
    'category',
  );
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
    'category',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _templateTextMeta = const VerificationMeta(
    'templateText',
  );
  @override
  late final GeneratedColumn<String> templateText = GeneratedColumn<String>(
    'template_text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _variablesJsonMeta = const VerificationMeta(
    'variablesJson',
  );
  @override
  late final GeneratedColumn<String> variablesJson = GeneratedColumn<String>(
    'variables_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('[]'),
  );
  static const VerificationMeta _usageCountMeta = const VerificationMeta(
    'usageCount',
  );
  @override
  late final GeneratedColumn<int> usageCount = GeneratedColumn<int>(
    'usage_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _isSystemMeta = const VerificationMeta(
    'isSystem',
  );
  @override
  late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>(
    'is_system',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_system" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    category,
    templateText,
    variablesJson,
    usageCount,
    isSystem,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'prompt_templates';
  @override
  VerificationContext validateIntegrity(
    Insertable<PromptTemplate> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(
        _categoryMeta,
        category.isAcceptableOrUnknown(data['category']!, _categoryMeta),
      );
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('template_text')) {
      context.handle(
        _templateTextMeta,
        templateText.isAcceptableOrUnknown(
          data['template_text']!,
          _templateTextMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_templateTextMeta);
    }
    if (data.containsKey('variables_json')) {
      context.handle(
        _variablesJsonMeta,
        variablesJson.isAcceptableOrUnknown(
          data['variables_json']!,
          _variablesJsonMeta,
        ),
      );
    }
    if (data.containsKey('usage_count')) {
      context.handle(
        _usageCountMeta,
        usageCount.isAcceptableOrUnknown(data['usage_count']!, _usageCountMeta),
      );
    }
    if (data.containsKey('is_system')) {
      context.handle(
        _isSystemMeta,
        isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PromptTemplate map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PromptTemplate(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      category: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category'],
      )!,
      templateText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}template_text'],
      )!,
      variablesJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variables_json'],
      )!,
      usageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}usage_count'],
      )!,
      isSystem: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_system'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $PromptTemplatesTable createAlias(String alias) {
    return $PromptTemplatesTable(attachedDatabase, alias);
  }
}

class PromptTemplate extends DataClass implements Insertable<PromptTemplate> {
  final int id;
  final String name;
  final String category;
  final String templateText;
  final String variablesJson;
  final int usageCount;
  final bool isSystem;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PromptTemplate({
    required this.id,
    required this.name,
    required this.category,
    required this.templateText,
    required this.variablesJson,
    required this.usageCount,
    required this.isSystem,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['template_text'] = Variable<String>(templateText);
    map['variables_json'] = Variable<String>(variablesJson);
    map['usage_count'] = Variable<int>(usageCount);
    map['is_system'] = Variable<bool>(isSystem);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PromptTemplatesCompanion toCompanion(bool nullToAbsent) {
    return PromptTemplatesCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      templateText: Value(templateText),
      variablesJson: Value(variablesJson),
      usageCount: Value(usageCount),
      isSystem: Value(isSystem),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PromptTemplate.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PromptTemplate(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      templateText: serializer.fromJson<String>(json['templateText']),
      variablesJson: serializer.fromJson<String>(json['variablesJson']),
      usageCount: serializer.fromJson<int>(json['usageCount']),
      isSystem: serializer.fromJson<bool>(json['isSystem']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'templateText': serializer.toJson<String>(templateText),
      'variablesJson': serializer.toJson<String>(variablesJson),
      'usageCount': serializer.toJson<int>(usageCount),
      'isSystem': serializer.toJson<bool>(isSystem),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PromptTemplate copyWith({
    int? id,
    String? name,
    String? category,
    String? templateText,
    String? variablesJson,
    int? usageCount,
    bool? isSystem,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => PromptTemplate(
    id: id ?? this.id,
    name: name ?? this.name,
    category: category ?? this.category,
    templateText: templateText ?? this.templateText,
    variablesJson: variablesJson ?? this.variablesJson,
    usageCount: usageCount ?? this.usageCount,
    isSystem: isSystem ?? this.isSystem,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  PromptTemplate copyWithCompanion(PromptTemplatesCompanion data) {
    return PromptTemplate(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      templateText: data.templateText.present
          ? data.templateText.value
          : this.templateText,
      variablesJson: data.variablesJson.present
          ? data.variablesJson.value
          : this.variablesJson,
      usageCount: data.usageCount.present
          ? data.usageCount.value
          : this.usageCount,
      isSystem: data.isSystem.present ? data.isSystem.value : this.isSystem,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PromptTemplate(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('templateText: $templateText, ')
          ..write('variablesJson: $variablesJson, ')
          ..write('usageCount: $usageCount, ')
          ..write('isSystem: $isSystem, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    category,
    templateText,
    variablesJson,
    usageCount,
    isSystem,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PromptTemplate &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.templateText == this.templateText &&
          other.variablesJson == this.variablesJson &&
          other.usageCount == this.usageCount &&
          other.isSystem == this.isSystem &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PromptTemplatesCompanion extends UpdateCompanion<PromptTemplate> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String> templateText;
  final Value<String> variablesJson;
  final Value<int> usageCount;
  final Value<bool> isSystem;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const PromptTemplatesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.templateText = const Value.absent(),
    this.variablesJson = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  PromptTemplatesCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String category,
    required String templateText,
    this.variablesJson = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : name = Value(name),
       category = Value(category),
       templateText = Value(templateText);
  static Insertable<PromptTemplate> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? templateText,
    Expression<String>? variablesJson,
    Expression<int>? usageCount,
    Expression<bool>? isSystem,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (templateText != null) 'template_text': templateText,
      if (variablesJson != null) 'variables_json': variablesJson,
      if (usageCount != null) 'usage_count': usageCount,
      if (isSystem != null) 'is_system': isSystem,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  PromptTemplatesCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? category,
    Value<String>? templateText,
    Value<String>? variablesJson,
    Value<int>? usageCount,
    Value<bool>? isSystem,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return PromptTemplatesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      templateText: templateText ?? this.templateText,
      variablesJson: variablesJson ?? this.variablesJson,
      usageCount: usageCount ?? this.usageCount,
      isSystem: isSystem ?? this.isSystem,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (templateText.present) {
      map['template_text'] = Variable<String>(templateText.value);
    }
    if (variablesJson.present) {
      map['variables_json'] = Variable<String>(variablesJson.value);
    }
    if (usageCount.present) {
      map['usage_count'] = Variable<int>(usageCount.value);
    }
    if (isSystem.present) {
      map['is_system'] = Variable<bool>(isSystem.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PromptTemplatesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('templateText: $templateText, ')
          ..write('variablesJson: $variablesJson, ')
          ..write('usageCount: $usageCount, ')
          ..write('isSystem: $isSystem, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $CitationCacheTable extends CitationCache
    with TableInfo<$CitationCacheTable, CitationCacheData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CitationCacheTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sourceMeta = const VerificationMeta('source');
  @override
  late final GeneratedColumn<String> source = GeneratedColumn<String>(
    'source',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _externalIdMeta = const VerificationMeta(
    'externalId',
  );
  @override
  late final GeneratedColumn<String> externalId = GeneratedColumn<String>(
    'external_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _citeKeyMeta = const VerificationMeta(
    'citeKey',
  );
  @override
  late final GeneratedColumn<String> citeKey = GeneratedColumn<String>(
    'cite_key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _authorsJsonMeta = const VerificationMeta(
    'authorsJson',
  );
  @override
  late final GeneratedColumn<String> authorsJson = GeneratedColumn<String>(
    'authors_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<int> year = GeneratedColumn<int>(
    'year',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _journalMeta = const VerificationMeta(
    'journal',
  );
  @override
  late final GeneratedColumn<String> journal = GeneratedColumn<String>(
    'journal',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _volumeMeta = const VerificationMeta('volume');
  @override
  late final GeneratedColumn<String> volume = GeneratedColumn<String>(
    'volume',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _issueMeta = const VerificationMeta('issue');
  @override
  late final GeneratedColumn<String> issue = GeneratedColumn<String>(
    'issue',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _pagesMeta = const VerificationMeta('pages');
  @override
  late final GeneratedColumn<String> pages = GeneratedColumn<String>(
    'pages',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _doiMeta = const VerificationMeta('doi');
  @override
  late final GeneratedColumn<String> doi = GeneratedColumn<String>(
    'doi',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _urlMeta = const VerificationMeta('url');
  @override
  late final GeneratedColumn<String> url = GeneratedColumn<String>(
    'url',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _apaFormattedMeta = const VerificationMeta(
    'apaFormatted',
  );
  @override
  late final GeneratedColumn<String> apaFormatted = GeneratedColumn<String>(
    'apa_formatted',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _ieeeFormattedMeta = const VerificationMeta(
    'ieeeFormatted',
  );
  @override
  late final GeneratedColumn<String> ieeeFormatted = GeneratedColumn<String>(
    'ieee_formatted',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _chicagoFormattedMeta = const VerificationMeta(
    'chicagoFormatted',
  );
  @override
  late final GeneratedColumn<String> chicagoFormatted = GeneratedColumn<String>(
    'chicago_formatted',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _indonesiaFormattedMeta =
      const VerificationMeta('indonesiaFormatted');
  @override
  late final GeneratedColumn<String> indonesiaFormatted =
      GeneratedColumn<String>(
        'indonesia_formatted',
        aliasedName,
        true,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
      );
  static const VerificationMeta _rawJsonMeta = const VerificationMeta(
    'rawJson',
  );
  @override
  late final GeneratedColumn<String> rawJson = GeneratedColumn<String>(
    'raw_json',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _lastSyncedAtMeta = const VerificationMeta(
    'lastSyncedAt',
  );
  @override
  late final GeneratedColumn<DateTime> lastSyncedAt = GeneratedColumn<DateTime>(
    'last_synced_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    source,
    externalId,
    citeKey,
    title,
    authorsJson,
    year,
    journal,
    volume,
    issue,
    pages,
    doi,
    url,
    apaFormatted,
    ieeeFormatted,
    chicagoFormatted,
    indonesiaFormatted,
    rawJson,
    lastSyncedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'citation_cache';
  @override
  VerificationContext validateIntegrity(
    Insertable<CitationCacheData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('source')) {
      context.handle(
        _sourceMeta,
        source.isAcceptableOrUnknown(data['source']!, _sourceMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceMeta);
    }
    if (data.containsKey('external_id')) {
      context.handle(
        _externalIdMeta,
        externalId.isAcceptableOrUnknown(data['external_id']!, _externalIdMeta),
      );
    } else if (isInserting) {
      context.missing(_externalIdMeta);
    }
    if (data.containsKey('cite_key')) {
      context.handle(
        _citeKeyMeta,
        citeKey.isAcceptableOrUnknown(data['cite_key']!, _citeKeyMeta),
      );
    } else if (isInserting) {
      context.missing(_citeKeyMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('authors_json')) {
      context.handle(
        _authorsJsonMeta,
        authorsJson.isAcceptableOrUnknown(
          data['authors_json']!,
          _authorsJsonMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_authorsJsonMeta);
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('journal')) {
      context.handle(
        _journalMeta,
        journal.isAcceptableOrUnknown(data['journal']!, _journalMeta),
      );
    }
    if (data.containsKey('volume')) {
      context.handle(
        _volumeMeta,
        volume.isAcceptableOrUnknown(data['volume']!, _volumeMeta),
      );
    }
    if (data.containsKey('issue')) {
      context.handle(
        _issueMeta,
        issue.isAcceptableOrUnknown(data['issue']!, _issueMeta),
      );
    }
    if (data.containsKey('pages')) {
      context.handle(
        _pagesMeta,
        pages.isAcceptableOrUnknown(data['pages']!, _pagesMeta),
      );
    }
    if (data.containsKey('doi')) {
      context.handle(
        _doiMeta,
        doi.isAcceptableOrUnknown(data['doi']!, _doiMeta),
      );
    }
    if (data.containsKey('url')) {
      context.handle(
        _urlMeta,
        url.isAcceptableOrUnknown(data['url']!, _urlMeta),
      );
    }
    if (data.containsKey('apa_formatted')) {
      context.handle(
        _apaFormattedMeta,
        apaFormatted.isAcceptableOrUnknown(
          data['apa_formatted']!,
          _apaFormattedMeta,
        ),
      );
    }
    if (data.containsKey('ieee_formatted')) {
      context.handle(
        _ieeeFormattedMeta,
        ieeeFormatted.isAcceptableOrUnknown(
          data['ieee_formatted']!,
          _ieeeFormattedMeta,
        ),
      );
    }
    if (data.containsKey('chicago_formatted')) {
      context.handle(
        _chicagoFormattedMeta,
        chicagoFormatted.isAcceptableOrUnknown(
          data['chicago_formatted']!,
          _chicagoFormattedMeta,
        ),
      );
    }
    if (data.containsKey('indonesia_formatted')) {
      context.handle(
        _indonesiaFormattedMeta,
        indonesiaFormatted.isAcceptableOrUnknown(
          data['indonesia_formatted']!,
          _indonesiaFormattedMeta,
        ),
      );
    }
    if (data.containsKey('raw_json')) {
      context.handle(
        _rawJsonMeta,
        rawJson.isAcceptableOrUnknown(data['raw_json']!, _rawJsonMeta),
      );
    } else if (isInserting) {
      context.missing(_rawJsonMeta);
    }
    if (data.containsKey('last_synced_at')) {
      context.handle(
        _lastSyncedAtMeta,
        lastSyncedAt.isAcceptableOrUnknown(
          data['last_synced_at']!,
          _lastSyncedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CitationCacheData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CitationCacheData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      source: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source'],
      )!,
      externalId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}external_id'],
      )!,
      citeKey: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}cite_key'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      authorsJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}authors_json'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}year'],
      ),
      journal: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}journal'],
      ),
      volume: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}volume'],
      ),
      issue: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}issue'],
      ),
      pages: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}pages'],
      ),
      doi: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}doi'],
      ),
      url: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}url'],
      ),
      apaFormatted: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}apa_formatted'],
      ),
      ieeeFormatted: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ieee_formatted'],
      ),
      chicagoFormatted: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chicago_formatted'],
      ),
      indonesiaFormatted: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}indonesia_formatted'],
      ),
      rawJson: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}raw_json'],
      )!,
      lastSyncedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}last_synced_at'],
      )!,
    );
  }

  @override
  $CitationCacheTable createAlias(String alias) {
    return $CitationCacheTable(attachedDatabase, alias);
  }
}

class CitationCacheData extends DataClass
    implements Insertable<CitationCacheData> {
  final int id;
  final String source;
  final String externalId;
  final String citeKey;
  final String title;
  final String authorsJson;
  final int? year;
  final String? journal;
  final String? volume;
  final String? issue;
  final String? pages;
  final String? doi;
  final String? url;
  final String? apaFormatted;
  final String? ieeeFormatted;
  final String? chicagoFormatted;
  final String? indonesiaFormatted;
  final String rawJson;
  final DateTime lastSyncedAt;
  const CitationCacheData({
    required this.id,
    required this.source,
    required this.externalId,
    required this.citeKey,
    required this.title,
    required this.authorsJson,
    this.year,
    this.journal,
    this.volume,
    this.issue,
    this.pages,
    this.doi,
    this.url,
    this.apaFormatted,
    this.ieeeFormatted,
    this.chicagoFormatted,
    this.indonesiaFormatted,
    required this.rawJson,
    required this.lastSyncedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['source'] = Variable<String>(source);
    map['external_id'] = Variable<String>(externalId);
    map['cite_key'] = Variable<String>(citeKey);
    map['title'] = Variable<String>(title);
    map['authors_json'] = Variable<String>(authorsJson);
    if (!nullToAbsent || year != null) {
      map['year'] = Variable<int>(year);
    }
    if (!nullToAbsent || journal != null) {
      map['journal'] = Variable<String>(journal);
    }
    if (!nullToAbsent || volume != null) {
      map['volume'] = Variable<String>(volume);
    }
    if (!nullToAbsent || issue != null) {
      map['issue'] = Variable<String>(issue);
    }
    if (!nullToAbsent || pages != null) {
      map['pages'] = Variable<String>(pages);
    }
    if (!nullToAbsent || doi != null) {
      map['doi'] = Variable<String>(doi);
    }
    if (!nullToAbsent || url != null) {
      map['url'] = Variable<String>(url);
    }
    if (!nullToAbsent || apaFormatted != null) {
      map['apa_formatted'] = Variable<String>(apaFormatted);
    }
    if (!nullToAbsent || ieeeFormatted != null) {
      map['ieee_formatted'] = Variable<String>(ieeeFormatted);
    }
    if (!nullToAbsent || chicagoFormatted != null) {
      map['chicago_formatted'] = Variable<String>(chicagoFormatted);
    }
    if (!nullToAbsent || indonesiaFormatted != null) {
      map['indonesia_formatted'] = Variable<String>(indonesiaFormatted);
    }
    map['raw_json'] = Variable<String>(rawJson);
    map['last_synced_at'] = Variable<DateTime>(lastSyncedAt);
    return map;
  }

  CitationCacheCompanion toCompanion(bool nullToAbsent) {
    return CitationCacheCompanion(
      id: Value(id),
      source: Value(source),
      externalId: Value(externalId),
      citeKey: Value(citeKey),
      title: Value(title),
      authorsJson: Value(authorsJson),
      year: year == null && nullToAbsent ? const Value.absent() : Value(year),
      journal: journal == null && nullToAbsent
          ? const Value.absent()
          : Value(journal),
      volume: volume == null && nullToAbsent
          ? const Value.absent()
          : Value(volume),
      issue: issue == null && nullToAbsent
          ? const Value.absent()
          : Value(issue),
      pages: pages == null && nullToAbsent
          ? const Value.absent()
          : Value(pages),
      doi: doi == null && nullToAbsent ? const Value.absent() : Value(doi),
      url: url == null && nullToAbsent ? const Value.absent() : Value(url),
      apaFormatted: apaFormatted == null && nullToAbsent
          ? const Value.absent()
          : Value(apaFormatted),
      ieeeFormatted: ieeeFormatted == null && nullToAbsent
          ? const Value.absent()
          : Value(ieeeFormatted),
      chicagoFormatted: chicagoFormatted == null && nullToAbsent
          ? const Value.absent()
          : Value(chicagoFormatted),
      indonesiaFormatted: indonesiaFormatted == null && nullToAbsent
          ? const Value.absent()
          : Value(indonesiaFormatted),
      rawJson: Value(rawJson),
      lastSyncedAt: Value(lastSyncedAt),
    );
  }

  factory CitationCacheData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CitationCacheData(
      id: serializer.fromJson<int>(json['id']),
      source: serializer.fromJson<String>(json['source']),
      externalId: serializer.fromJson<String>(json['externalId']),
      citeKey: serializer.fromJson<String>(json['citeKey']),
      title: serializer.fromJson<String>(json['title']),
      authorsJson: serializer.fromJson<String>(json['authorsJson']),
      year: serializer.fromJson<int?>(json['year']),
      journal: serializer.fromJson<String?>(json['journal']),
      volume: serializer.fromJson<String?>(json['volume']),
      issue: serializer.fromJson<String?>(json['issue']),
      pages: serializer.fromJson<String?>(json['pages']),
      doi: serializer.fromJson<String?>(json['doi']),
      url: serializer.fromJson<String?>(json['url']),
      apaFormatted: serializer.fromJson<String?>(json['apaFormatted']),
      ieeeFormatted: serializer.fromJson<String?>(json['ieeeFormatted']),
      chicagoFormatted: serializer.fromJson<String?>(json['chicagoFormatted']),
      indonesiaFormatted: serializer.fromJson<String?>(
        json['indonesiaFormatted'],
      ),
      rawJson: serializer.fromJson<String>(json['rawJson']),
      lastSyncedAt: serializer.fromJson<DateTime>(json['lastSyncedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'source': serializer.toJson<String>(source),
      'externalId': serializer.toJson<String>(externalId),
      'citeKey': serializer.toJson<String>(citeKey),
      'title': serializer.toJson<String>(title),
      'authorsJson': serializer.toJson<String>(authorsJson),
      'year': serializer.toJson<int?>(year),
      'journal': serializer.toJson<String?>(journal),
      'volume': serializer.toJson<String?>(volume),
      'issue': serializer.toJson<String?>(issue),
      'pages': serializer.toJson<String?>(pages),
      'doi': serializer.toJson<String?>(doi),
      'url': serializer.toJson<String?>(url),
      'apaFormatted': serializer.toJson<String?>(apaFormatted),
      'ieeeFormatted': serializer.toJson<String?>(ieeeFormatted),
      'chicagoFormatted': serializer.toJson<String?>(chicagoFormatted),
      'indonesiaFormatted': serializer.toJson<String?>(indonesiaFormatted),
      'rawJson': serializer.toJson<String>(rawJson),
      'lastSyncedAt': serializer.toJson<DateTime>(lastSyncedAt),
    };
  }

  CitationCacheData copyWith({
    int? id,
    String? source,
    String? externalId,
    String? citeKey,
    String? title,
    String? authorsJson,
    Value<int?> year = const Value.absent(),
    Value<String?> journal = const Value.absent(),
    Value<String?> volume = const Value.absent(),
    Value<String?> issue = const Value.absent(),
    Value<String?> pages = const Value.absent(),
    Value<String?> doi = const Value.absent(),
    Value<String?> url = const Value.absent(),
    Value<String?> apaFormatted = const Value.absent(),
    Value<String?> ieeeFormatted = const Value.absent(),
    Value<String?> chicagoFormatted = const Value.absent(),
    Value<String?> indonesiaFormatted = const Value.absent(),
    String? rawJson,
    DateTime? lastSyncedAt,
  }) => CitationCacheData(
    id: id ?? this.id,
    source: source ?? this.source,
    externalId: externalId ?? this.externalId,
    citeKey: citeKey ?? this.citeKey,
    title: title ?? this.title,
    authorsJson: authorsJson ?? this.authorsJson,
    year: year.present ? year.value : this.year,
    journal: journal.present ? journal.value : this.journal,
    volume: volume.present ? volume.value : this.volume,
    issue: issue.present ? issue.value : this.issue,
    pages: pages.present ? pages.value : this.pages,
    doi: doi.present ? doi.value : this.doi,
    url: url.present ? url.value : this.url,
    apaFormatted: apaFormatted.present ? apaFormatted.value : this.apaFormatted,
    ieeeFormatted: ieeeFormatted.present
        ? ieeeFormatted.value
        : this.ieeeFormatted,
    chicagoFormatted: chicagoFormatted.present
        ? chicagoFormatted.value
        : this.chicagoFormatted,
    indonesiaFormatted: indonesiaFormatted.present
        ? indonesiaFormatted.value
        : this.indonesiaFormatted,
    rawJson: rawJson ?? this.rawJson,
    lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
  );
  CitationCacheData copyWithCompanion(CitationCacheCompanion data) {
    return CitationCacheData(
      id: data.id.present ? data.id.value : this.id,
      source: data.source.present ? data.source.value : this.source,
      externalId: data.externalId.present
          ? data.externalId.value
          : this.externalId,
      citeKey: data.citeKey.present ? data.citeKey.value : this.citeKey,
      title: data.title.present ? data.title.value : this.title,
      authorsJson: data.authorsJson.present
          ? data.authorsJson.value
          : this.authorsJson,
      year: data.year.present ? data.year.value : this.year,
      journal: data.journal.present ? data.journal.value : this.journal,
      volume: data.volume.present ? data.volume.value : this.volume,
      issue: data.issue.present ? data.issue.value : this.issue,
      pages: data.pages.present ? data.pages.value : this.pages,
      doi: data.doi.present ? data.doi.value : this.doi,
      url: data.url.present ? data.url.value : this.url,
      apaFormatted: data.apaFormatted.present
          ? data.apaFormatted.value
          : this.apaFormatted,
      ieeeFormatted: data.ieeeFormatted.present
          ? data.ieeeFormatted.value
          : this.ieeeFormatted,
      chicagoFormatted: data.chicagoFormatted.present
          ? data.chicagoFormatted.value
          : this.chicagoFormatted,
      indonesiaFormatted: data.indonesiaFormatted.present
          ? data.indonesiaFormatted.value
          : this.indonesiaFormatted,
      rawJson: data.rawJson.present ? data.rawJson.value : this.rawJson,
      lastSyncedAt: data.lastSyncedAt.present
          ? data.lastSyncedAt.value
          : this.lastSyncedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CitationCacheData(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('externalId: $externalId, ')
          ..write('citeKey: $citeKey, ')
          ..write('title: $title, ')
          ..write('authorsJson: $authorsJson, ')
          ..write('year: $year, ')
          ..write('journal: $journal, ')
          ..write('volume: $volume, ')
          ..write('issue: $issue, ')
          ..write('pages: $pages, ')
          ..write('doi: $doi, ')
          ..write('url: $url, ')
          ..write('apaFormatted: $apaFormatted, ')
          ..write('ieeeFormatted: $ieeeFormatted, ')
          ..write('chicagoFormatted: $chicagoFormatted, ')
          ..write('indonesiaFormatted: $indonesiaFormatted, ')
          ..write('rawJson: $rawJson, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    source,
    externalId,
    citeKey,
    title,
    authorsJson,
    year,
    journal,
    volume,
    issue,
    pages,
    doi,
    url,
    apaFormatted,
    ieeeFormatted,
    chicagoFormatted,
    indonesiaFormatted,
    rawJson,
    lastSyncedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CitationCacheData &&
          other.id == this.id &&
          other.source == this.source &&
          other.externalId == this.externalId &&
          other.citeKey == this.citeKey &&
          other.title == this.title &&
          other.authorsJson == this.authorsJson &&
          other.year == this.year &&
          other.journal == this.journal &&
          other.volume == this.volume &&
          other.issue == this.issue &&
          other.pages == this.pages &&
          other.doi == this.doi &&
          other.url == this.url &&
          other.apaFormatted == this.apaFormatted &&
          other.ieeeFormatted == this.ieeeFormatted &&
          other.chicagoFormatted == this.chicagoFormatted &&
          other.indonesiaFormatted == this.indonesiaFormatted &&
          other.rawJson == this.rawJson &&
          other.lastSyncedAt == this.lastSyncedAt);
}

class CitationCacheCompanion extends UpdateCompanion<CitationCacheData> {
  final Value<int> id;
  final Value<String> source;
  final Value<String> externalId;
  final Value<String> citeKey;
  final Value<String> title;
  final Value<String> authorsJson;
  final Value<int?> year;
  final Value<String?> journal;
  final Value<String?> volume;
  final Value<String?> issue;
  final Value<String?> pages;
  final Value<String?> doi;
  final Value<String?> url;
  final Value<String?> apaFormatted;
  final Value<String?> ieeeFormatted;
  final Value<String?> chicagoFormatted;
  final Value<String?> indonesiaFormatted;
  final Value<String> rawJson;
  final Value<DateTime> lastSyncedAt;
  const CitationCacheCompanion({
    this.id = const Value.absent(),
    this.source = const Value.absent(),
    this.externalId = const Value.absent(),
    this.citeKey = const Value.absent(),
    this.title = const Value.absent(),
    this.authorsJson = const Value.absent(),
    this.year = const Value.absent(),
    this.journal = const Value.absent(),
    this.volume = const Value.absent(),
    this.issue = const Value.absent(),
    this.pages = const Value.absent(),
    this.doi = const Value.absent(),
    this.url = const Value.absent(),
    this.apaFormatted = const Value.absent(),
    this.ieeeFormatted = const Value.absent(),
    this.chicagoFormatted = const Value.absent(),
    this.indonesiaFormatted = const Value.absent(),
    this.rawJson = const Value.absent(),
    this.lastSyncedAt = const Value.absent(),
  });
  CitationCacheCompanion.insert({
    this.id = const Value.absent(),
    required String source,
    required String externalId,
    required String citeKey,
    required String title,
    required String authorsJson,
    this.year = const Value.absent(),
    this.journal = const Value.absent(),
    this.volume = const Value.absent(),
    this.issue = const Value.absent(),
    this.pages = const Value.absent(),
    this.doi = const Value.absent(),
    this.url = const Value.absent(),
    this.apaFormatted = const Value.absent(),
    this.ieeeFormatted = const Value.absent(),
    this.chicagoFormatted = const Value.absent(),
    this.indonesiaFormatted = const Value.absent(),
    required String rawJson,
    this.lastSyncedAt = const Value.absent(),
  }) : source = Value(source),
       externalId = Value(externalId),
       citeKey = Value(citeKey),
       title = Value(title),
       authorsJson = Value(authorsJson),
       rawJson = Value(rawJson);
  static Insertable<CitationCacheData> custom({
    Expression<int>? id,
    Expression<String>? source,
    Expression<String>? externalId,
    Expression<String>? citeKey,
    Expression<String>? title,
    Expression<String>? authorsJson,
    Expression<int>? year,
    Expression<String>? journal,
    Expression<String>? volume,
    Expression<String>? issue,
    Expression<String>? pages,
    Expression<String>? doi,
    Expression<String>? url,
    Expression<String>? apaFormatted,
    Expression<String>? ieeeFormatted,
    Expression<String>? chicagoFormatted,
    Expression<String>? indonesiaFormatted,
    Expression<String>? rawJson,
    Expression<DateTime>? lastSyncedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (source != null) 'source': source,
      if (externalId != null) 'external_id': externalId,
      if (citeKey != null) 'cite_key': citeKey,
      if (title != null) 'title': title,
      if (authorsJson != null) 'authors_json': authorsJson,
      if (year != null) 'year': year,
      if (journal != null) 'journal': journal,
      if (volume != null) 'volume': volume,
      if (issue != null) 'issue': issue,
      if (pages != null) 'pages': pages,
      if (doi != null) 'doi': doi,
      if (url != null) 'url': url,
      if (apaFormatted != null) 'apa_formatted': apaFormatted,
      if (ieeeFormatted != null) 'ieee_formatted': ieeeFormatted,
      if (chicagoFormatted != null) 'chicago_formatted': chicagoFormatted,
      if (indonesiaFormatted != null) 'indonesia_formatted': indonesiaFormatted,
      if (rawJson != null) 'raw_json': rawJson,
      if (lastSyncedAt != null) 'last_synced_at': lastSyncedAt,
    });
  }

  CitationCacheCompanion copyWith({
    Value<int>? id,
    Value<String>? source,
    Value<String>? externalId,
    Value<String>? citeKey,
    Value<String>? title,
    Value<String>? authorsJson,
    Value<int?>? year,
    Value<String?>? journal,
    Value<String?>? volume,
    Value<String?>? issue,
    Value<String?>? pages,
    Value<String?>? doi,
    Value<String?>? url,
    Value<String?>? apaFormatted,
    Value<String?>? ieeeFormatted,
    Value<String?>? chicagoFormatted,
    Value<String?>? indonesiaFormatted,
    Value<String>? rawJson,
    Value<DateTime>? lastSyncedAt,
  }) {
    return CitationCacheCompanion(
      id: id ?? this.id,
      source: source ?? this.source,
      externalId: externalId ?? this.externalId,
      citeKey: citeKey ?? this.citeKey,
      title: title ?? this.title,
      authorsJson: authorsJson ?? this.authorsJson,
      year: year ?? this.year,
      journal: journal ?? this.journal,
      volume: volume ?? this.volume,
      issue: issue ?? this.issue,
      pages: pages ?? this.pages,
      doi: doi ?? this.doi,
      url: url ?? this.url,
      apaFormatted: apaFormatted ?? this.apaFormatted,
      ieeeFormatted: ieeeFormatted ?? this.ieeeFormatted,
      chicagoFormatted: chicagoFormatted ?? this.chicagoFormatted,
      indonesiaFormatted: indonesiaFormatted ?? this.indonesiaFormatted,
      rawJson: rawJson ?? this.rawJson,
      lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (source.present) {
      map['source'] = Variable<String>(source.value);
    }
    if (externalId.present) {
      map['external_id'] = Variable<String>(externalId.value);
    }
    if (citeKey.present) {
      map['cite_key'] = Variable<String>(citeKey.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (authorsJson.present) {
      map['authors_json'] = Variable<String>(authorsJson.value);
    }
    if (year.present) {
      map['year'] = Variable<int>(year.value);
    }
    if (journal.present) {
      map['journal'] = Variable<String>(journal.value);
    }
    if (volume.present) {
      map['volume'] = Variable<String>(volume.value);
    }
    if (issue.present) {
      map['issue'] = Variable<String>(issue.value);
    }
    if (pages.present) {
      map['pages'] = Variable<String>(pages.value);
    }
    if (doi.present) {
      map['doi'] = Variable<String>(doi.value);
    }
    if (url.present) {
      map['url'] = Variable<String>(url.value);
    }
    if (apaFormatted.present) {
      map['apa_formatted'] = Variable<String>(apaFormatted.value);
    }
    if (ieeeFormatted.present) {
      map['ieee_formatted'] = Variable<String>(ieeeFormatted.value);
    }
    if (chicagoFormatted.present) {
      map['chicago_formatted'] = Variable<String>(chicagoFormatted.value);
    }
    if (indonesiaFormatted.present) {
      map['indonesia_formatted'] = Variable<String>(indonesiaFormatted.value);
    }
    if (rawJson.present) {
      map['raw_json'] = Variable<String>(rawJson.value);
    }
    if (lastSyncedAt.present) {
      map['last_synced_at'] = Variable<DateTime>(lastSyncedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CitationCacheCompanion(')
          ..write('id: $id, ')
          ..write('source: $source, ')
          ..write('externalId: $externalId, ')
          ..write('citeKey: $citeKey, ')
          ..write('title: $title, ')
          ..write('authorsJson: $authorsJson, ')
          ..write('year: $year, ')
          ..write('journal: $journal, ')
          ..write('volume: $volume, ')
          ..write('issue: $issue, ')
          ..write('pages: $pages, ')
          ..write('doi: $doi, ')
          ..write('url: $url, ')
          ..write('apaFormatted: $apaFormatted, ')
          ..write('ieeeFormatted: $ieeeFormatted, ')
          ..write('chicagoFormatted: $chicagoFormatted, ')
          ..write('indonesiaFormatted: $indonesiaFormatted, ')
          ..write('rawJson: $rawJson, ')
          ..write('lastSyncedAt: $lastSyncedAt')
          ..write(')'))
        .toString();
  }
}

class $RagIndexMetadataTable extends RagIndexMetadata
    with TableInfo<$RagIndexMetadataTable, RagIndexMetadataData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RagIndexMetadataTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _filePathMeta = const VerificationMeta(
    'filePath',
  );
  @override
  late final GeneratedColumn<String> filePath = GeneratedColumn<String>(
    'file_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileNameMeta = const VerificationMeta(
    'fileName',
  );
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
    'file_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileHashMeta = const VerificationMeta(
    'fileHash',
  );
  @override
  late final GeneratedColumn<String> fileHash = GeneratedColumn<String>(
    'file_hash',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _fileSizeBytesMeta = const VerificationMeta(
    'fileSizeBytes',
  );
  @override
  late final GeneratedColumn<int> fileSizeBytes = GeneratedColumn<int>(
    'file_size_bytes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _pageCountMeta = const VerificationMeta(
    'pageCount',
  );
  @override
  late final GeneratedColumn<int> pageCount = GeneratedColumn<int>(
    'page_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _chunkCountMeta = const VerificationMeta(
    'chunkCount',
  );
  @override
  late final GeneratedColumn<int> chunkCount = GeneratedColumn<int>(
    'chunk_count',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _collectionNameMeta = const VerificationMeta(
    'collectionName',
  );
  @override
  late final GeneratedColumn<String> collectionName = GeneratedColumn<String>(
    'collection_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('references'),
  );
  static const VerificationMeta _indexStatusMeta = const VerificationMeta(
    'indexStatus',
  );
  @override
  late final GeneratedColumn<String> indexStatus = GeneratedColumn<String>(
    'index_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pending'),
  );
  static const VerificationMeta _errorMessageMeta = const VerificationMeta(
    'errorMessage',
  );
  @override
  late final GeneratedColumn<String> errorMessage = GeneratedColumn<String>(
    'error_message',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _indexedAtMeta = const VerificationMeta(
    'indexedAt',
  );
  @override
  late final GeneratedColumn<DateTime> indexedAt = GeneratedColumn<DateTime>(
    'indexed_at',
    aliasedName,
    true,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    filePath,
    fileName,
    fileHash,
    fileSizeBytes,
    pageCount,
    chunkCount,
    collectionName,
    indexStatus,
    errorMessage,
    indexedAt,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'rag_index_metadata';
  @override
  VerificationContext validateIntegrity(
    Insertable<RagIndexMetadataData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('file_path')) {
      context.handle(
        _filePathMeta,
        filePath.isAcceptableOrUnknown(data['file_path']!, _filePathMeta),
      );
    } else if (isInserting) {
      context.missing(_filePathMeta);
    }
    if (data.containsKey('file_name')) {
      context.handle(
        _fileNameMeta,
        fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta),
      );
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('file_hash')) {
      context.handle(
        _fileHashMeta,
        fileHash.isAcceptableOrUnknown(data['file_hash']!, _fileHashMeta),
      );
    } else if (isInserting) {
      context.missing(_fileHashMeta);
    }
    if (data.containsKey('file_size_bytes')) {
      context.handle(
        _fileSizeBytesMeta,
        fileSizeBytes.isAcceptableOrUnknown(
          data['file_size_bytes']!,
          _fileSizeBytesMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_fileSizeBytesMeta);
    }
    if (data.containsKey('page_count')) {
      context.handle(
        _pageCountMeta,
        pageCount.isAcceptableOrUnknown(data['page_count']!, _pageCountMeta),
      );
    }
    if (data.containsKey('chunk_count')) {
      context.handle(
        _chunkCountMeta,
        chunkCount.isAcceptableOrUnknown(data['chunk_count']!, _chunkCountMeta),
      );
    }
    if (data.containsKey('collection_name')) {
      context.handle(
        _collectionNameMeta,
        collectionName.isAcceptableOrUnknown(
          data['collection_name']!,
          _collectionNameMeta,
        ),
      );
    }
    if (data.containsKey('index_status')) {
      context.handle(
        _indexStatusMeta,
        indexStatus.isAcceptableOrUnknown(
          data['index_status']!,
          _indexStatusMeta,
        ),
      );
    }
    if (data.containsKey('error_message')) {
      context.handle(
        _errorMessageMeta,
        errorMessage.isAcceptableOrUnknown(
          data['error_message']!,
          _errorMessageMeta,
        ),
      );
    }
    if (data.containsKey('indexed_at')) {
      context.handle(
        _indexedAtMeta,
        indexedAt.isAcceptableOrUnknown(data['indexed_at']!, _indexedAtMeta),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RagIndexMetadataData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RagIndexMetadataData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      filePath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_path'],
      )!,
      fileName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_name'],
      )!,
      fileHash: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_hash'],
      )!,
      fileSizeBytes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}file_size_bytes'],
      )!,
      pageCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}page_count'],
      ),
      chunkCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}chunk_count'],
      ),
      collectionName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}collection_name'],
      )!,
      indexStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}index_status'],
      )!,
      errorMessage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}error_message'],
      ),
      indexedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}indexed_at'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $RagIndexMetadataTable createAlias(String alias) {
    return $RagIndexMetadataTable(attachedDatabase, alias);
  }
}

class RagIndexMetadataData extends DataClass
    implements Insertable<RagIndexMetadataData> {
  final int id;
  final String filePath;
  final String fileName;
  final String fileHash;
  final int fileSizeBytes;
  final int? pageCount;
  final int? chunkCount;
  final String collectionName;
  final String indexStatus;
  final String? errorMessage;
  final DateTime? indexedAt;
  final DateTime createdAt;
  const RagIndexMetadataData({
    required this.id,
    required this.filePath,
    required this.fileName,
    required this.fileHash,
    required this.fileSizeBytes,
    this.pageCount,
    this.chunkCount,
    required this.collectionName,
    required this.indexStatus,
    this.errorMessage,
    this.indexedAt,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['file_path'] = Variable<String>(filePath);
    map['file_name'] = Variable<String>(fileName);
    map['file_hash'] = Variable<String>(fileHash);
    map['file_size_bytes'] = Variable<int>(fileSizeBytes);
    if (!nullToAbsent || pageCount != null) {
      map['page_count'] = Variable<int>(pageCount);
    }
    if (!nullToAbsent || chunkCount != null) {
      map['chunk_count'] = Variable<int>(chunkCount);
    }
    map['collection_name'] = Variable<String>(collectionName);
    map['index_status'] = Variable<String>(indexStatus);
    if (!nullToAbsent || errorMessage != null) {
      map['error_message'] = Variable<String>(errorMessage);
    }
    if (!nullToAbsent || indexedAt != null) {
      map['indexed_at'] = Variable<DateTime>(indexedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  RagIndexMetadataCompanion toCompanion(bool nullToAbsent) {
    return RagIndexMetadataCompanion(
      id: Value(id),
      filePath: Value(filePath),
      fileName: Value(fileName),
      fileHash: Value(fileHash),
      fileSizeBytes: Value(fileSizeBytes),
      pageCount: pageCount == null && nullToAbsent
          ? const Value.absent()
          : Value(pageCount),
      chunkCount: chunkCount == null && nullToAbsent
          ? const Value.absent()
          : Value(chunkCount),
      collectionName: Value(collectionName),
      indexStatus: Value(indexStatus),
      errorMessage: errorMessage == null && nullToAbsent
          ? const Value.absent()
          : Value(errorMessage),
      indexedAt: indexedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(indexedAt),
      createdAt: Value(createdAt),
    );
  }

  factory RagIndexMetadataData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RagIndexMetadataData(
      id: serializer.fromJson<int>(json['id']),
      filePath: serializer.fromJson<String>(json['filePath']),
      fileName: serializer.fromJson<String>(json['fileName']),
      fileHash: serializer.fromJson<String>(json['fileHash']),
      fileSizeBytes: serializer.fromJson<int>(json['fileSizeBytes']),
      pageCount: serializer.fromJson<int?>(json['pageCount']),
      chunkCount: serializer.fromJson<int?>(json['chunkCount']),
      collectionName: serializer.fromJson<String>(json['collectionName']),
      indexStatus: serializer.fromJson<String>(json['indexStatus']),
      errorMessage: serializer.fromJson<String?>(json['errorMessage']),
      indexedAt: serializer.fromJson<DateTime?>(json['indexedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'filePath': serializer.toJson<String>(filePath),
      'fileName': serializer.toJson<String>(fileName),
      'fileHash': serializer.toJson<String>(fileHash),
      'fileSizeBytes': serializer.toJson<int>(fileSizeBytes),
      'pageCount': serializer.toJson<int?>(pageCount),
      'chunkCount': serializer.toJson<int?>(chunkCount),
      'collectionName': serializer.toJson<String>(collectionName),
      'indexStatus': serializer.toJson<String>(indexStatus),
      'errorMessage': serializer.toJson<String?>(errorMessage),
      'indexedAt': serializer.toJson<DateTime?>(indexedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  RagIndexMetadataData copyWith({
    int? id,
    String? filePath,
    String? fileName,
    String? fileHash,
    int? fileSizeBytes,
    Value<int?> pageCount = const Value.absent(),
    Value<int?> chunkCount = const Value.absent(),
    String? collectionName,
    String? indexStatus,
    Value<String?> errorMessage = const Value.absent(),
    Value<DateTime?> indexedAt = const Value.absent(),
    DateTime? createdAt,
  }) => RagIndexMetadataData(
    id: id ?? this.id,
    filePath: filePath ?? this.filePath,
    fileName: fileName ?? this.fileName,
    fileHash: fileHash ?? this.fileHash,
    fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
    pageCount: pageCount.present ? pageCount.value : this.pageCount,
    chunkCount: chunkCount.present ? chunkCount.value : this.chunkCount,
    collectionName: collectionName ?? this.collectionName,
    indexStatus: indexStatus ?? this.indexStatus,
    errorMessage: errorMessage.present ? errorMessage.value : this.errorMessage,
    indexedAt: indexedAt.present ? indexedAt.value : this.indexedAt,
    createdAt: createdAt ?? this.createdAt,
  );
  RagIndexMetadataData copyWithCompanion(RagIndexMetadataCompanion data) {
    return RagIndexMetadataData(
      id: data.id.present ? data.id.value : this.id,
      filePath: data.filePath.present ? data.filePath.value : this.filePath,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      fileHash: data.fileHash.present ? data.fileHash.value : this.fileHash,
      fileSizeBytes: data.fileSizeBytes.present
          ? data.fileSizeBytes.value
          : this.fileSizeBytes,
      pageCount: data.pageCount.present ? data.pageCount.value : this.pageCount,
      chunkCount: data.chunkCount.present
          ? data.chunkCount.value
          : this.chunkCount,
      collectionName: data.collectionName.present
          ? data.collectionName.value
          : this.collectionName,
      indexStatus: data.indexStatus.present
          ? data.indexStatus.value
          : this.indexStatus,
      errorMessage: data.errorMessage.present
          ? data.errorMessage.value
          : this.errorMessage,
      indexedAt: data.indexedAt.present ? data.indexedAt.value : this.indexedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RagIndexMetadataData(')
          ..write('id: $id, ')
          ..write('filePath: $filePath, ')
          ..write('fileName: $fileName, ')
          ..write('fileHash: $fileHash, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('pageCount: $pageCount, ')
          ..write('chunkCount: $chunkCount, ')
          ..write('collectionName: $collectionName, ')
          ..write('indexStatus: $indexStatus, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('indexedAt: $indexedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    filePath,
    fileName,
    fileHash,
    fileSizeBytes,
    pageCount,
    chunkCount,
    collectionName,
    indexStatus,
    errorMessage,
    indexedAt,
    createdAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RagIndexMetadataData &&
          other.id == this.id &&
          other.filePath == this.filePath &&
          other.fileName == this.fileName &&
          other.fileHash == this.fileHash &&
          other.fileSizeBytes == this.fileSizeBytes &&
          other.pageCount == this.pageCount &&
          other.chunkCount == this.chunkCount &&
          other.collectionName == this.collectionName &&
          other.indexStatus == this.indexStatus &&
          other.errorMessage == this.errorMessage &&
          other.indexedAt == this.indexedAt &&
          other.createdAt == this.createdAt);
}

class RagIndexMetadataCompanion extends UpdateCompanion<RagIndexMetadataData> {
  final Value<int> id;
  final Value<String> filePath;
  final Value<String> fileName;
  final Value<String> fileHash;
  final Value<int> fileSizeBytes;
  final Value<int?> pageCount;
  final Value<int?> chunkCount;
  final Value<String> collectionName;
  final Value<String> indexStatus;
  final Value<String?> errorMessage;
  final Value<DateTime?> indexedAt;
  final Value<DateTime> createdAt;
  const RagIndexMetadataCompanion({
    this.id = const Value.absent(),
    this.filePath = const Value.absent(),
    this.fileName = const Value.absent(),
    this.fileHash = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.pageCount = const Value.absent(),
    this.chunkCount = const Value.absent(),
    this.collectionName = const Value.absent(),
    this.indexStatus = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.indexedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  RagIndexMetadataCompanion.insert({
    this.id = const Value.absent(),
    required String filePath,
    required String fileName,
    required String fileHash,
    required int fileSizeBytes,
    this.pageCount = const Value.absent(),
    this.chunkCount = const Value.absent(),
    this.collectionName = const Value.absent(),
    this.indexStatus = const Value.absent(),
    this.errorMessage = const Value.absent(),
    this.indexedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
  }) : filePath = Value(filePath),
       fileName = Value(fileName),
       fileHash = Value(fileHash),
       fileSizeBytes = Value(fileSizeBytes);
  static Insertable<RagIndexMetadataData> custom({
    Expression<int>? id,
    Expression<String>? filePath,
    Expression<String>? fileName,
    Expression<String>? fileHash,
    Expression<int>? fileSizeBytes,
    Expression<int>? pageCount,
    Expression<int>? chunkCount,
    Expression<String>? collectionName,
    Expression<String>? indexStatus,
    Expression<String>? errorMessage,
    Expression<DateTime>? indexedAt,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (filePath != null) 'file_path': filePath,
      if (fileName != null) 'file_name': fileName,
      if (fileHash != null) 'file_hash': fileHash,
      if (fileSizeBytes != null) 'file_size_bytes': fileSizeBytes,
      if (pageCount != null) 'page_count': pageCount,
      if (chunkCount != null) 'chunk_count': chunkCount,
      if (collectionName != null) 'collection_name': collectionName,
      if (indexStatus != null) 'index_status': indexStatus,
      if (errorMessage != null) 'error_message': errorMessage,
      if (indexedAt != null) 'indexed_at': indexedAt,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  RagIndexMetadataCompanion copyWith({
    Value<int>? id,
    Value<String>? filePath,
    Value<String>? fileName,
    Value<String>? fileHash,
    Value<int>? fileSizeBytes,
    Value<int?>? pageCount,
    Value<int?>? chunkCount,
    Value<String>? collectionName,
    Value<String>? indexStatus,
    Value<String?>? errorMessage,
    Value<DateTime?>? indexedAt,
    Value<DateTime>? createdAt,
  }) {
    return RagIndexMetadataCompanion(
      id: id ?? this.id,
      filePath: filePath ?? this.filePath,
      fileName: fileName ?? this.fileName,
      fileHash: fileHash ?? this.fileHash,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      pageCount: pageCount ?? this.pageCount,
      chunkCount: chunkCount ?? this.chunkCount,
      collectionName: collectionName ?? this.collectionName,
      indexStatus: indexStatus ?? this.indexStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      indexedAt: indexedAt ?? this.indexedAt,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (filePath.present) {
      map['file_path'] = Variable<String>(filePath.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (fileHash.present) {
      map['file_hash'] = Variable<String>(fileHash.value);
    }
    if (fileSizeBytes.present) {
      map['file_size_bytes'] = Variable<int>(fileSizeBytes.value);
    }
    if (pageCount.present) {
      map['page_count'] = Variable<int>(pageCount.value);
    }
    if (chunkCount.present) {
      map['chunk_count'] = Variable<int>(chunkCount.value);
    }
    if (collectionName.present) {
      map['collection_name'] = Variable<String>(collectionName.value);
    }
    if (indexStatus.present) {
      map['index_status'] = Variable<String>(indexStatus.value);
    }
    if (errorMessage.present) {
      map['error_message'] = Variable<String>(errorMessage.value);
    }
    if (indexedAt.present) {
      map['indexed_at'] = Variable<DateTime>(indexedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RagIndexMetadataCompanion(')
          ..write('id: $id, ')
          ..write('filePath: $filePath, ')
          ..write('fileName: $fileName, ')
          ..write('fileHash: $fileHash, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('pageCount: $pageCount, ')
          ..write('chunkCount: $chunkCount, ')
          ..write('collectionName: $collectionName, ')
          ..write('indexStatus: $indexStatus, ')
          ..write('errorMessage: $errorMessage, ')
          ..write('indexedAt: $indexedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSetting> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueTypeMeta = const VerificationMeta(
    'valueType',
  );
  @override
  late final GeneratedColumn<String> valueType = GeneratedColumn<String>(
    'value_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('string'),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    key,
    value,
    valueType,
    description,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSetting> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    if (data.containsKey('value_type')) {
      context.handle(
        _valueTypeMeta,
        valueType.isAcceptableOrUnknown(data['value_type']!, _valueTypeMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSetting map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSetting(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
      valueType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value_type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSetting extends DataClass implements Insertable<AppSetting> {
  final String key;
  final String value;
  final String valueType;
  final String? description;
  final DateTime updatedAt;
  const AppSetting({
    required this.key,
    required this.value,
    required this.valueType,
    this.description,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    map['value_type'] = Variable<String>(valueType);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(
      key: Value(key),
      value: Value(value),
      valueType: Value(valueType),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      updatedAt: Value(updatedAt),
    );
  }

  factory AppSetting.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSetting(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
      valueType: serializer.fromJson<String>(json['valueType']),
      description: serializer.fromJson<String?>(json['description']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
      'valueType': serializer.toJson<String>(valueType),
      'description': serializer.toJson<String?>(description),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AppSetting copyWith({
    String? key,
    String? value,
    String? valueType,
    Value<String?> description = const Value.absent(),
    DateTime? updatedAt,
  }) => AppSetting(
    key: key ?? this.key,
    value: value ?? this.value,
    valueType: valueType ?? this.valueType,
    description: description.present ? description.value : this.description,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  AppSetting copyWithCompanion(AppSettingsCompanion data) {
    return AppSetting(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
      valueType: data.valueType.present ? data.valueType.value : this.valueType,
      description: data.description.present
          ? data.description.value
          : this.description,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSetting(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('valueType: $valueType, ')
          ..write('description: $description, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(key, value, valueType, description, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSetting &&
          other.key == this.key &&
          other.value == this.value &&
          other.valueType == this.valueType &&
          other.description == this.description &&
          other.updatedAt == this.updatedAt);
}

class AppSettingsCompanion extends UpdateCompanion<AppSetting> {
  final Value<String> key;
  final Value<String> value;
  final Value<String> valueType;
  final Value<String?> description;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.valueType = const Value.absent(),
    this.description = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.valueType = const Value.absent(),
    this.description = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppSetting> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<String>? valueType,
    Expression<String>? description,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (valueType != null) 'value_type': valueType,
      if (description != null) 'description': description,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<String>? valueType,
    Value<String?>? description,
    Value<DateTime>? updatedAt,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      valueType: valueType ?? this.valueType,
      description: description ?? this.description,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (valueType.present) {
      map['value_type'] = Variable<String>(valueType.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('valueType: $valueType, ')
          ..write('description: $description, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DocumentCitationsTable extends DocumentCitations
    with TableInfo<$DocumentCitationsTable, DocumentCitation> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentCitationsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _documentIdMeta = const VerificationMeta(
    'documentId',
  );
  @override
  late final GeneratedColumn<int> documentId = GeneratedColumn<int>(
    'document_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES documents (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _citationIdMeta = const VerificationMeta(
    'citationId',
  );
  @override
  late final GeneratedColumn<int> citationId = GeneratedColumn<int>(
    'citation_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES citation_cache (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _positionIndexMeta = const VerificationMeta(
    'positionIndex',
  );
  @override
  late final GeneratedColumn<int> positionIndex = GeneratedColumn<int>(
    'position_index',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _inlineCountMeta = const VerificationMeta(
    'inlineCount',
  );
  @override
  late final GeneratedColumn<int> inlineCount = GeneratedColumn<int>(
    'inline_count',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(1),
  );
  static const VerificationMeta _insertedAtMeta = const VerificationMeta(
    'insertedAt',
  );
  @override
  late final GeneratedColumn<DateTime> insertedAt = GeneratedColumn<DateTime>(
    'inserted_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    documentId,
    citationId,
    positionIndex,
    inlineCount,
    insertedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_citations';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentCitation> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('document_id')) {
      context.handle(
        _documentIdMeta,
        documentId.isAcceptableOrUnknown(data['document_id']!, _documentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_documentIdMeta);
    }
    if (data.containsKey('citation_id')) {
      context.handle(
        _citationIdMeta,
        citationId.isAcceptableOrUnknown(data['citation_id']!, _citationIdMeta),
      );
    } else if (isInserting) {
      context.missing(_citationIdMeta);
    }
    if (data.containsKey('position_index')) {
      context.handle(
        _positionIndexMeta,
        positionIndex.isAcceptableOrUnknown(
          data['position_index']!,
          _positionIndexMeta,
        ),
      );
    }
    if (data.containsKey('inline_count')) {
      context.handle(
        _inlineCountMeta,
        inlineCount.isAcceptableOrUnknown(
          data['inline_count']!,
          _inlineCountMeta,
        ),
      );
    }
    if (data.containsKey('inserted_at')) {
      context.handle(
        _insertedAtMeta,
        insertedAt.isAcceptableOrUnknown(data['inserted_at']!, _insertedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {documentId, citationId},
  ];
  @override
  DocumentCitation map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentCitation(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      documentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}document_id'],
      )!,
      citationId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}citation_id'],
      )!,
      positionIndex: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}position_index'],
      )!,
      inlineCount: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}inline_count'],
      )!,
      insertedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}inserted_at'],
      )!,
    );
  }

  @override
  $DocumentCitationsTable createAlias(String alias) {
    return $DocumentCitationsTable(attachedDatabase, alias);
  }
}

class DocumentCitation extends DataClass
    implements Insertable<DocumentCitation> {
  final int id;
  final int documentId;
  final int citationId;
  final int positionIndex;
  final int inlineCount;
  final DateTime insertedAt;
  const DocumentCitation({
    required this.id,
    required this.documentId,
    required this.citationId,
    required this.positionIndex,
    required this.inlineCount,
    required this.insertedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['document_id'] = Variable<int>(documentId);
    map['citation_id'] = Variable<int>(citationId);
    map['position_index'] = Variable<int>(positionIndex);
    map['inline_count'] = Variable<int>(inlineCount);
    map['inserted_at'] = Variable<DateTime>(insertedAt);
    return map;
  }

  DocumentCitationsCompanion toCompanion(bool nullToAbsent) {
    return DocumentCitationsCompanion(
      id: Value(id),
      documentId: Value(documentId),
      citationId: Value(citationId),
      positionIndex: Value(positionIndex),
      inlineCount: Value(inlineCount),
      insertedAt: Value(insertedAt),
    );
  }

  factory DocumentCitation.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentCitation(
      id: serializer.fromJson<int>(json['id']),
      documentId: serializer.fromJson<int>(json['documentId']),
      citationId: serializer.fromJson<int>(json['citationId']),
      positionIndex: serializer.fromJson<int>(json['positionIndex']),
      inlineCount: serializer.fromJson<int>(json['inlineCount']),
      insertedAt: serializer.fromJson<DateTime>(json['insertedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'documentId': serializer.toJson<int>(documentId),
      'citationId': serializer.toJson<int>(citationId),
      'positionIndex': serializer.toJson<int>(positionIndex),
      'inlineCount': serializer.toJson<int>(inlineCount),
      'insertedAt': serializer.toJson<DateTime>(insertedAt),
    };
  }

  DocumentCitation copyWith({
    int? id,
    int? documentId,
    int? citationId,
    int? positionIndex,
    int? inlineCount,
    DateTime? insertedAt,
  }) => DocumentCitation(
    id: id ?? this.id,
    documentId: documentId ?? this.documentId,
    citationId: citationId ?? this.citationId,
    positionIndex: positionIndex ?? this.positionIndex,
    inlineCount: inlineCount ?? this.inlineCount,
    insertedAt: insertedAt ?? this.insertedAt,
  );
  DocumentCitation copyWithCompanion(DocumentCitationsCompanion data) {
    return DocumentCitation(
      id: data.id.present ? data.id.value : this.id,
      documentId: data.documentId.present
          ? data.documentId.value
          : this.documentId,
      citationId: data.citationId.present
          ? data.citationId.value
          : this.citationId,
      positionIndex: data.positionIndex.present
          ? data.positionIndex.value
          : this.positionIndex,
      inlineCount: data.inlineCount.present
          ? data.inlineCount.value
          : this.inlineCount,
      insertedAt: data.insertedAt.present
          ? data.insertedAt.value
          : this.insertedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentCitation(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('citationId: $citationId, ')
          ..write('positionIndex: $positionIndex, ')
          ..write('inlineCount: $inlineCount, ')
          ..write('insertedAt: $insertedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    documentId,
    citationId,
    positionIndex,
    inlineCount,
    insertedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentCitation &&
          other.id == this.id &&
          other.documentId == this.documentId &&
          other.citationId == this.citationId &&
          other.positionIndex == this.positionIndex &&
          other.inlineCount == this.inlineCount &&
          other.insertedAt == this.insertedAt);
}

class DocumentCitationsCompanion extends UpdateCompanion<DocumentCitation> {
  final Value<int> id;
  final Value<int> documentId;
  final Value<int> citationId;
  final Value<int> positionIndex;
  final Value<int> inlineCount;
  final Value<DateTime> insertedAt;
  const DocumentCitationsCompanion({
    this.id = const Value.absent(),
    this.documentId = const Value.absent(),
    this.citationId = const Value.absent(),
    this.positionIndex = const Value.absent(),
    this.inlineCount = const Value.absent(),
    this.insertedAt = const Value.absent(),
  });
  DocumentCitationsCompanion.insert({
    this.id = const Value.absent(),
    required int documentId,
    required int citationId,
    this.positionIndex = const Value.absent(),
    this.inlineCount = const Value.absent(),
    this.insertedAt = const Value.absent(),
  }) : documentId = Value(documentId),
       citationId = Value(citationId);
  static Insertable<DocumentCitation> custom({
    Expression<int>? id,
    Expression<int>? documentId,
    Expression<int>? citationId,
    Expression<int>? positionIndex,
    Expression<int>? inlineCount,
    Expression<DateTime>? insertedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (documentId != null) 'document_id': documentId,
      if (citationId != null) 'citation_id': citationId,
      if (positionIndex != null) 'position_index': positionIndex,
      if (inlineCount != null) 'inline_count': inlineCount,
      if (insertedAt != null) 'inserted_at': insertedAt,
    });
  }

  DocumentCitationsCompanion copyWith({
    Value<int>? id,
    Value<int>? documentId,
    Value<int>? citationId,
    Value<int>? positionIndex,
    Value<int>? inlineCount,
    Value<DateTime>? insertedAt,
  }) {
    return DocumentCitationsCompanion(
      id: id ?? this.id,
      documentId: documentId ?? this.documentId,
      citationId: citationId ?? this.citationId,
      positionIndex: positionIndex ?? this.positionIndex,
      inlineCount: inlineCount ?? this.inlineCount,
      insertedAt: insertedAt ?? this.insertedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (documentId.present) {
      map['document_id'] = Variable<int>(documentId.value);
    }
    if (citationId.present) {
      map['citation_id'] = Variable<int>(citationId.value);
    }
    if (positionIndex.present) {
      map['position_index'] = Variable<int>(positionIndex.value);
    }
    if (inlineCount.present) {
      map['inline_count'] = Variable<int>(inlineCount.value);
    }
    if (insertedAt.present) {
      map['inserted_at'] = Variable<DateTime>(insertedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentCitationsCompanion(')
          ..write('id: $id, ')
          ..write('documentId: $documentId, ')
          ..write('citationId: $citationId, ')
          ..write('positionIndex: $positionIndex, ')
          ..write('inlineCount: $inlineCount, ')
          ..write('insertedAt: $insertedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $DocumentsTable documents = $DocumentsTable(this);
  late final $ChatHistoryEntriesTable chatHistoryEntries =
      $ChatHistoryEntriesTable(this);
  late final $PromptTemplatesTable promptTemplates = $PromptTemplatesTable(
    this,
  );
  late final $CitationCacheTable citationCache = $CitationCacheTable(this);
  late final $RagIndexMetadataTable ragIndexMetadata = $RagIndexMetadataTable(
    this,
  );
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  late final $DocumentCitationsTable documentCitations =
      $DocumentCitationsTable(this);
  late final DocumentsDao documentsDao = DocumentsDao(this as AppDatabase);
  late final ChatHistoryDao chatHistoryDao = ChatHistoryDao(
    this as AppDatabase,
  );
  late final CitationsDao citationsDao = CitationsDao(this as AppDatabase);
  late final SettingsDao settingsDao = SettingsDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    documents,
    chatHistoryEntries,
    promptTemplates,
    citationCache,
    ragIndexMetadata,
    appSettings,
    documentCitations,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'documents',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('chat_history_entries', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'documents',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('document_citations', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'citation_cache',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('document_citations', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$DocumentsTableCreateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> id,
      required String title,
      Value<String?> filePath,
      Value<String> contentDelta,
      Value<String> contentPlainText,
      Value<int> wordCount,
      Value<String> citationStyle,
      Value<String> academicFormat,
      Value<bool> isDeleted,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime> lastOpenedAt,
    });
typedef $$DocumentsTableUpdateCompanionBuilder =
    DocumentsCompanion Function({
      Value<int> id,
      Value<String> title,
      Value<String?> filePath,
      Value<String> contentDelta,
      Value<String> contentPlainText,
      Value<int> wordCount,
      Value<String> citationStyle,
      Value<String> academicFormat,
      Value<bool> isDeleted,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
      Value<DateTime> lastOpenedAt,
    });

final class $$DocumentsTableReferences
    extends BaseReferences<_$AppDatabase, $DocumentsTable, Document> {
  $$DocumentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ChatHistoryEntriesTable, List<ChatHistoryEntry>>
  _chatHistoryEntriesRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.chatHistoryEntries,
        aliasName: $_aliasNameGenerator(
          db.documents.id,
          db.chatHistoryEntries.documentId,
        ),
      );

  $$ChatHistoryEntriesTableProcessedTableManager get chatHistoryEntriesRefs {
    final manager = $$ChatHistoryEntriesTableTableManager(
      $_db,
      $_db.chatHistoryEntries,
    ).filter((f) => f.documentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _chatHistoryEntriesRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$DocumentCitationsTable, List<DocumentCitation>>
  _documentCitationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.documentCitations,
        aliasName: $_aliasNameGenerator(
          db.documents.id,
          db.documentCitations.documentId,
        ),
      );

  $$DocumentCitationsTableProcessedTableManager get documentCitationsRefs {
    final manager = $$DocumentCitationsTableTableManager(
      $_db,
      $_db.documentCitations,
    ).filter((f) => f.documentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _documentCitationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$DocumentsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentDelta => $composableBuilder(
    column: $table.contentDelta,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get contentPlainText => $composableBuilder(
    column: $table.contentPlainText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get wordCount => $composableBuilder(
    column: $table.wordCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get citationStyle => $composableBuilder(
    column: $table.citationStyle,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get academicFormat => $composableBuilder(
    column: $table.academicFormat,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> chatHistoryEntriesRefs(
    Expression<bool> Function($$ChatHistoryEntriesTableFilterComposer f) f,
  ) {
    final $$ChatHistoryEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.chatHistoryEntries,
      getReferencedColumn: (t) => t.documentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChatHistoryEntriesTableFilterComposer(
            $db: $db,
            $table: $db.chatHistoryEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> documentCitationsRefs(
    Expression<bool> Function($$DocumentCitationsTableFilterComposer f) f,
  ) {
    final $$DocumentCitationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documentCitations,
      getReferencedColumn: (t) => t.documentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentCitationsTableFilterComposer(
            $db: $db,
            $table: $db.documentCitations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$DocumentsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentDelta => $composableBuilder(
    column: $table.contentDelta,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get contentPlainText => $composableBuilder(
    column: $table.contentPlainText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get wordCount => $composableBuilder(
    column: $table.wordCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get citationStyle => $composableBuilder(
    column: $table.citationStyle,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get academicFormat => $composableBuilder(
    column: $table.academicFormat,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isDeleted => $composableBuilder(
    column: $table.isDeleted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentsTable> {
  $$DocumentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get contentDelta => $composableBuilder(
    column: $table.contentDelta,
    builder: (column) => column,
  );

  GeneratedColumn<String> get contentPlainText => $composableBuilder(
    column: $table.contentPlainText,
    builder: (column) => column,
  );

  GeneratedColumn<int> get wordCount =>
      $composableBuilder(column: $table.wordCount, builder: (column) => column);

  GeneratedColumn<String> get citationStyle => $composableBuilder(
    column: $table.citationStyle,
    builder: (column) => column,
  );

  GeneratedColumn<String> get academicFormat => $composableBuilder(
    column: $table.academicFormat,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isDeleted =>
      $composableBuilder(column: $table.isDeleted, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastOpenedAt => $composableBuilder(
    column: $table.lastOpenedAt,
    builder: (column) => column,
  );

  Expression<T> chatHistoryEntriesRefs<T extends Object>(
    Expression<T> Function($$ChatHistoryEntriesTableAnnotationComposer a) f,
  ) {
    final $$ChatHistoryEntriesTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.chatHistoryEntries,
          getReferencedColumn: (t) => t.documentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$ChatHistoryEntriesTableAnnotationComposer(
                $db: $db,
                $table: $db.chatHistoryEntries,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }

  Expression<T> documentCitationsRefs<T extends Object>(
    Expression<T> Function($$DocumentCitationsTableAnnotationComposer a) f,
  ) {
    final $$DocumentCitationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.documentCitations,
          getReferencedColumn: (t) => t.documentId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DocumentCitationsTableAnnotationComposer(
                $db: $db,
                $table: $db.documentCitations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$DocumentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentsTable,
          Document,
          $$DocumentsTableFilterComposer,
          $$DocumentsTableOrderingComposer,
          $$DocumentsTableAnnotationComposer,
          $$DocumentsTableCreateCompanionBuilder,
          $$DocumentsTableUpdateCompanionBuilder,
          (Document, $$DocumentsTableReferences),
          Document,
          PrefetchHooks Function({
            bool chatHistoryEntriesRefs,
            bool documentCitationsRefs,
          })
        > {
  $$DocumentsTableTableManager(_$AppDatabase db, $DocumentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String?> filePath = const Value.absent(),
                Value<String> contentDelta = const Value.absent(),
                Value<String> contentPlainText = const Value.absent(),
                Value<int> wordCount = const Value.absent(),
                Value<String> citationStyle = const Value.absent(),
                Value<String> academicFormat = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> lastOpenedAt = const Value.absent(),
              }) => DocumentsCompanion(
                id: id,
                title: title,
                filePath: filePath,
                contentDelta: contentDelta,
                contentPlainText: contentPlainText,
                wordCount: wordCount,
                citationStyle: citationStyle,
                academicFormat: academicFormat,
                isDeleted: isDeleted,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastOpenedAt: lastOpenedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String title,
                Value<String?> filePath = const Value.absent(),
                Value<String> contentDelta = const Value.absent(),
                Value<String> contentPlainText = const Value.absent(),
                Value<int> wordCount = const Value.absent(),
                Value<String> citationStyle = const Value.absent(),
                Value<String> academicFormat = const Value.absent(),
                Value<bool> isDeleted = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<DateTime> lastOpenedAt = const Value.absent(),
              }) => DocumentsCompanion.insert(
                id: id,
                title: title,
                filePath: filePath,
                contentDelta: contentDelta,
                contentPlainText: contentPlainText,
                wordCount: wordCount,
                citationStyle: citationStyle,
                academicFormat: academicFormat,
                isDeleted: isDeleted,
                createdAt: createdAt,
                updatedAt: updatedAt,
                lastOpenedAt: lastOpenedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DocumentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                chatHistoryEntriesRefs = false,
                documentCitationsRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (chatHistoryEntriesRefs) db.chatHistoryEntries,
                    if (documentCitationsRefs) db.documentCitations,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (chatHistoryEntriesRefs)
                        await $_getPrefetchedData<
                          Document,
                          $DocumentsTable,
                          ChatHistoryEntry
                        >(
                          currentTable: table,
                          referencedTable: $$DocumentsTableReferences
                              ._chatHistoryEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DocumentsTableReferences(
                                db,
                                table,
                                p0,
                              ).chatHistoryEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.documentId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (documentCitationsRefs)
                        await $_getPrefetchedData<
                          Document,
                          $DocumentsTable,
                          DocumentCitation
                        >(
                          currentTable: table,
                          referencedTable: $$DocumentsTableReferences
                              ._documentCitationsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$DocumentsTableReferences(
                                db,
                                table,
                                p0,
                              ).documentCitationsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.documentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$DocumentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentsTable,
      Document,
      $$DocumentsTableFilterComposer,
      $$DocumentsTableOrderingComposer,
      $$DocumentsTableAnnotationComposer,
      $$DocumentsTableCreateCompanionBuilder,
      $$DocumentsTableUpdateCompanionBuilder,
      (Document, $$DocumentsTableReferences),
      Document,
      PrefetchHooks Function({
        bool chatHistoryEntriesRefs,
        bool documentCitationsRefs,
      })
    >;
typedef $$ChatHistoryEntriesTableCreateCompanionBuilder =
    ChatHistoryEntriesCompanion Function({
      Value<int> id,
      required int documentId,
      required String sessionId,
      required String role,
      required String content,
      Value<int> tokenCountInput,
      Value<int> tokenCountOutput,
      Value<String?> llmProvider,
      Value<String?> llmModel,
      Value<int?> latencyMs,
      Value<DateTime> createdAt,
    });
typedef $$ChatHistoryEntriesTableUpdateCompanionBuilder =
    ChatHistoryEntriesCompanion Function({
      Value<int> id,
      Value<int> documentId,
      Value<String> sessionId,
      Value<String> role,
      Value<String> content,
      Value<int> tokenCountInput,
      Value<int> tokenCountOutput,
      Value<String?> llmProvider,
      Value<String?> llmModel,
      Value<int?> latencyMs,
      Value<DateTime> createdAt,
    });

final class $$ChatHistoryEntriesTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $ChatHistoryEntriesTable,
          ChatHistoryEntry
        > {
  $$ChatHistoryEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DocumentsTable _documentIdTable(_$AppDatabase db) =>
      db.documents.createAlias(
        $_aliasNameGenerator(db.chatHistoryEntries.documentId, db.documents.id),
      );

  $$DocumentsTableProcessedTableManager get documentId {
    final $_column = $_itemColumn<int>('document_id')!;

    final manager = $$DocumentsTableTableManager(
      $_db,
      $_db.documents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_documentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChatHistoryEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $ChatHistoryEntriesTable> {
  $$ChatHistoryEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tokenCountInput => $composableBuilder(
    column: $table.tokenCountInput,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get tokenCountOutput => $composableBuilder(
    column: $table.tokenCountOutput,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get llmProvider => $composableBuilder(
    column: $table.llmProvider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get llmModel => $composableBuilder(
    column: $table.llmModel,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get latencyMs => $composableBuilder(
    column: $table.latencyMs,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DocumentsTableFilterComposer get documentId {
    final $$DocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.documentId,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableFilterComposer(
            $db: $db,
            $table: $db.documents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChatHistoryEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChatHistoryEntriesTable> {
  $$ChatHistoryEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sessionId => $composableBuilder(
    column: $table.sessionId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tokenCountInput => $composableBuilder(
    column: $table.tokenCountInput,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get tokenCountOutput => $composableBuilder(
    column: $table.tokenCountOutput,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get llmProvider => $composableBuilder(
    column: $table.llmProvider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get llmModel => $composableBuilder(
    column: $table.llmModel,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get latencyMs => $composableBuilder(
    column: $table.latencyMs,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DocumentsTableOrderingComposer get documentId {
    final $$DocumentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.documentId,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableOrderingComposer(
            $db: $db,
            $table: $db.documents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChatHistoryEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChatHistoryEntriesTable> {
  $$ChatHistoryEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<int> get tokenCountInput => $composableBuilder(
    column: $table.tokenCountInput,
    builder: (column) => column,
  );

  GeneratedColumn<int> get tokenCountOutput => $composableBuilder(
    column: $table.tokenCountOutput,
    builder: (column) => column,
  );

  GeneratedColumn<String> get llmProvider => $composableBuilder(
    column: $table.llmProvider,
    builder: (column) => column,
  );

  GeneratedColumn<String> get llmModel =>
      $composableBuilder(column: $table.llmModel, builder: (column) => column);

  GeneratedColumn<int> get latencyMs =>
      $composableBuilder(column: $table.latencyMs, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  $$DocumentsTableAnnotationComposer get documentId {
    final $$DocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.documentId,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.documents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChatHistoryEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChatHistoryEntriesTable,
          ChatHistoryEntry,
          $$ChatHistoryEntriesTableFilterComposer,
          $$ChatHistoryEntriesTableOrderingComposer,
          $$ChatHistoryEntriesTableAnnotationComposer,
          $$ChatHistoryEntriesTableCreateCompanionBuilder,
          $$ChatHistoryEntriesTableUpdateCompanionBuilder,
          (ChatHistoryEntry, $$ChatHistoryEntriesTableReferences),
          ChatHistoryEntry,
          PrefetchHooks Function({bool documentId})
        > {
  $$ChatHistoryEntriesTableTableManager(
    _$AppDatabase db,
    $ChatHistoryEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChatHistoryEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChatHistoryEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChatHistoryEntriesTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> documentId = const Value.absent(),
                Value<String> sessionId = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<int> tokenCountInput = const Value.absent(),
                Value<int> tokenCountOutput = const Value.absent(),
                Value<String?> llmProvider = const Value.absent(),
                Value<String?> llmModel = const Value.absent(),
                Value<int?> latencyMs = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ChatHistoryEntriesCompanion(
                id: id,
                documentId: documentId,
                sessionId: sessionId,
                role: role,
                content: content,
                tokenCountInput: tokenCountInput,
                tokenCountOutput: tokenCountOutput,
                llmProvider: llmProvider,
                llmModel: llmModel,
                latencyMs: latencyMs,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int documentId,
                required String sessionId,
                required String role,
                required String content,
                Value<int> tokenCountInput = const Value.absent(),
                Value<int> tokenCountOutput = const Value.absent(),
                Value<String?> llmProvider = const Value.absent(),
                Value<String?> llmModel = const Value.absent(),
                Value<int?> latencyMs = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ChatHistoryEntriesCompanion.insert(
                id: id,
                documentId: documentId,
                sessionId: sessionId,
                role: role,
                content: content,
                tokenCountInput: tokenCountInput,
                tokenCountOutput: tokenCountOutput,
                llmProvider: llmProvider,
                llmModel: llmModel,
                latencyMs: latencyMs,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChatHistoryEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({documentId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (documentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.documentId,
                                referencedTable:
                                    $$ChatHistoryEntriesTableReferences
                                        ._documentIdTable(db),
                                referencedColumn:
                                    $$ChatHistoryEntriesTableReferences
                                        ._documentIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ChatHistoryEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChatHistoryEntriesTable,
      ChatHistoryEntry,
      $$ChatHistoryEntriesTableFilterComposer,
      $$ChatHistoryEntriesTableOrderingComposer,
      $$ChatHistoryEntriesTableAnnotationComposer,
      $$ChatHistoryEntriesTableCreateCompanionBuilder,
      $$ChatHistoryEntriesTableUpdateCompanionBuilder,
      (ChatHistoryEntry, $$ChatHistoryEntriesTableReferences),
      ChatHistoryEntry,
      PrefetchHooks Function({bool documentId})
    >;
typedef $$PromptTemplatesTableCreateCompanionBuilder =
    PromptTemplatesCompanion Function({
      Value<int> id,
      required String name,
      required String category,
      required String templateText,
      Value<String> variablesJson,
      Value<int> usageCount,
      Value<bool> isSystem,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$PromptTemplatesTableUpdateCompanionBuilder =
    PromptTemplatesCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> category,
      Value<String> templateText,
      Value<String> variablesJson,
      Value<int> usageCount,
      Value<bool> isSystem,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

class $$PromptTemplatesTableFilterComposer
    extends Composer<_$AppDatabase, $PromptTemplatesTable> {
  $$PromptTemplatesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get templateText => $composableBuilder(
    column: $table.templateText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get variablesJson => $composableBuilder(
    column: $table.variablesJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$PromptTemplatesTableOrderingComposer
    extends Composer<_$AppDatabase, $PromptTemplatesTable> {
  $$PromptTemplatesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get category => $composableBuilder(
    column: $table.category,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get templateText => $composableBuilder(
    column: $table.templateText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variablesJson => $composableBuilder(
    column: $table.variablesJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSystem => $composableBuilder(
    column: $table.isSystem,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$PromptTemplatesTableAnnotationComposer
    extends Composer<_$AppDatabase, $PromptTemplatesTable> {
  $$PromptTemplatesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get templateText => $composableBuilder(
    column: $table.templateText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get variablesJson => $composableBuilder(
    column: $table.variablesJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get usageCount => $composableBuilder(
    column: $table.usageCount,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isSystem =>
      $composableBuilder(column: $table.isSystem, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PromptTemplatesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $PromptTemplatesTable,
          PromptTemplate,
          $$PromptTemplatesTableFilterComposer,
          $$PromptTemplatesTableOrderingComposer,
          $$PromptTemplatesTableAnnotationComposer,
          $$PromptTemplatesTableCreateCompanionBuilder,
          $$PromptTemplatesTableUpdateCompanionBuilder,
          (
            PromptTemplate,
            BaseReferences<
              _$AppDatabase,
              $PromptTemplatesTable,
              PromptTemplate
            >,
          ),
          PromptTemplate,
          PrefetchHooks Function()
        > {
  $$PromptTemplatesTableTableManager(
    _$AppDatabase db,
    $PromptTemplatesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PromptTemplatesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PromptTemplatesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PromptTemplatesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> category = const Value.absent(),
                Value<String> templateText = const Value.absent(),
                Value<String> variablesJson = const Value.absent(),
                Value<int> usageCount = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PromptTemplatesCompanion(
                id: id,
                name: name,
                category: category,
                templateText: templateText,
                variablesJson: variablesJson,
                usageCount: usageCount,
                isSystem: isSystem,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String category,
                required String templateText,
                Value<String> variablesJson = const Value.absent(),
                Value<int> usageCount = const Value.absent(),
                Value<bool> isSystem = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => PromptTemplatesCompanion.insert(
                id: id,
                name: name,
                category: category,
                templateText: templateText,
                variablesJson: variablesJson,
                usageCount: usageCount,
                isSystem: isSystem,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$PromptTemplatesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $PromptTemplatesTable,
      PromptTemplate,
      $$PromptTemplatesTableFilterComposer,
      $$PromptTemplatesTableOrderingComposer,
      $$PromptTemplatesTableAnnotationComposer,
      $$PromptTemplatesTableCreateCompanionBuilder,
      $$PromptTemplatesTableUpdateCompanionBuilder,
      (
        PromptTemplate,
        BaseReferences<_$AppDatabase, $PromptTemplatesTable, PromptTemplate>,
      ),
      PromptTemplate,
      PrefetchHooks Function()
    >;
typedef $$CitationCacheTableCreateCompanionBuilder =
    CitationCacheCompanion Function({
      Value<int> id,
      required String source,
      required String externalId,
      required String citeKey,
      required String title,
      required String authorsJson,
      Value<int?> year,
      Value<String?> journal,
      Value<String?> volume,
      Value<String?> issue,
      Value<String?> pages,
      Value<String?> doi,
      Value<String?> url,
      Value<String?> apaFormatted,
      Value<String?> ieeeFormatted,
      Value<String?> chicagoFormatted,
      Value<String?> indonesiaFormatted,
      required String rawJson,
      Value<DateTime> lastSyncedAt,
    });
typedef $$CitationCacheTableUpdateCompanionBuilder =
    CitationCacheCompanion Function({
      Value<int> id,
      Value<String> source,
      Value<String> externalId,
      Value<String> citeKey,
      Value<String> title,
      Value<String> authorsJson,
      Value<int?> year,
      Value<String?> journal,
      Value<String?> volume,
      Value<String?> issue,
      Value<String?> pages,
      Value<String?> doi,
      Value<String?> url,
      Value<String?> apaFormatted,
      Value<String?> ieeeFormatted,
      Value<String?> chicagoFormatted,
      Value<String?> indonesiaFormatted,
      Value<String> rawJson,
      Value<DateTime> lastSyncedAt,
    });

final class $$CitationCacheTableReferences
    extends
        BaseReferences<_$AppDatabase, $CitationCacheTable, CitationCacheData> {
  $$CitationCacheTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$DocumentCitationsTable, List<DocumentCitation>>
  _documentCitationsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.documentCitations,
        aliasName: $_aliasNameGenerator(
          db.citationCache.id,
          db.documentCitations.citationId,
        ),
      );

  $$DocumentCitationsTableProcessedTableManager get documentCitationsRefs {
    final manager = $$DocumentCitationsTableTableManager(
      $_db,
      $_db.documentCitations,
    ).filter((f) => f.citationId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _documentCitationsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$CitationCacheTableFilterComposer
    extends Composer<_$AppDatabase, $CitationCacheTable> {
  $$CitationCacheTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get citeKey => $composableBuilder(
    column: $table.citeKey,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get authorsJson => $composableBuilder(
    column: $table.authorsJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get journal => $composableBuilder(
    column: $table.journal,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get issue => $composableBuilder(
    column: $table.issue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get pages => $composableBuilder(
    column: $table.pages,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get doi => $composableBuilder(
    column: $table.doi,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get apaFormatted => $composableBuilder(
    column: $table.apaFormatted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ieeeFormatted => $composableBuilder(
    column: $table.ieeeFormatted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chicagoFormatted => $composableBuilder(
    column: $table.chicagoFormatted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get indonesiaFormatted => $composableBuilder(
    column: $table.indonesiaFormatted,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> documentCitationsRefs(
    Expression<bool> Function($$DocumentCitationsTableFilterComposer f) f,
  ) {
    final $$DocumentCitationsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.documentCitations,
      getReferencedColumn: (t) => t.citationId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentCitationsTableFilterComposer(
            $db: $db,
            $table: $db.documentCitations,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$CitationCacheTableOrderingComposer
    extends Composer<_$AppDatabase, $CitationCacheTable> {
  $$CitationCacheTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get source => $composableBuilder(
    column: $table.source,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get citeKey => $composableBuilder(
    column: $table.citeKey,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get authorsJson => $composableBuilder(
    column: $table.authorsJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get journal => $composableBuilder(
    column: $table.journal,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get volume => $composableBuilder(
    column: $table.volume,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get issue => $composableBuilder(
    column: $table.issue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get pages => $composableBuilder(
    column: $table.pages,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get doi => $composableBuilder(
    column: $table.doi,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get url => $composableBuilder(
    column: $table.url,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get apaFormatted => $composableBuilder(
    column: $table.apaFormatted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ieeeFormatted => $composableBuilder(
    column: $table.ieeeFormatted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chicagoFormatted => $composableBuilder(
    column: $table.chicagoFormatted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get indonesiaFormatted => $composableBuilder(
    column: $table.indonesiaFormatted,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get rawJson => $composableBuilder(
    column: $table.rawJson,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CitationCacheTableAnnotationComposer
    extends Composer<_$AppDatabase, $CitationCacheTable> {
  $$CitationCacheTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get source =>
      $composableBuilder(column: $table.source, builder: (column) => column);

  GeneratedColumn<String> get externalId => $composableBuilder(
    column: $table.externalId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get citeKey =>
      $composableBuilder(column: $table.citeKey, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get authorsJson => $composableBuilder(
    column: $table.authorsJson,
    builder: (column) => column,
  );

  GeneratedColumn<int> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get journal =>
      $composableBuilder(column: $table.journal, builder: (column) => column);

  GeneratedColumn<String> get volume =>
      $composableBuilder(column: $table.volume, builder: (column) => column);

  GeneratedColumn<String> get issue =>
      $composableBuilder(column: $table.issue, builder: (column) => column);

  GeneratedColumn<String> get pages =>
      $composableBuilder(column: $table.pages, builder: (column) => column);

  GeneratedColumn<String> get doi =>
      $composableBuilder(column: $table.doi, builder: (column) => column);

  GeneratedColumn<String> get url =>
      $composableBuilder(column: $table.url, builder: (column) => column);

  GeneratedColumn<String> get apaFormatted => $composableBuilder(
    column: $table.apaFormatted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ieeeFormatted => $composableBuilder(
    column: $table.ieeeFormatted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get chicagoFormatted => $composableBuilder(
    column: $table.chicagoFormatted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get indonesiaFormatted => $composableBuilder(
    column: $table.indonesiaFormatted,
    builder: (column) => column,
  );

  GeneratedColumn<String> get rawJson =>
      $composableBuilder(column: $table.rawJson, builder: (column) => column);

  GeneratedColumn<DateTime> get lastSyncedAt => $composableBuilder(
    column: $table.lastSyncedAt,
    builder: (column) => column,
  );

  Expression<T> documentCitationsRefs<T extends Object>(
    Expression<T> Function($$DocumentCitationsTableAnnotationComposer a) f,
  ) {
    final $$DocumentCitationsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.documentCitations,
          getReferencedColumn: (t) => t.citationId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$DocumentCitationsTableAnnotationComposer(
                $db: $db,
                $table: $db.documentCitations,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$CitationCacheTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CitationCacheTable,
          CitationCacheData,
          $$CitationCacheTableFilterComposer,
          $$CitationCacheTableOrderingComposer,
          $$CitationCacheTableAnnotationComposer,
          $$CitationCacheTableCreateCompanionBuilder,
          $$CitationCacheTableUpdateCompanionBuilder,
          (CitationCacheData, $$CitationCacheTableReferences),
          CitationCacheData,
          PrefetchHooks Function({bool documentCitationsRefs})
        > {
  $$CitationCacheTableTableManager(_$AppDatabase db, $CitationCacheTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CitationCacheTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CitationCacheTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CitationCacheTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> source = const Value.absent(),
                Value<String> externalId = const Value.absent(),
                Value<String> citeKey = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> authorsJson = const Value.absent(),
                Value<int?> year = const Value.absent(),
                Value<String?> journal = const Value.absent(),
                Value<String?> volume = const Value.absent(),
                Value<String?> issue = const Value.absent(),
                Value<String?> pages = const Value.absent(),
                Value<String?> doi = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> apaFormatted = const Value.absent(),
                Value<String?> ieeeFormatted = const Value.absent(),
                Value<String?> chicagoFormatted = const Value.absent(),
                Value<String?> indonesiaFormatted = const Value.absent(),
                Value<String> rawJson = const Value.absent(),
                Value<DateTime> lastSyncedAt = const Value.absent(),
              }) => CitationCacheCompanion(
                id: id,
                source: source,
                externalId: externalId,
                citeKey: citeKey,
                title: title,
                authorsJson: authorsJson,
                year: year,
                journal: journal,
                volume: volume,
                issue: issue,
                pages: pages,
                doi: doi,
                url: url,
                apaFormatted: apaFormatted,
                ieeeFormatted: ieeeFormatted,
                chicagoFormatted: chicagoFormatted,
                indonesiaFormatted: indonesiaFormatted,
                rawJson: rawJson,
                lastSyncedAt: lastSyncedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String source,
                required String externalId,
                required String citeKey,
                required String title,
                required String authorsJson,
                Value<int?> year = const Value.absent(),
                Value<String?> journal = const Value.absent(),
                Value<String?> volume = const Value.absent(),
                Value<String?> issue = const Value.absent(),
                Value<String?> pages = const Value.absent(),
                Value<String?> doi = const Value.absent(),
                Value<String?> url = const Value.absent(),
                Value<String?> apaFormatted = const Value.absent(),
                Value<String?> ieeeFormatted = const Value.absent(),
                Value<String?> chicagoFormatted = const Value.absent(),
                Value<String?> indonesiaFormatted = const Value.absent(),
                required String rawJson,
                Value<DateTime> lastSyncedAt = const Value.absent(),
              }) => CitationCacheCompanion.insert(
                id: id,
                source: source,
                externalId: externalId,
                citeKey: citeKey,
                title: title,
                authorsJson: authorsJson,
                year: year,
                journal: journal,
                volume: volume,
                issue: issue,
                pages: pages,
                doi: doi,
                url: url,
                apaFormatted: apaFormatted,
                ieeeFormatted: ieeeFormatted,
                chicagoFormatted: chicagoFormatted,
                indonesiaFormatted: indonesiaFormatted,
                rawJson: rawJson,
                lastSyncedAt: lastSyncedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CitationCacheTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({documentCitationsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (documentCitationsRefs) db.documentCitations,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (documentCitationsRefs)
                    await $_getPrefetchedData<
                      CitationCacheData,
                      $CitationCacheTable,
                      DocumentCitation
                    >(
                      currentTable: table,
                      referencedTable: $$CitationCacheTableReferences
                          ._documentCitationsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$CitationCacheTableReferences(
                            db,
                            table,
                            p0,
                          ).documentCitationsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.citationId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$CitationCacheTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CitationCacheTable,
      CitationCacheData,
      $$CitationCacheTableFilterComposer,
      $$CitationCacheTableOrderingComposer,
      $$CitationCacheTableAnnotationComposer,
      $$CitationCacheTableCreateCompanionBuilder,
      $$CitationCacheTableUpdateCompanionBuilder,
      (CitationCacheData, $$CitationCacheTableReferences),
      CitationCacheData,
      PrefetchHooks Function({bool documentCitationsRefs})
    >;
typedef $$RagIndexMetadataTableCreateCompanionBuilder =
    RagIndexMetadataCompanion Function({
      Value<int> id,
      required String filePath,
      required String fileName,
      required String fileHash,
      required int fileSizeBytes,
      Value<int?> pageCount,
      Value<int?> chunkCount,
      Value<String> collectionName,
      Value<String> indexStatus,
      Value<String?> errorMessage,
      Value<DateTime?> indexedAt,
      Value<DateTime> createdAt,
    });
typedef $$RagIndexMetadataTableUpdateCompanionBuilder =
    RagIndexMetadataCompanion Function({
      Value<int> id,
      Value<String> filePath,
      Value<String> fileName,
      Value<String> fileHash,
      Value<int> fileSizeBytes,
      Value<int?> pageCount,
      Value<int?> chunkCount,
      Value<String> collectionName,
      Value<String> indexStatus,
      Value<String?> errorMessage,
      Value<DateTime?> indexedAt,
      Value<DateTime> createdAt,
    });

class $$RagIndexMetadataTableFilterComposer
    extends Composer<_$AppDatabase, $RagIndexMetadataTable> {
  $$RagIndexMetadataTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileHash => $composableBuilder(
    column: $table.fileHash,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get chunkCount => $composableBuilder(
    column: $table.chunkCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get collectionName => $composableBuilder(
    column: $table.collectionName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get indexStatus => $composableBuilder(
    column: $table.indexStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get indexedAt => $composableBuilder(
    column: $table.indexedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$RagIndexMetadataTableOrderingComposer
    extends Composer<_$AppDatabase, $RagIndexMetadataTable> {
  $$RagIndexMetadataTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filePath => $composableBuilder(
    column: $table.filePath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileName => $composableBuilder(
    column: $table.fileName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileHash => $composableBuilder(
    column: $table.fileHash,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get pageCount => $composableBuilder(
    column: $table.pageCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get chunkCount => $composableBuilder(
    column: $table.chunkCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get collectionName => $composableBuilder(
    column: $table.collectionName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get indexStatus => $composableBuilder(
    column: $table.indexStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get indexedAt => $composableBuilder(
    column: $table.indexedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$RagIndexMetadataTableAnnotationComposer
    extends Composer<_$AppDatabase, $RagIndexMetadataTable> {
  $$RagIndexMetadataTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get filePath =>
      $composableBuilder(column: $table.filePath, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get fileHash =>
      $composableBuilder(column: $table.fileHash, builder: (column) => column);

  GeneratedColumn<int> get fileSizeBytes => $composableBuilder(
    column: $table.fileSizeBytes,
    builder: (column) => column,
  );

  GeneratedColumn<int> get pageCount =>
      $composableBuilder(column: $table.pageCount, builder: (column) => column);

  GeneratedColumn<int> get chunkCount => $composableBuilder(
    column: $table.chunkCount,
    builder: (column) => column,
  );

  GeneratedColumn<String> get collectionName => $composableBuilder(
    column: $table.collectionName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get indexStatus => $composableBuilder(
    column: $table.indexStatus,
    builder: (column) => column,
  );

  GeneratedColumn<String> get errorMessage => $composableBuilder(
    column: $table.errorMessage,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get indexedAt =>
      $composableBuilder(column: $table.indexedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$RagIndexMetadataTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $RagIndexMetadataTable,
          RagIndexMetadataData,
          $$RagIndexMetadataTableFilterComposer,
          $$RagIndexMetadataTableOrderingComposer,
          $$RagIndexMetadataTableAnnotationComposer,
          $$RagIndexMetadataTableCreateCompanionBuilder,
          $$RagIndexMetadataTableUpdateCompanionBuilder,
          (
            RagIndexMetadataData,
            BaseReferences<
              _$AppDatabase,
              $RagIndexMetadataTable,
              RagIndexMetadataData
            >,
          ),
          RagIndexMetadataData,
          PrefetchHooks Function()
        > {
  $$RagIndexMetadataTableTableManager(
    _$AppDatabase db,
    $RagIndexMetadataTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RagIndexMetadataTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RagIndexMetadataTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RagIndexMetadataTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> filePath = const Value.absent(),
                Value<String> fileName = const Value.absent(),
                Value<String> fileHash = const Value.absent(),
                Value<int> fileSizeBytes = const Value.absent(),
                Value<int?> pageCount = const Value.absent(),
                Value<int?> chunkCount = const Value.absent(),
                Value<String> collectionName = const Value.absent(),
                Value<String> indexStatus = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<DateTime?> indexedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RagIndexMetadataCompanion(
                id: id,
                filePath: filePath,
                fileName: fileName,
                fileHash: fileHash,
                fileSizeBytes: fileSizeBytes,
                pageCount: pageCount,
                chunkCount: chunkCount,
                collectionName: collectionName,
                indexStatus: indexStatus,
                errorMessage: errorMessage,
                indexedAt: indexedAt,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String filePath,
                required String fileName,
                required String fileHash,
                required int fileSizeBytes,
                Value<int?> pageCount = const Value.absent(),
                Value<int?> chunkCount = const Value.absent(),
                Value<String> collectionName = const Value.absent(),
                Value<String> indexStatus = const Value.absent(),
                Value<String?> errorMessage = const Value.absent(),
                Value<DateTime?> indexedAt = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => RagIndexMetadataCompanion.insert(
                id: id,
                filePath: filePath,
                fileName: fileName,
                fileHash: fileHash,
                fileSizeBytes: fileSizeBytes,
                pageCount: pageCount,
                chunkCount: chunkCount,
                collectionName: collectionName,
                indexStatus: indexStatus,
                errorMessage: errorMessage,
                indexedAt: indexedAt,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$RagIndexMetadataTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $RagIndexMetadataTable,
      RagIndexMetadataData,
      $$RagIndexMetadataTableFilterComposer,
      $$RagIndexMetadataTableOrderingComposer,
      $$RagIndexMetadataTableAnnotationComposer,
      $$RagIndexMetadataTableCreateCompanionBuilder,
      $$RagIndexMetadataTableUpdateCompanionBuilder,
      (
        RagIndexMetadataData,
        BaseReferences<
          _$AppDatabase,
          $RagIndexMetadataTable,
          RagIndexMetadataData
        >,
      ),
      RagIndexMetadataData,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      Value<String> valueType,
      Value<String?> description,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<String> valueType,
      Value<String?> description,
      Value<DateTime> updatedAt,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get valueType => $composableBuilder(
    column: $table.valueType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get valueType =>
      $composableBuilder(column: $table.valueType, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSetting,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSetting,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
          ),
          AppSetting,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<String> valueType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(
                key: key,
                value: value,
                valueType: valueType,
                description: description,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<String> valueType = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                valueType: valueType,
                description: description,
                updatedAt: updatedAt,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSetting,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSetting,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSetting>,
      ),
      AppSetting,
      PrefetchHooks Function()
    >;
typedef $$DocumentCitationsTableCreateCompanionBuilder =
    DocumentCitationsCompanion Function({
      Value<int> id,
      required int documentId,
      required int citationId,
      Value<int> positionIndex,
      Value<int> inlineCount,
      Value<DateTime> insertedAt,
    });
typedef $$DocumentCitationsTableUpdateCompanionBuilder =
    DocumentCitationsCompanion Function({
      Value<int> id,
      Value<int> documentId,
      Value<int> citationId,
      Value<int> positionIndex,
      Value<int> inlineCount,
      Value<DateTime> insertedAt,
    });

final class $$DocumentCitationsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $DocumentCitationsTable,
          DocumentCitation
        > {
  $$DocumentCitationsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $DocumentsTable _documentIdTable(_$AppDatabase db) =>
      db.documents.createAlias(
        $_aliasNameGenerator(db.documentCitations.documentId, db.documents.id),
      );

  $$DocumentsTableProcessedTableManager get documentId {
    final $_column = $_itemColumn<int>('document_id')!;

    final manager = $$DocumentsTableTableManager(
      $_db,
      $_db.documents,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_documentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $CitationCacheTable _citationIdTable(_$AppDatabase db) =>
      db.citationCache.createAlias(
        $_aliasNameGenerator(
          db.documentCitations.citationId,
          db.citationCache.id,
        ),
      );

  $$CitationCacheTableProcessedTableManager get citationId {
    final $_column = $_itemColumn<int>('citation_id')!;

    final manager = $$CitationCacheTableTableManager(
      $_db,
      $_db.citationCache,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_citationIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$DocumentCitationsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentCitationsTable> {
  $$DocumentCitationsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get positionIndex => $composableBuilder(
    column: $table.positionIndex,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get inlineCount => $composableBuilder(
    column: $table.inlineCount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get insertedAt => $composableBuilder(
    column: $table.insertedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$DocumentsTableFilterComposer get documentId {
    final $$DocumentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.documentId,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableFilterComposer(
            $db: $db,
            $table: $db.documents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CitationCacheTableFilterComposer get citationId {
    final $$CitationCacheTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.citationId,
      referencedTable: $db.citationCache,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CitationCacheTableFilterComposer(
            $db: $db,
            $table: $db.citationCache,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentCitationsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentCitationsTable> {
  $$DocumentCitationsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get positionIndex => $composableBuilder(
    column: $table.positionIndex,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get inlineCount => $composableBuilder(
    column: $table.inlineCount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get insertedAt => $composableBuilder(
    column: $table.insertedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$DocumentsTableOrderingComposer get documentId {
    final $$DocumentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.documentId,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableOrderingComposer(
            $db: $db,
            $table: $db.documents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CitationCacheTableOrderingComposer get citationId {
    final $$CitationCacheTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.citationId,
      referencedTable: $db.citationCache,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CitationCacheTableOrderingComposer(
            $db: $db,
            $table: $db.citationCache,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentCitationsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentCitationsTable> {
  $$DocumentCitationsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get positionIndex => $composableBuilder(
    column: $table.positionIndex,
    builder: (column) => column,
  );

  GeneratedColumn<int> get inlineCount => $composableBuilder(
    column: $table.inlineCount,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get insertedAt => $composableBuilder(
    column: $table.insertedAt,
    builder: (column) => column,
  );

  $$DocumentsTableAnnotationComposer get documentId {
    final $$DocumentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.documentId,
      referencedTable: $db.documents,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$DocumentsTableAnnotationComposer(
            $db: $db,
            $table: $db.documents,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$CitationCacheTableAnnotationComposer get citationId {
    final $$CitationCacheTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.citationId,
      referencedTable: $db.citationCache,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CitationCacheTableAnnotationComposer(
            $db: $db,
            $table: $db.citationCache,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$DocumentCitationsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentCitationsTable,
          DocumentCitation,
          $$DocumentCitationsTableFilterComposer,
          $$DocumentCitationsTableOrderingComposer,
          $$DocumentCitationsTableAnnotationComposer,
          $$DocumentCitationsTableCreateCompanionBuilder,
          $$DocumentCitationsTableUpdateCompanionBuilder,
          (DocumentCitation, $$DocumentCitationsTableReferences),
          DocumentCitation,
          PrefetchHooks Function({bool documentId, bool citationId})
        > {
  $$DocumentCitationsTableTableManager(
    _$AppDatabase db,
    $DocumentCitationsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentCitationsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentCitationsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentCitationsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> documentId = const Value.absent(),
                Value<int> citationId = const Value.absent(),
                Value<int> positionIndex = const Value.absent(),
                Value<int> inlineCount = const Value.absent(),
                Value<DateTime> insertedAt = const Value.absent(),
              }) => DocumentCitationsCompanion(
                id: id,
                documentId: documentId,
                citationId: citationId,
                positionIndex: positionIndex,
                inlineCount: inlineCount,
                insertedAt: insertedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int documentId,
                required int citationId,
                Value<int> positionIndex = const Value.absent(),
                Value<int> inlineCount = const Value.absent(),
                Value<DateTime> insertedAt = const Value.absent(),
              }) => DocumentCitationsCompanion.insert(
                id: id,
                documentId: documentId,
                citationId: citationId,
                positionIndex: positionIndex,
                inlineCount: inlineCount,
                insertedAt: insertedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$DocumentCitationsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({documentId = false, citationId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (documentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.documentId,
                                referencedTable:
                                    $$DocumentCitationsTableReferences
                                        ._documentIdTable(db),
                                referencedColumn:
                                    $$DocumentCitationsTableReferences
                                        ._documentIdTable(db)
                                        .id,
                              )
                              as T;
                    }
                    if (citationId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.citationId,
                                referencedTable:
                                    $$DocumentCitationsTableReferences
                                        ._citationIdTable(db),
                                referencedColumn:
                                    $$DocumentCitationsTableReferences
                                        ._citationIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$DocumentCitationsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentCitationsTable,
      DocumentCitation,
      $$DocumentCitationsTableFilterComposer,
      $$DocumentCitationsTableOrderingComposer,
      $$DocumentCitationsTableAnnotationComposer,
      $$DocumentCitationsTableCreateCompanionBuilder,
      $$DocumentCitationsTableUpdateCompanionBuilder,
      (DocumentCitation, $$DocumentCitationsTableReferences),
      DocumentCitation,
      PrefetchHooks Function({bool documentId, bool citationId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$DocumentsTableTableManager get documents =>
      $$DocumentsTableTableManager(_db, _db.documents);
  $$ChatHistoryEntriesTableTableManager get chatHistoryEntries =>
      $$ChatHistoryEntriesTableTableManager(_db, _db.chatHistoryEntries);
  $$PromptTemplatesTableTableManager get promptTemplates =>
      $$PromptTemplatesTableTableManager(_db, _db.promptTemplates);
  $$CitationCacheTableTableManager get citationCache =>
      $$CitationCacheTableTableManager(_db, _db.citationCache);
  $$RagIndexMetadataTableTableManager get ragIndexMetadata =>
      $$RagIndexMetadataTableTableManager(_db, _db.ragIndexMetadata);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
  $$DocumentCitationsTableTableManager get documentCitations =>
      $$DocumentCitationsTableTableManager(_db, _db.documentCitations);
}
