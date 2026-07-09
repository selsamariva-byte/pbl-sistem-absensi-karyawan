<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Employee;

class LoginController extends Controller
{
    public function login(Request $request)
    {
        $employee = Employee::where(
            'email',
            '=',
            $request->input('email'),
            'and'
        )->first();
        
        if (!$employee) {
            return response()->json([
                'success' => false,
                'message' => 'Email tidak ditemukan'
            ]);
        }

        if ($employee->password != $request->input('password')) {
            return response()->json([
                'success' => false,
                'message' => 'Password salah'
            ]);
        }

        return response()->json([
            'success' => true,
            'employee' => $employee
        ]);
    }
}