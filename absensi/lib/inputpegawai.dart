import 'package:flutter/material.dart';
import 'camera.dart';
import 'dashboard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:absensi/config/config.dart';
import 'package:image_picker/image_picker.dart';

class FormPegawaiPage extends StatefulWidget {
  const FormPegawaiPage({super.key});

  @override
  State<FormPegawaiPage> createState() =>
      _FormPegawaiPageState();
}

class _FormPegawaiPageState
    extends State<FormPegawaiPage> {

  final nip =
      TextEditingController();
  final nama =
      TextEditingController();
  final email =
      TextEditingController();
  final hp =
      TextEditingController();
  final role =
      TextEditingController();
  final address =
      TextEditingController();
  String? selectedDivision;
  final List<String> divisionList = [
    "Software Engineer",
    "UI/UX Designer",
    "HR Department",
    "Finance",
    "Sales & Marketing",
    "IT",
    "Customer Support",
    "Multimedia"
  ];
  File? imageFile;
  String fotoProfile = "";
  
  @override
  void initState() {
    super.initState();

    loadData();
  }

  Future<void> loadData() async {

    final prefs =
        await SharedPreferences.getInstance();
    
    nip.text =
        prefs.getString("nip") ?? "";

    nama.text =
        prefs.getString("nama") ?? "";

    email.text =
        prefs.getString("email") ?? "";

    hp.text =
        prefs.getString("hp") ?? "";

    role.text =
        prefs.getString("role") ?? "";

    selectedDivision = prefs.getString("division");

    address.text =
        prefs.getString("address") ?? "";
        
    
    String foto = prefs.getString("foto") ?? "";

    if (foto.isNotEmpty) {
      fotoProfile = foto;
    }


    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          const Color(0xfff5f7fb),

      appBar: AppBar(
        title:
            const Text("Data Pegawai"),
        centerTitle: true,
        backgroundColor:
            const Color(0xff0d6efd),
        foregroundColor:
            Colors.white,
      ),

      body: ListView(
        padding:
            const EdgeInsets.all(16),
        children: [

          // FOTO PROFILE
          Center(
            child: Stack(
              children: [

                Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                    image: imageFile != null
                      ? DecorationImage(
                          image: FileImage(imageFile!),
                          fit: BoxFit.cover,
                        )
                      : fotoProfile.isNotEmpty
                          ? DecorationImage(
                              image: NetworkImage(
                                "${ApiConfig.baseUrl.replaceAll('/api', '')}/storage/$fotoProfile",
                              ),
                              fit: BoxFit.cover,
                            )
                          : null,
                  ),

                  child: imageFile == null && fotoProfile.isEmpty
                    ? const Icon(
                        Icons.person,
                        size: 55,
                        color: Colors.grey,
                      )
                    : null,
                ),

                Positioned(
                  right: 0,
                  bottom: 0,

                  child: InkWell(

                    onTap: () async {
                      showModalBottomSheet(
                        context: context,
                        builder: (context) {
                          return SafeArea(
                            child: Wrap(
                              children: [
                                ListTile(
                                  leading: const Icon(Icons.camera_alt),
                                  title: const Text("Ambil Foto"),
                                  onTap: () async {
                                    Navigator.pop(context);

                                    final result = await Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => const CameraPage(),
                                      ),
                                    );

                                    if (result != null) {
                                      setState(() {
                                        imageFile = File(result);
                                      });
                                    }
                                  },
                                ),

                                ListTile(
                                  leading: const Icon(Icons.photo_library),
                                  title: const Text("Pilih dari Galeri"),
                                  onTap: () async {
                                    Navigator.pop(context);

                                    final picker = ImagePicker();

                                    final XFile? picked = await picker.pickImage(
                                      source: ImageSource.gallery,
                                      imageQuality: 70,
                                    );

                                    if (picked != null) {
                                      setState(() {
                                        imageFile = File(picked.path);
                                      });
                                    }
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    }, 
                    child: Container(
                      padding:
                          const EdgeInsets.all(10),

                      decoration:
                          const BoxDecoration(
                        color: Color(0xff0d6efd),
                        shape: BoxShape.circle,
                      ),

                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 28),

          inputBox(
            "NIP",
            nip,
            Icons.badge,
          ),

          inputBox(
            "Nama Pegawai",
            nama,
            Icons.person,
          ),

          inputBox(
            "Email",
            email,
            Icons.email,
          ),

          inputBox(
            "No HP",
            hp,
            Icons.phone,
          ),

          inputBox(
            "Role",
            role,
            Icons.work,
          ),

          Container(
            margin: const EdgeInsets.only(bottom: 14),
            child: DropdownButtonFormField<String>(
              value: selectedDivision,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.apartment),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
              items: divisionList.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDivision = value;
                });
              },
            ),
          ),

          inputBox(
            "Address",
            address,
            Icons.location_on,
          ),

          const SizedBox(height: 24),

          ElevatedButton(
            onPressed: () async {

              if (
                  nip.text.isEmpty ||
                  nama.text.isEmpty ||
                  email.text.isEmpty ||
                  hp.text.isEmpty ||
                  role.text.isEmpty
              ) {

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content: Text(
                      "Semua data wajib diisi",
                    ),
                  ),
                );

                return;
              }
              final prefs =
                  await SharedPreferences.getInstance();

              int employeeId = prefs.getInt("employee_id") ?? 0;

              print(employeeId);

              var request = http.MultipartRequest(
                "POST",
                Uri.parse("${ApiConfig.baseUrl}/employees/$employeeId"),
              );

              request.fields["_method"] = "PUT";
              request.fields["nama"] = nama.text;
              request.fields["email"] = email.text;
              request.fields["nip"] = nip.text;
              request.fields["phone"] = hp.text;
              request.fields["role"] = role.text;
              request.fields["divisi"] = selectedDivision ?? "";
              request.fields["alamat"] = address.text;
              
              if (imageFile != null) {
                request.files.add(
                  await http.MultipartFile.fromPath(
                    "foto",
                    imageFile!.path,
                  ),
                );
              }
              var streamedResponse = await request.send();

              var response = await http.Response.fromStream(streamedResponse);

              final data = jsonDecode(response.body);
              
              if (data["employee"]["foto"] != null) {
                await prefs.setString(
                  "foto",
                  data["employee"]["foto"],
                );
              }

              if (response.statusCode == 200 && data["success"] == true) {

                await prefs.setString("nama", data["employee"]["nama"] ?? "");
                await prefs.setString("email", data["employee"]["email"] ?? "");
                await prefs.setString("nip", data["employee"]["nip"] ?? "");
                await prefs.setString("role", data["employee"]["role"] ?? "");
                await prefs.setString("hp", data["employee"]["phone"] ?? "");
                await prefs.setString("division", data["employee"]["divisi"] ?? "");
                await prefs.setString("address", data["employee"]["alamat"] ?? "");
                await prefs.setString("joinDate", data["employee"]["join_date"] ?? "");


                Navigator.pop(context);
                // Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(
                //     builder: (_) => MainDashboard(currentIndex: 4),
                //   ),
                //   (route) => false,
                // );

              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(data["message"] ?? "Gagal update profile"),
                  ),
                );
              }
              


            },
            style:
                ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(
                      0xff0d6efd),
              minimumSize:
                  const Size(
                      double.infinity,
                      55),
              shape:
                  RoundedRectangleBorder(
                borderRadius:
                    BorderRadius
                        .circular(
                            16),
              ),
            ),
            child: const Text(
              "SIMPAN DATA",
              style: TextStyle(
                color:
                    Colors.white,
                fontWeight:
                    FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget inputBox(
    String hint,
    TextEditingController c,
    IconData icon,
  ) {
    return Container(
      margin:
          const EdgeInsets.only(
              bottom: 14),
      child: TextField(
        controller: c,
        decoration:
            InputDecoration(
          prefixIcon:
              Icon(icon),
          hintText: hint,
          filled: true,
          fillColor:
              Colors.white,
          border:
              OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(
                    16),
            borderSide:
                BorderSide.none,
          ),
        ),
      ),
    );
  }
}