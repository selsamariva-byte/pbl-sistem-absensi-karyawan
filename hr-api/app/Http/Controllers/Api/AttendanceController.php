<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Attendance;
use Illuminate\Http\Request;

class AttendanceController extends Controller
{
    public function index()
    {
        return Attendance::with('employee')
            ->orderByDesc('tanggal')
            ->get();
    }
    public function checkIn(Request $request)
    {
        $jamMasuk = now();
        $status = $jamMasuk->gt(now()->setTime(8, 0))
            ? 'Terlambat'
            : 'Hadir';

        $attendance = Attendance::create([
            'employee_id' => $request->employee_id,
            'tanggal' => now()->toDateString(),
            'check_in' => $jamMasuk->format('H:i:s'),
            'status' => $status,
        ]);

        return response()->json([
            'success' => true,
            'data' => $attendance
        ]);
    }

    public function checkOut(Request $request)
    {
        $attendance = Attendance::query()->where('employee_id', $request->employee_id)
        ->whereDate('tanggal', today())
        ->first();

        if (!$attendance) {
            return response()->json([
                'success' => false,
                'message' => 'Belum check in'
            ]);
        }

        $jamKeluar = now();

        $jamMasuk = \Carbon\Carbon::parse(
            $attendance->tanggal . ' ' . $attendance->check_in
        );

        $durasi = $jamMasuk->diff($jamKeluar);

        $attendance->update([
            'check_out' => $jamKeluar->format('H:i:s'),
            'total_kerja' => $durasi->format('%h Jam %i Menit'),
        ]);

        return response()->json([
            'success' => true,
            'data' => $attendance
        ]);
    }

    public function today(int $employee_id)
    {
        $attendance = Attendance::query()
            ->where('employee_id', $employee_id)
            ->whereDate('tanggal', today())
            ->first();

        if (!$attendance) {
            return response()->json([]);
        }

        return response()->json($attendance);
    }

    public function history(int $employee_id)
    {
        $attendance = Attendance::query()->where('employee_id', $employee_id)
            ->orderByDesc('tanggal')
            ->orderByDesc('check_in')
            ->get();

        return response()->json($attendance);
    }

    public function report($employee_id, $bulan)
    {
        $hadir = Attendance::query()
            ->where('employee_id', $employee_id)
            ->whereMonth('tanggal', $bulan)
            ->count();

        $terlambat = Attendance::query()
            ->where('employee_id', $employee_id)
            ->whereMonth('tanggal', $bulan)
            ->where('status', 'Terlambat')
            ->count();

        $lembur = 0;
        $alpha = 0;

        return response()->json([
            'hadir' => $hadir,
            'terlambat' => $terlambat,
            'lembur' => $lembur,
            'alpha' => $alpha,
        ]);
    }

    public function payroll($employee_id, $bulan)
    {
        $hadir = Attendance::query()
            ->where('employee_id', $employee_id)
            ->whereMonth('tanggal', $bulan)
            ->count();

        $terlambat = Attendance::query()
            ->where('employee_id', $employee_id)
            ->whereMonth('tanggal', $bulan)
            ->where('status', 'Terlambat')
            ->count();

        $gajiPokok = 4000000;
        $tunjanganHadir = $hadir * 20000;
        $bonusLembur = 0;
        $potonganTelat = $terlambat * 25000;

        $total = $gajiPokok + $tunjanganHadir + $bonusLembur - $potonganTelat;

        return response()->json([
            "gaji_pokok" => $gajiPokok,
            "tunjangan_hadir" => $tunjanganHadir,
            "bonus_lembur" => $bonusLembur,
            "potongan_telat" => $potonganTelat,
            "total" => $total,
        ]);
    }
}