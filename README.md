# numeritos.net is a web application to encourage your students to practice their maths.

This repository contains the source code (and initial content) for the numeritos.net web application.

## How to build
numeritos.net is built with [Maven](https://maven.apache.org/). All dependencies are automatically handled by Maven and a deployable war file can be built just by running
and then deploy it on your favourite app server. We use [Tomcat](https://tomcat.apache.org/) for that matter.

## Features
Each student must authenticate using her corporate e-mail and custom password. The student's e-mail is kept private and **never** used for any purpose other than authentication. Her password is kept **encripted** in the database. Furthermore, the e-mail doesn't need to be a working e-mail, it's actually just an unique username. numeritos.net is leak proof!
![Authentication is simple and secure](https://github.com/noeom/numeritos/blob/master/doc/img/01_auth.png)


## Licence

All material in this repository is under licence [**Creative Commons Attribution-Sharealike 4.0 International**](https://creativecommons.org/licenses/by-sa/4.0/deed.es).

