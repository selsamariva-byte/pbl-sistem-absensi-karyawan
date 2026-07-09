<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use App\Models\Attendance;

class Employee extends Model
{
    protected $table = 'employees';

    protected $fillable = [
        'nip',
        'nama',
        'email',
        'divisi',
        'phone',
        'alamat',
        'foto',
        'join_date',
        'role'
    ];
    protected $hidden = [
        'password',
    ];

    public function attendances()
    {
        return $this->hasMany(
            Attendance::class,
            'employee_id'
        );
    }
    public function leaveRequests()
    {
        return $this->hasMany(LeaveRequest::class);
    }
    public function payrolls()
    {
        return $this->hasMany(Payroll::class);
    }
}