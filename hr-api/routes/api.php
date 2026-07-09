<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\EmployeeController;
use App\Http\Controllers\Api\LeaveController;
use App\Http\Controllers\Api\LoginController;
use App\Http\Controllers\Api\AttendanceController;
use App\Http\Controllers\Api\PayrollController;

Route::post('/login', [LoginController::class, 'login']);

Route::get('/employees', [EmployeeController::class, 'index']);
Route::get('/employees/{id}', [EmployeeController::class, 'show']);
Route::put('/employees/{id}', [EmployeeController::class, 'update']);
Route::post('/employees', [EmployeeController::class, 'store']);
Route::put('/employees/{id}/fcm-token', [EmployeeController::class, 'updateFcmToken']);
Route::delete('/employees/{id}', [EmployeeController::class, 'destroy']);

Route::post('/attendance/checkin', [AttendanceController::class, 'checkIn']);
Route::post('/attendance/checkout', [AttendanceController::class, 'checkOut']);
Route::get('/attendance/{employee_id}', [AttendanceController::class, 'today']);

Route::get('/attendance/history/{employee_id}', [AttendanceController::class, 'history']);
Route::get('/attendance/report/{employee_id}/{bulan}', [AttendanceController::class, 'report']);
Route::get('/attendance/payroll/{employee_id}/{bulan}', [AttendanceController::class, 'payroll']);

Route::get('/attendances', [AttendanceController::class, 'index']);

Route::get('/payrolls/{employee_id}/{bulan}/{tahun}', [PayrollController::class, 'history']);
Route::post('/payrolls/generate', [PayrollController::class, 'generate']);

Route::get('/leaves', [LeaveController::class, 'index']);
Route::post('/leaves', [LeaveController::class, 'store']);
Route::get('/leaves/{employee_id}', [LeaveController::class,'history']);
Route::put('/leaves/{id}/approve', [LeaveController::class, 'approve']);
Route::put('/leaves/{id}/reject', [LeaveController::class, 'reject']);
// Route::get('/test', function () {
//     return 'API Jalan';
// });