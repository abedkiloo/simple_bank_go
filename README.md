# **Banking Transaction Flow in Go** 🚀  

A simple **Go** implementation of a transaction flow in a banking ecosystem. This project demonstrates how to build a banking service using **PostgreSQL**, **Docker**, and a **Makefile** for automation.

---

## **🛠 Project Setup**  

### **1️⃣ Clone the Repository**  
```sh
git clone https://github.com/abedkiloo/simple_bank_go.git
```
cd your-repo
2️⃣ Run PostgreSQL in a Docker Container
Ensure you have Docker installed, then start the PostgreSQL container:
```sh
make postgres
```
This will:

Start a PostgreSQL database in a Docker container
Expose it on port 5432
Use credentials:
User: admin
Password: simple_bank_secret
Database: simple_bank
3️⃣ Create the Database
```sh
make createdb
```
This will create the simple_bank database inside the running PostgreSQL container.

🚀 Running the Application
Start the Go Application
```sh
go run main.go
```
Make sure your Go application is configured to connect to localhost:5432.

Run Migrations
```sh
migrate --path db/migration --database "postgres://admin:simple_bank_secret@localhost:5432/simple_bank?sslmode=disable" --verbose up
```
Stop and Remove the Database (If Needed)
```sh

make dropdb  # Drops the database
make stop    # Stops the PostgreSQL container
make clean   # Removes the container
```
🛠 Using the Makefile for Automation
The Makefile simplifies common database and Docker operations:

📌 Features
✅ Go-based transaction processing
✅ PostgreSQL integration using Docker
✅ Automated commands via Makefile
✅ Database migrations for schema management

