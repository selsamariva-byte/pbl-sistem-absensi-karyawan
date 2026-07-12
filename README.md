<div align="center">

# 🚀 Human Resource Management (HRM) System

# Modern Human Resource Management System for Employee Administration, Attendance, Leave Management, and Payroll

<p>
  <img src="https://img.shields.io/badge/Next.js-15-black?logo=next.js" />
  <img src="https://img.shields.io/badge/TypeScript-3178C6?logo=typescript&logoColor=white" />
  <img src="https://img.shields.io/badge/Laravel-FF2D20?logo=laravel&logoColor=white" />
  <img src="https://img.shields.io/badge/Flutter-02569B?logo=flutter&logoColor=white" />
  <img src="https://img.shields.io/badge/MySQL-4479A1?logo=mysql&logoColor=white" />
  <img src="https://img.shields.io/badge/Firebase-FCM-orange?logo=firebase" />
  <img src="https://img.shields.io/badge/License-Educational-green" />
</p>

_A full-stack Human Resource Management System built with Flutter, Next.js, Laravel REST API, and MySQL._

</div>

---

✨ Overview

The Human Resource Management (HRM) System is a full-stack application designed to streamline employee administration within an organization.

The system consists of:

- 📱 Mobile Application (Flutter)
- 🌐 Admin Dashboard (Next.js)
- ⚙️ REST API Backend (Laravel)
- 🗄️ MySQL Database
- 🔔 Firebase Cloud Messaging

It helps companies digitize employee attendance, leave requests, payroll management, and employee records.

---

📸 Application Preview

🖥️ Admin Dashboard

> Replace these images with your screenshots.

| Dashboard                             | Employees                             |
| ------------------------------------- | ------------------------------------- |
| ![](assets/screenshots/dashboard.png) | ![](assets/screenshots/employees.png) |

| Attendance                             | Payroll                             |
| -------------------------------------- | ----------------------------------- |
| ![](assets/screenshots/attendance.png) | ![](assets/screenshots/payroll.png) |

---

## 📱 Mobile Application

| Login                                    | Dashboard                                    |
| ---------------------------------------- | -------------------------------------------- |
| ![](assets/screenshots/mobile-login.png) | ![](assets/screenshots/mobile-dashboard.png) |

| Attendance                                    | Profile                                    |
| --------------------------------------------- | ------------------------------------------ |
| ![](assets/screenshots/mobile-attendance.png) | ![](assets/screenshots/mobile-profile.png) |

---

🚀 Features

# 📱 Mobile Application

- 🔐 Authentication
- 📍 GPS Attendance (Check In / Check Out)
- 🕒 Attendance History
- 📝 Leave Request
- 📄 Leave Request History
- 💰 Payroll Information
- 👤 Employee Profile
- ✏️ Edit Profile
- 🔔 Push Notification (FCM)

---

# 🌐 Admin Dashboard

- 📊 Dashboard Analytics
- 👨‍💼 Employee Management (CRUD)
- 📅 Attendance Management
- ✅ Leave Approval
- 💰 Payroll Management
- 📈 Attendance Report
- 📑 Employee Report

---

# ⚙️ Backend API

- REST API
- JWT Authentication
- Employee API
- Attendance API
- Leave Request API
- Payroll API
- Firebase Cloud Messaging
- MySQL Integration

---

# 🛠 Tech Stack

| Category     | Technology               |
| ------------ | ------------------------ |
| Frontend     | Next.js                  |
| Backend      | Laravel                  |
| Mobile       | Flutter                  |
| Database     | MySQL                    |
| API          | REST API                 |
| Notification | Firebase Cloud Messaging |
| Language     | TypeScript, PHP, Dart    |

---

# 🏗 System Architecture

```text
             Flutter Mobile
                   │
                   │ REST API
                   ▼
            Laravel Backend
                   │
        ┌──────────┴──────────┐
        ▼                     ▼
    MySQL Database      Firebase FCM
                   ▲
                   │
             Next.js Admin
```

---

# 📂 Project Structure

```text
HRM-System
│
├── backend-laravel
│   ├── app
│   ├── routes
│   ├── database
│   └── ...
│
├── mobile-flutter
│   ├── lib
│   ├── assets
│   └── ...
│
├── web-nextjs
│   ├── app
│   ├── components
│   ├── lib
│   ├── public
│   └── ...
│
└── README.md
```

---

# ⚙️ Installation

## Clone Repository

```bash
git clone https://github.com/selsamariva-byte/pbl-sistem-absensi-karyawan.git
```

```
cd hrm-system
```

---

# Backend Setup

```bash
composer install

cp .env.example .env

php artisan key:generate

php artisan migrate

php artisan serve --host=0.0.0.0 --port=9000
```

---

# Next.js Setup

```bash
cd web-nextjs

npm install

npm run dev
```

---

# Flutter Setup

```bash
cd mobile-flutter

flutter pub get

flutter run
```

---

# 🗄 Database

Main Tables

- employees
- attendances
- leave_requests
- payrolls

Database Relationship

```text
Employees
   │
   ├──────── Attendances
   │
   ├──────── Leave Requests
   │
   └──────── Payrolls
```

---

# 📊 Modules

| Module            | Status |
| ----------------- | ------ |
| Authentication    | ✅     |
| Dashboard         | ✅     |
| Employee CRUD     | ✅     |
| Attendance        | ✅     |
| Leave Request     | ✅     |
| Payroll           | ✅     |
| Reports           | ✅     |
| Push Notification | ✅     |

---

# 📌 Future Improvements

- Email Notification
- Face Recognition Attendance
- Dark Mode
- Multi Company Support
- Role Permission Management
- Export PDF Report
- Real-Time Dashboard

---

# 👨‍💻 Development Team

**Project Based Learning (PBL)**

Department of Informatics Management

**Politeknik Negeri Malang**

---

# 📄 License

This project was developed for educational purposes as part of the Project Based Learning (PBL) course.

---

<div align="center">

If you find this project useful, don't forget to give it a star!

Made by **Elsa Mariva Sianturi**

</div>
