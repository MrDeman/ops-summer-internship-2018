## What is done:
#### First steps
- [x] Build image and run container.
- [x] Find FixelHoover text file.
#### Basic tasks
- [x] Update Dockerfile with all missing system packages.
- [x] Expose http port 80 so it's accessible externally from your host OS.
- [x] Fix 'Internal Server Error' on localhost by changing Dockerfile.
- [x] Add additional information about you. Describe these changes in Dockerfile.
- [x] We want to see this page using domain name "internship.macpaw.io".
- [x] Fetch info for open additional.zip
- [x] Write script for open additional.zip
#### Additional tasks
- [x] Add log rotation for supervisor and dpkg files at /var/log/ directory.
- [x] Write down a little program that is able to show up your public IP.
- [x] The result of this program execution should be available at 'internship.macpaw.io/ip'.

## What use:
GIT; GNU Make; Python3; Python2.7; Flask; feedparser; requests; nano; logrotate; bash; Docker; HTML5; nginx; wsgi; etc..

When I make this complex of tasks I used three books: "Pro Git book, written by Scott Chacon and Ben Straub", "Dmitry Aivaliotis - Nginx Server Administration", "Using Docker - O'Reilly Media"
## Preconditions:
* [Docker](https://www.docker.com/docker-ubuntu) - Container manager.
* [GNU Make](https://www.gnu.org/) - is a build automation tool that automatically builds executable programs.
* [Python Pip](https://packaging.python.org/tutorials/installing-packages/#ensure-you-can-run-pip-from-the-command-line) - python package manager.

## Usage:
Simple way (Recommended):
```sh
$ git clone git@github.com:MrDeman/ops-summer-internship-2018.git # Clone repository
$ cd /ops-summer-internship-2018 # Go to local repository
$ make help # Get info about makefile
$ make # Configure and run container
```
For cleaning environment:
```sh
$ make rm # Remove container 'internship'
```
Not simple way (Not recommended):
```sh
$ git clone git@github.com:MrDeman/ops-summer-internship-2018.git # Clone repository
$ cd /ops-summer-internship-2018 # Go to local repository
$ docker build --tag macpaw/internship .
$ docker run --publish 80:80 --name internship --detach macpaw/internship
```
For cleaning environment:
```sh
$ docker rm --force internship
```

## License
MIT
###### p.s.
###### All code used in the repository is either written by the author personally or distributed on a free basis without the requirements of the license agreement.
