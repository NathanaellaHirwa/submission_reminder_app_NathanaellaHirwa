# Submission Reminder App

## Overview
The Submission Reminder App is a basic shell script tool that tracks student assignment submissions and sends reminders to those who haven't submitted yet, so they know the deadline.

## Features
- Simple script execution with minimal setup.
- Creates a structured environment to manage submissions.
- Reads submission status from a file.
- Sends notifications to students who haven’t submitted their assignments.

## Directory Structure
```
submission_reminder_{yourName}/
│-- app/
│   └── reminder.sh
│-- modules/
│   └── functions.sh
│-- config/
│   └── config.env
│-- assets/
│   └── submissions.txt
│-- startup.sh
│-- create_environment.sh
```

## Installation & Setup
### 1. Clone the Repository
```sh
git clone <repository_url>
cd submission_reminder_app
```

### 2. Run the Setup Script
Run the script to create the environment:
```sh
bash create_environment.sh
```
You will be prompted to enter your name. The directory `submission_reminder_{yourName}` will be created accordingly.

### 3. Start the Application
```sh
cd submission_reminder_{yourName}
./startup.sh
```

## Configuration
The `config/config.env` file contains environment variables:
```sh
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
```
Modify these values as needed to change the assignment name and due date.

## How It Works
1. The `startup.sh` script runs `reminder.sh` inside the `app` directory.
2. `reminder.sh` loads environment variables and helper functions.
3. It checks `assets/submissions.txt` for students who have not submitted their assignments.
4. It prints reminders for students who need to submit their assignments.

## Sample Output
```
Assignment: Shell Navigation
Days remaining to submit: 2 days
----------------------------------------------
Reminder: Chinemerem has not submitted the Shell Navigation assignment!
Reminder: Divine has not submitted the Shell Navigation assignment!
Reminder: Sheila has not submitted the Shell Navigation assignment!
Reminder: Linda has not submitted the Shell Navigation assignment!
Reminder app executed successfully!
```

## Author
This project was created by Nathanaella Hirwa
