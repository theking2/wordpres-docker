# WordPress with xdebug enabled

## Contents

This will create a container stack by the same name as the folder it sits in. Change project name in `.env`

```env
project=kundenname
```

at the top and change "kundenname" to something descriptive.

### Dockerfile

Dockerfile that pulls wordpress-apache and sets a couple of neccesary PHP ini-files and enables xdebug.

### compose.yaml

creates two containers `wp` (with the Dockerfile) and `db` for a standard MariaDB in a stack named earlier. The root of the Apache `html` and the database data are bound to subfolders `app`  to `db` respectively. The website can be accessed by

* localhost:8080/ → `./app` as `wp-content` folder

## Setup docker containers

First start Docker Desktop. When you're ready, start your application by running:

`docker compose up --build`.

in a terminal. If you have the Docker VSCode Extention installed it is even simpler. Open the `compose.yaml` and  click 

![image](https://github.com/user-attachments/assets/b2668f04-ad4b-4734-a777-9f0c37864da9)

After this check the running state of the container in Docker Desktop.

If Docker Desktop or the docker daemon is __not__ running you will see a confusing message:

![image](https://github.com/user-attachments/assets/22db1c2d-e93e-4eb7-bcf4-92cc40c3bf93)

If that happens start Docker Desktop and try again.

Setting up the database might take some time on slower hardware. Make sure that activity in the docker has died down.

## Database access

Normally you won't need database access from outside so the `db` server is not bridged. If you _do_ need access add a port mapping in the db service and restart the container.

## Setup xdebug launch.json

* Install xdebug extension
* create launch.json (open the xdebug tab and click "create a launch.json file" )
* click the gear icon and add this to the configurations section in `launch.json` file (for instance directly below the `"port": 9003,` line)

```js
"pathMappings": {
    "/var/www/html": "${workspaceFolder}/app"
}
```

and save the file. This assumes you have your webroot in a folder _app_ as indicated above.

## Move the project

As all key ingredients sit on in the file system, moving or copying the project is easy. Zip the project including `app` and `db` folders and unzip it somewhere else;. Make sure in Docker Desktop to shutdown the database first.
