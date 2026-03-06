# ✅ ZONEX 2026 - Offline Ticket Generator - QUICK START

## 🎯 Current Status
- ✅ **Backend**: Running and tested
- ✅ **API Endpoints**: Working (health check + ticket generation)
- ✅ **Database**: Connected
- ✅ **Ticket Generation**: Verified (test ticket: ZNX2026-667269)

---

## 🚀 To Generate Tickets NOW:

### Option 1: Using HTTP Server (RECOMMENDED - NO CORS ISSUES)

**Windows:**
```powershell
cd ticket
python -m http.server 8080
```

Then open in browser:
```
http://localhost:8080/index.html
```

**Or use Node.js:**
```bash
cd ticket
npx http-server -p 8080
```

### Option 2: Using Batch File

Double-click:
```
ticket\open-ticket-generator.bat
```

---

## ✨ How It Works

### 1. **Fill the Registration Form**
   - Name, email, mobile (10 digits)
   - College & course details
   - Select category (Individual/Team/Visitor)
   - Choose activities/skills
   - Select pass type & payment amount

### 2. **Generate Ticket**
   - Click "Generate Ticket"
   - Backend creates:
     - Unique Registration ID (ZNX2026-XXXXX)
     - QR Code (venue scanning)
     - Database record

### 3. **Download or Email**
   - Download HTML ticket (for printing)
   - Send via email to participant

---

## 🔧 Troubleshooting

### ❌ "Cannot connect to backend"

**Solution:** Make sure you're opening via HTTP (not file://)
```bash
# ✅ CORRECT
http://localhost:8080/index.html

# ❌ WRONG
file:///D:/TechMNHub.../index.html
```

### ❌ Backend Not Running

Check if port 5000 is open:
```powershell
Test-NetConnection -ComputerName localhost -Port 5000
```

**Result:** `True` = Backend running
**Result:** `False` = Start backend:
```bash
cd backend
npm start
```

---

## 📊 API Endpoints

### Health Check
```http
GET http://localhost:5000/api/ticket/health
```
Response: `{"ok": true, "msg": "..."}`

### Generate Ticket
```http
POST http://localhost:5000/api/ticket/generate
Content-Type: application/json

{
  "fullName": "John Doe",
  "mobile": "9876543210",
  "email": "john@example.com",
  "city": "Muzaffarnagar",
  "college": "ABC College",
  "courseYear": "B.Tech 2nd Year",
  "category": "Individual",
  "subCategory": ["Coding", "Design"],
  "teamMembers": [],
  "passName": "Pro Participation - ₹150",
  "amountPaid": 150,
  "paymentMode": "Cash",
  "portfolio": "",
  "github": "",
  "instagram": ""
}
```

Response:
```json
{
  "msg": "Ticket generated successfully",
  "registrationId": "ZNX2026-667269",
  "qrCode": "data:image/png;base64,...",
  "user": { /* full user object */ }
}
```

---

## 📁 File Structure

```
ticket/
├── index.html                    ← Main ticket generator
├── test-backend.html            ← Backend connection tester
├── QUICKSTART.md                ← This file
├── TROUBLESHOOTING.md           ← Detailed troubleshooting
├── open-ticket-generator.bat    ← Quick launcher
└── README.md

backend/
├── server.js                    ← Express server
├── routes/offlineTicketRoutes.js ← API routes (+ health endpoint)
├── controllers/offlineTicketController.js ← Ticket generation logic
├── models/User.js              ← Database schema
└── utils/
    ├── generateQR.js
    └── sendEmail.js
```

---

## ✅ Features

- 🎟️ Auto-generated registration IDs
- 🎨 QR codes for venue scanning
- 📧 Email delivery with ticket details
- 📥 HTML ticket download for printing
- 👥 Team member support
- 💳 Multiple payment modes
- ✔️ Duplicate email detection
- 🎯 Real-time form validation

---

## 🚀 Workflow

```
1. Fill Form
   ↓
2. Click Generate Ticket
   ↓
3. Form → Backend API
   ↓
4. Backend:
   - Generates registration ID
   - Creates QR code
   - Saves to database
   ↓
5. Returns ticket to frontend
   ↓
6. Display preview
   ↓
7. Download HTML or Send Email
```

---

## 💾 Database

Each ticket stores:
```json
{
  "registrationId": "ZNX2026-667269",
  "fullName": "John Doe",
  "email": "john@example.com",
  "mobile": "9876543210",
  "category": "Individual",
  "subCategory": ["Coding", "Design"],
  "qrCode": "data:image/png;base64,...",
  "paymentMode": "Cash",
  "amountPaid": 150,
  "paymentStatus": "paid",
  "checkedIn": false
}
```

---

## 🎯 For Event Day

1. **At Check-in**: Scan QR code OR enter Registration ID
2. **Admin Dashboard**: Verify registration & mark check-in
3. **Entry**: Participant enters venue

---

## 📞 Support

- **Email Issues?** Check Resend API key in backend `.env`
- **QR Code Issues?** Ensure `qrcode` npm package is installed
- **Database Issues?** Verify MongoDB connection in `.env`

---

**🎉 Ready to generate tickets!**

Start with: `http://localhost:8080/index.html`
