# 🚀 Andasy + MinIO Example

This guide walks you through deploying a **MinIO** server with a **persistent volume** using **Andasy**.

## 🧰 Prerequisites

Make sure you have:

- ✅ An [Andasy](https://andasy.io) account
- 🖥️ Installed the [Andasy CLI](https://github.com/quarksgroup/andasy-cli)

## ⚙️ Setup Instructions

### 1️⃣ Create a New App on Andasy

Start the setup wizard:

```bash
andasy setup
```

Follow the prompts to initialize your app.

### 2️⃣ Create a Persistent Volume

```bash
andasy volume create -a <minio_app_name> -s 1 minio_data
```

🔸 Replace `<minio_app_name>` with your actual app name
🔸 `minio_data` will be the volume name
🔸 `-s 1` allocates **1 GiB** of storage

### 3️⃣ Deploy the App

```bash
andasy deploy
```

✅ Make sure `config.hcl` uses port **9001** to access the **MinIO UI**.

🔁 After configuration, switch to port **9000** and redeploy to expose the **MinIO API**.

## 🔐 Set MinIO Credentials

By default, MinIO uses:

- Username: `minioadmin`
- Password: `minioadmin`

To set your own credentials securely:

```bash
andasy secret set MINIO_ROOT_USER=<your-username> MINIO_ROOT_PASSWORD=<your-password>
```

## 🌐 Accessing MinIO

- 📺 UI: Set port `9001` in `config.hcl` and visit:
  `http://<app-name>.andasy.dev`

- 🔌 API: Set port `9000` and access the same URL.

## 🛠️ Using the MinIO CLI (`mc`)

Configure your CLI to talk to your MinIO server:

```bash
mc config host add minio http://<app-name>.andasy.dev 9000 <access-key> <secret-key>
```

Replace:

- `<app-name>` with your app name
- `<access-key>` and `<secret-key>` with your MinIO credentials

### 📦 Common CLI Commands

```bash
# Create a new bucket
mc mb minio/mybucket

# Upload a file
mc cp /path/to/file minio/mybucket

# Download a file
mc cp minio/mybucket/file /path/to/download
```

📚 Learn more in the [MinIO CLI Docs](https://docs.min.io/enterprise/aistor-object-store/)
