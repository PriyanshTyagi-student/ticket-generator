# 🚀 Quick Start Guide - Offline Ticket Generator

## Issue: "It ain't generating tickets"

### Step 1: Start the Backend Server

**Option A - Using the batch file:**
```bash
# Double-click this file:
ticket\START-BACKEND.bat
```

**Option B - Manual start:**
```bash
cd backend
npm install  # Only needed first time
npm start
```

You should see:
```
✅ MongoDB Connected
🚀 Server running on port 5000
```

### Step 2: Test Backend Connection

Open in browser: `ticket\test-backend.html`

Click **"Test Connection"** button:
- ✅ **Green = Working** → Backend is running correctly
- ❌ **Red = Error** → Backend is not running or wrong URL

### Step 3: Generate Ticket

Once backend test is ✅ green:
1. Open `ticket\index.html` in your browser
2. Fill in the form
3. Click "Generate Ticket"

---

## Common Issues & Solutions

### ❌ "Cannot connect to backend server"

**Problem:** Backend is not running

**Solution:**
```bash
cd backend
npm start
```

Wait for: `🚀 Server running on port 5000`

---

### ❌ "Failed to fetch"

**Problem:** Wrong backend URL or CORS issue

**Solution 1:** Check backend URL in `ticket\index.html` (line 329)
```javascript
const BACKEND_URL = 'http://localhost:5000'; // Must match your backend port
```

**Solution 2:** Verify CORS is enabled in `backend\server.js`:
```javascript
app.use(cors());
```

---

### ❌ "Please fill all required fields"

**Problem:** Validation error

**Solution:** Fill all fields marked with * (asterisk)

---

### ❌ "This email is already registered"

**Problem:** Email already exists in database

**Solution:** Use a different email OR check database for existing registration

---

### ❌ Port 5000 already in use

**Problem:** Another app is using port 5000

**Solution 1:** Stop the other app
**Solution 2:** Change port in `backend\server.js`:
```javascript
const PORT = process.env.PORT || 5001; // Changed to 5001
```

Then update `ticket\index.html`:
```javascript
const BACKEND_URL = 'http://localhost:5001';
```

---

## Debug Checklist

Run through this checklist:

- [ ] Backend server is running (`npm start` in backend folder)
- [ ] See message: `🚀 Server running on port 5000`
- [ ] MongoDB is connected (see: `✅ MongoDB Connected`)
- [ ] Open `ticket\test-backend.html` - shows ✅ green status
- [ ] Browser console (F12) shows no CORS errors
- [ ] Backend URL is correct in `ticket\index.html`

---

## View Console Logs

**In Browser (Frontend):**
1. Press `F12` to open Developer Tools
2. Go to "Console" tab
3. Look for error messages (red text)
4. You should see:
   - `🔍 Testing backend connection...`
   - `✅ Backend is reachable` (if working)

**In Terminal (Backend):**
Look for:
- `✅ MongoDB Connected`
- `🚀 Server running on port 5000`
- When you submit form: `✅ Offline ticket generated: ZNX2026-XXXXXX`

---

## Test API Manually (Advanced)

Using PowerShell:
```powershell
# Test if backend is running
Invoke-WebRequest -Uri "http://localhost:5000" -Method GET

# Test ticket generation
$body = @{
    fullName = "Test User"
    mobile = "9876543210"
    email = "test@example.com"
    city = "Muzaffarnagar"
    college = "Test College"
    courseYear = "B.Tech 1st Year"
    category = "Individual"
    subCategory = @("Coding")
    passName = "Pro Participation - ₹150"
    amountPaid = 150
    paymentMode = "Cash"
} | ConvertTo-Json

Invoke-RestMethod -Uri "http://localhost:5000/api/ticket/generate" -Method POST -Body $body -ContentType "application/json"
```

---

## Still Not Working?

Run the test page and screenshot the errors:
1. Open `ticket\test-backend.html`
2. Click all test buttons
3. Copy the "Logs" section
4. Share the error messages

Check backend terminal for error messages.

---

## Quick Commands

```bash
# Start backend
cd backend
npm start

# Check if backend is running (PowerShell)
Test-NetConnection -ComputerName localhost -Port 5000

# View backend logs
cd backend
# (logs appear in terminal where npm start is running)

# Kill process on port 5000 (if stuck)
netstat -ano | findstr :5000
taskkill /PID <PID> /F
```

---

## Success Indicators

✅ Backend terminal shows:
```
✅ MongoDB Connected
🚀 Server running on port 5000
```

✅ Browser console shows:
```
🔍 Testing backend connection...
✅ Backend is reachable
```

✅ After submitting form:
```
🔄 Sending request to: http://localhost:5000/api/ticket/generate
📦 Form data: {...}
📡 Response status: 200
📥 Response data: {registrationId: "ZNX2026-...", ...}
```

---

**Need more help?** Check backend terminal and browser console (F12) for specific error messages.
