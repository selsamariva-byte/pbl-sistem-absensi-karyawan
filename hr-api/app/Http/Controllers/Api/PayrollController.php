<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Payroll;
use App\Models\Employee;
use App\Models\Attendance;

class PayrollController extends Controller
{
    public function history($employee_id, $bulan, $tahun)
    {
        $data = Payroll::query()
            ->where('employee_id', $employee_id)
            ->where('bulan', $bulan)
            ->where('tahun', $tahun)
            ->first();

        if (!$data) {
            return response()->json([
                "message" => "Payroll belum tersedia"
            ], 404);
        }

        return response()->json($data);
    }

    public function generate(Request $request)
    {
        $bulan = $request->bulan;
        $tahun = $request->tahun;

        $employees = Employee::all();

        foreach ($employees as $employee) {

            $cek = Payroll::query()
                ->where('employee_id', $employee->id)
                ->where('bulan', $bulan)
                ->where('tahun', $tahun)
                ->exists();

            if ($cek) {
                continue;
            }

            $hadir = Attendance::query()
                ->where('employee_id', $employee->id)
                ->whereMonth('tanggal', $bulan)
                ->whereYear('tanggal', $tahun)
                ->count();

            $terlambat = Attendance::query()
                ->where('employee_id', $employee->id)
                ->whereMonth('tanggal', $bulan)
                ->whereYear('tanggal', $tahun)
                ->where('status', 'Terlambat')
                ->count();

            $gajiPokok = 4000000;
            $tunjanganHadir = $hadir * 20000;
            $bonusLembur = 0;
            $potonganTelat = $terlambat * 25000;

            $total = $gajiPokok + $tunjanganHadir + $bonusLembur - $potonganTelat;

            Payroll::create([
                'employee_id' => $employee->id,
                'bulan' => $bulan,
                'tahun' => $tahun,
                'gaji_pokok' => $gajiPokok,
                'tunjangan_hadir' => $tunjanganHadir,
                'bonus_lembur' => $bonusLembur,
                'potongan_telat' => $potonganTelat,
                'total_gaji' => $total,
            ]);
        }

        return response()->json([
            'message' => 'Payroll berhasil dibuat'
        ]);
    }
}
