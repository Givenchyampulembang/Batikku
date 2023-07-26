import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InfoAddDataPage extends StatefulWidget {
  const InfoAddDataPage({
    super.key,
    this.data,
  });
  final Map<String, dynamic>? data;

  @override
  State<InfoAddDataPage> createState() => _InfoAddDataPageState();
}

class _InfoAddDataPageState extends State<InfoAddDataPage> {
  TextEditingController idController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController descController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.data is Map) {
      idController.text = widget.data!["id"].toString();
      nameController.text = widget.data!["name"].toString();
      descController.text = widget.data!["desc"].toString();
      priceController.text = widget.data!["price"].toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Data"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            children: [
              TextField(
                controller: idController,
                decoration: const InputDecoration(
                  label: Text("id"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  label: Text("Nama"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: descController,
                maxLines: 4,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  label: Text("Desc"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: priceController,
                maxLines: 4,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  label: Text("Price"),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  FirebaseFirestore.instance
                      .collection("data")
                      .doc(idController.text)
                      .set({
                    "id": idController.text,
                    "name": nameController.text,
                    "desc": descController.text,
                    "price": priceController.text,
                  });
                  Navigator.pop(context);
                },
                child: const Text("Simpan"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
