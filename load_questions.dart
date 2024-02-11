import 'dart:convert';
import 'dart:io';

import 'package:dart_appwrite/dart_appwrite.dart';

Client client = Client();

void main() async {
  const collectionId = '65c5e.....2aeca5';
  const databaseId = '444..4..4';
  client
      .setEndpoint("https://appw.../v1")
      .setProject("658....ba45")
      .setKey("f883e........02d");
  File json = File('./quiz.json');
  final questions = jsonDecode(json.readAsStringSync());

  Databases db = Databases(client);

  // await db.create(name: 'default');

  // await db.createCollection(
  //     collectionId: collectionId,
  //     name: "Quiz Questions",
  //     permission: 'collection',
  //     read: ["role:all"],
  //     write: ["role:member"]);

  // await db.createStringAttribute(
  //   collectionId: collectionId,
  //   key: 'question',
  //   size: 255,
  //   xrequired: true,
  // );

  // await db.createStringAttribute(
  //   collectionId: collectionId,
  //   key: 'options',
  //   size: 255,
  //   xrequired: false,
  //   array: true,
  // );

  // await db.createStringAttribute(
  //   collectionId: collectionId,
  //   key: 'answer',
  //   size: 255,
  //   xrequired: true,
  // );

  await Future.delayed(const Duration(seconds: 2));

  for (final question in questions) {
    await db.createDocument(
      documentId: "unique()",
      collectionId: collectionId,
      data: question,
      databaseId: databaseId,
    );

    print(question);
  }

  print("CollectionID: $collectionId");
}
