<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\LeaveRequest;
use Illuminate\Http\Request;
use App\Services\FirebaseService;
use App\Models\Employee;

class LeaveController extends Controller
{
    public function index()
    {
        return response()->json(
            LeaveRequest::with('employee')->get()
        );
    }

    public function store(Request $request)
    {
        $request->validate([
            'employee_id' => 'required',
            'jenis' => 'required',
            'start_date' => 'required|date',
            'end_date' => 'required|date',
            'reason' => 'required',
            'jam_mulai' => 'nullable',
            'jam_selesai' => 'nullable',
        ]);
        $leave = LeaveRequest::create([
            'employee_id' => $request->employee_id,
            'jenis' => $request->jenis,
            'start_date' => $request->start_date,
            'end_date' => $request->end_date,
            'jam_mulai' => $request->jam_mulai,
            'jam_selesai' => $request->jam_selesai,
            'reason' => $request->reason,
            'status' => 'pending'
        ]);

        return response()->json([
            'message' => 'Pengajuan berhasil',
            'data' => $leave
        ]);
    }    

    public function approve($id)
    {
        $leave = LeaveRequest::findOrFail($id);

        $leave->status = 'approved';
        $leave->save();

        $employee = Employee::query()
            ->where('id', $leave->employee_id)
            ->first();

        if ($employee && $employee->fcm_token) {
            $firebase = new FirebaseService();
            dd($leave->employee_id, $employee);
            $firebase->sendNotification(
                $employee->fcm_token,
                "Pengajuan Cuti",
                "Pengajuan cuti Anda telah disetujui."
            );
        }

        return response()->json([
            'message' => 'Cuti disetujui'
        ]);
    }

    public function reject($id)
    {
        $leave = LeaveRequest::findOrFail($id);

        $leave->status = 'rejected';
        $leave->save();

        $employee = Employee::query()
            ->where('id', $leave->employee_id)
            ->first();
        if ($employee && $employee->fcm_token) {
            $firebase = new FirebaseService();

            $firebase->sendNotification(
                $employee->fcm_token,
                "Pengajuan Cuti",
                "Maaf, pengajuan cuti Anda ditolak."
            );
        }

        return response()->json([
            'message' => 'Cuti ditolak'
        ]);
    }
    public function history($employee_id)
    {
        $data = LeaveRequest::query()
            ->where('employee_id', $employee_id)
            ->latest()
            ->get();

        return response()->json($data);
    }
}