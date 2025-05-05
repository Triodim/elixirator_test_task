# Elixirator Test Task

A Rails SPA using **Hotwire (Turbo + Stimulus)** to manage Projects and their Tasks.

---

## 🔧 Preconditions
To run this project, make sure you have:
- Docker
- Docker Compose

## 📦 Tech Stack

- Ruby on Rails 7.1
- Hotwire (Turbo + Stimulus)
- SQLite
- Sidekiq + sidekiq-cron
- Faker (for seed data)
- Docker + Docker Compose

---

## 🚀 Getting Started

### 1. Clone the Repo

```bash
git clone https://github.com/Triodim/elixirator_test_task.git
cd elixirator_test_task
```

### 2. Build Docker Containers

```bash
docker-compose build
```

### 3. Set Up the Database


```bash
docker-compose run web ./bin/rails db:setup
```

### 4. Seed the Database

This adds 100 projects and 25–40 tasks per project using Faker:

```bash
docker-compose run web ./bin/rails db:seed
```

### 5. Start the Application

```bash
docker-compose up
```

Then open your browser at:

```
http://localhost:3000
```
---

## 🚨⚠️ **WARNING! TERRIBLE UI AHEAD!** ⚠️🚨

**Professional designers and front-end developers are kindly asked _not_ to launch the project!**  
The most difficult part of backend development is the frontend part. 😄
```