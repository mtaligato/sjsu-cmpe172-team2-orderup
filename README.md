<a href="https://sjsu.edu/">
  <img src="https://www.sjsu.edu/aspis/media/brand/logo-sjsu.svg" alt="SJSU logo"
  title="SJSU" align="right" heigh="60" />
</a>

# OrderUp

This project was created for the course: Enterprise Software - CMPE 172 / SPRING 2021

Team Members:
- Jiaqi Feng - 013872352
- Tatsuya Hayashi - 014362881
- Madelyne Taligato - 008758581

## Table of Contents

- [Project Introductoin](#project-introduction)
- [Installation](#installation)
  - [Flutter and Dart](#flutter-and-dart)
  - [Tomcat](#tomcat)
  - [MongoDB](#mongodb)
- [Project Setup](#project-setup)
- [Sample Screenshots](#sample-screenshots)

## Project Introduction

OrderUp is an application that both customers and restaurant owners can use to order food or host their menu for customers to order from. Restaurant owners are able to manage their menu items as well as access placed orders and update the status of each order easily.

## Installation

The backend uses Eclipse IDE.

### Flutter and Dart

Install the Flutter and Dart packages provided for your selected IDE by following the tutorial at Flutter's website: https://flutter.dev/docs/get-started/install

### Tomcat

Download Apache Tomcat v8.0 Core zip file from https://tomcat.apache.org/download-80.cgi and unzip and save the location.

Open Eclipse and go to the Server preferences and add the location of the Tomcat files.

### MongoDB

Follow the installation instructions for MongoDB Community Edition on https://docs.mongodb.com/manual/installation/ and install as a service.

Follow the instructions on the same site to run MongoDB Community Edition from the Command Interpreter.

## Project Setup

Import both the frontend and backend as separate projects.

First startup the backend, running OrderUpApplicate.java as a Java Application. Spring Boot should start up with the Tomcat server.

Next, run the frontend and go through the application!

## Sample Screenshots
- Main Screen: <br />
![Main Screen](https://media.discordapp.net/attachments/805986931170607119/841203930356514876/Screen_Shot_2021-05-09_at_11.42.52_PM.png?width=286&height=569)

- Restaurant Owner Screens: <br />
![Log In](https://media.discordapp.net/attachments/805986931170607119/841203930402652180/Screen_Shot_2021-05-09_at_11.42.56_PM.png?width=286&height=569)
![Create an Account](https://media.discordapp.net/attachments/805986931170607119/841203929848348682/Screen_Shot_2021-05-09_at_11.42.59_PM.png?width=286&height=569)
![Restaurant Owner Options](https://media.discordapp.net/attachments/805986931170607119/841203925708308500/Screen_Shot_2021-05-09_at_11.43.21_PM.png?width=286&height=569)
![View all Orders](https://media.discordapp.net/attachments/805986931170607119/841203914308845608/Screen_Shot_2021-05-09_at_11.43.41_PM.png?width=286&height=569)

- Customer Screens: <br />
![View Menu](https://media.discordapp.net/attachments/805986931170607119/841203929219072000/Screen_Shot_2021-05-09_at_11.43.06_PM.png?width=286&height=569)
![View Cart](https://media.discordapp.net/attachments/805986931170607119/841203923762020362/Screen_Shot_2021-05-09_at_11.43.24_PM.png?width=286&height=569)
![Place Order](https://media.discordapp.net/attachments/805986931170607119/841203929680183346/Screen_Shot_2021-05-09_at_11.43.12_PM.png?width=286&height=569)
