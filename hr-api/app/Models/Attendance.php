<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Employee;

class Attendance extends Model
{
    protected $fillable = [
        'employee_id',
        'tanggal',
        'check_in',
        'check_out',
        'status',
        'total_kerja',
        'lembur',
    ];

    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }
}