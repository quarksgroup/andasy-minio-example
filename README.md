# Andasy Minio Example

This is a simple example of how to deploy a Minio server with a persistent volume on Andasy.

## Prerequisites

- Andasy account
- Andasy CLI

## Setup

1. Create an an app on Andasy

```bash
andasy setup
```

This will start a wizard to create an app.

2. Create a persistent volume

```bash
andasy volume create -a minio_data -s 1 myvol
```

This will create a volume named `minio_data` with 1 GiB of storage.

3. Deploy the app

```bash
andasy deploy
```

This will deploy the app. Make sure the port in `config.hcl` is set to `9001` to access the ui of minio to configure it.

After the app is configured, you can change the port to `9000` and redeploy the app. This will make minio API accessible to the outside world.

## Setting MinIO user

After the app is deployed, the server has default user `minioadmin` and password `minioadmin` you can set the MinIO user and password using secrets (environment variables). To set them, use the secrets command:

```bash
andasy secret set MINIO_ROOT_USER=<username> MINIO_ROOT_PASSWORD=<password>
```

## Accessing the MinIO server

- You can access the UI of minio by changing the port to `9001` in the `config.hcl` file.
- You can access the API of minio by changing the port to `9000` in the `config.hcl` file.

The app will be available at `http://<app-name>.andasy.dev`.

## Minio CLI

You can use the minio cli to interact with the server.

```bash
mc config host add minio http://<app-name>.andasy.dev 9000 <access-key> <secret-key>
```

- `<app-name>` is the name of the app.
- `<access-key>` is the access key of the user.
- `<secret-key>` is the secret key of the user.

You can use the minio cli to create a bucket, upload a file, download a file, etc.

```bash
mc mb minio/mybucket
mc cp /path/to/file minio/mybucket
mc cp minio/mybucket/file /path/to/download
```

For more information, see the [minio cli documentation](https://docs.min.io/docs/minio-client-complete-guide.html).
