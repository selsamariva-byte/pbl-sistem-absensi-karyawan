<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Employee;

class LeaveRequest extends Model
{    
    protected $table = 'leave_requests';

    protected $fillable = [
        'employee_id',
        'jenis',
        'start_date',
        'end_date',
        'jam_mulai',
        'jam_selesai',
        'reason',
        'status'
    ];
    public function employee()
    {
        return $this->belongsTo(Employee::class);
    }
}
