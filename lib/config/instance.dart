import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final FirebaseFirestore _store = FirebaseFirestore.instance;

FirebaseAuth auth() => _auth;
FirebaseFirestore store() => _store;
