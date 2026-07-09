<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Employee;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;

class EmployeeController extends Controller
{
    public function index()
    {
        return response()->json(
            Employee::all()
        );
    }
    public function show($id)
    {
        return Employee::findOrFail($id);
    }

    public function update(Request $request, $id)
    {
        $employee = Employee::findOrFail($id);

        $employee->nama = $request->input('nama', $employee->nama);
        $employee->email = $request->input('email', $employee->email);
        $employee->nip = $request->input('nip', $employee->nip);
        $employee->divisi = $request->input('divisi', $employee->divisi);
        $employee->phone = $request->input('phone', $employee->phone);
        $employee->alamat = $request->input('alamat', $employee->alamat);
        $employee->join_date = $request->input('join_date', $employee->join_date);

        // Upload foto
        if ($request->hasFile('foto')) {

            // Hapus foto lama jika ada
            if ($employee->foto && Storage::disk('public')->exists($employee->foto)) {
                Storage::disk('public')->delete($employee->foto);
            }

            // Simpan foto baru
            $path = $request->file('foto')->store('profile', 'public');

            $employee->foto = $path;
        }

        $employee->save();

        return response()->json([
            "success" => true,
            "employee" => $employee,
            "foto_url" => $employee->foto
                ? asset('storage/' . $employee->foto)
                : null,
        ]);
    }
    public function store(Request $request)
    {
        $validated = $request->validate([
            'nip' => 'required|unique:employees,nip',
            'nama' => 'required|string|max:255',
            'email' => 'required|email|unique:employees,email',
            'divisi' => 'required|string|max:255',
            'phone' => 'nullable|string|max:255',
            'alamat' => 'nullable|string',
            'join_date' => 'nullable|date',
            'role' => 'required|in:employee,hr,admin',
            'password' => 'required|min:6',
        ]);

        $validated['password'] = Hash::make($validated['password']);

        $employee = Employee::create($validated);

        return response()->json([
            'message' => 'Pegawai berhasil ditambahkan',
            'data' => $employee,
        ], 201);
    }

    public function updateFcmToken(Request $request, $id)
    {
        $employee = Employee::findOrFail($id);

        $employee->fcm_token = $request->fcm_token;
        $employee->save();

        return response()->json([
            "success" => true,
            "message" => "FCM Token berhasil disimpan"
        ]);
    }

    public function destroy($id)
{
    $employee = Employee::findOrFail($id);
    $employee->delete();

    return response()->json([
        'message' => 'Pegawai berhasil dihapus'
    ]);
}
}