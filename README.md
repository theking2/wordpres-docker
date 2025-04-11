# WordPress with xdebug enabled

## Contents

### Dockerfile

Dockerfile that pulls wordpress-apache and sets a couple of neccesary PHP ini-files and enables xdebug.

### compose.yaml

creates two containers `wp` (with the Dockerfile) and `db` for a standard MariaDB. The root of the Apache `html` and the database data are bound to subfolders `app`  to `db` respectively

* localhost:9080/ => ./app as webroot folder

## Setup docker containers

change `MARIADB_ROOT_PASSWORD` first time creation. After that it is fixed. So after generation of the containers you can (should) return it to its original or some other value

When you're ready, start your application by running:
`docker compose up --build`.

## Setup xdebug launch.json

* Install xdebug extension
* create launch.json (open the xdebug tab and click "create a launch.json file" )
* click the gear icon and add this to the configurations section in `launch.json` file (for instance just below the `"port": 9003,` line)

```js
"pathMappings": {
    "/var/www/html": "${workspaceFolder}/htdocs"
}
```

and save the file. This assumes you have your webroot in a folder htdocs as indicated above.
