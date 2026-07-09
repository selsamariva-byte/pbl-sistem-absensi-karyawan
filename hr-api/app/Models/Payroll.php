<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Payroll extends Model
{
    protected $fillable = [
        'employee_id',
        'bulan',
        'tahun',
        'gaji_pokok',
        'tunjangan_hadir',
        'bonus_lembur',
        'potongan_telat',
        'total_gaji',
    ];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }
}