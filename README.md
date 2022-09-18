# LaraGigs app

Based on Traversy Media's YouTube tutorial "[Laravel From Scratch 2022](https://www.youtube.com/watch?v=MYyJ4PuL4pY)". But inside docker container for easy development and hosting in a VPS/VPC.

![Alt text](/public/images/screen.png "LaraGigs")

## Usage

### Docker setup

Install Docker and docker compose and run

```
docker-compose up -d --build
```

### Database Setup

This app uses Postgres.

Go inside postgres container by running the following command

```
docker-compose exec -it database sh
```

Access psql by running

```
psql -U postgres
```

From the psql shell we'll create a user/role for your app.

```
CREATE USER <username> WITH PASSWORD '<password>';
```

**⚠️ Note: create a strong password.**

Create a database for your app

```
CREATE DATABASE <databasename>;
```

Grant privileges

```
GRANT ALL PRIVILEGES ON DATABASE <databasename> TO <username>;
```

Exit out.

### Install npm dependencies and build assets

```
docker-compose run --rm npm install
docker-compose run --rm npm run prod
```

## Install composer dependecies

```
docker-compose run --rm  composer install
```

## Application Setup

### Go inside the php container

```
docker-compose exec -it php sh
```

Copy .env.example to .env and set up proper ENV variables

```
 cp .env.example .env
```

Hint: Open .env file in vi to edit

```
vi .env
```

### Generate Keys

```
php artisan key:generate
```

### Test Database Connection

```
php artisan tinker
DB::connection()->getPdo();
```

### Migrations

To create all the nessesary tables and columns, run the following

```
php artisan migrate
```

### Seeding The Database

To add the dummy listings with a single user, run the following

```
php artisan db:seed
```

### File Uploading

When uploading listing files, they go to "storage/app/public". Create a symlink with the following command to make them publicly accessible.

```
php artisan storage:link
```

## License

The LaraGigs app is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).
