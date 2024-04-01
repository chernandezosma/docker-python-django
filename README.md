# Dockerized Django

This project is my dockerized solution to have a full dev environment isolated from the host system.
The solution involve several containers to achieve the task.

## Installation
To install the environment you just clone this repository and follow the steps below

1- Clone the repository  
2- Replace the `src/hello` with your app code. Keep in mind that `hello` is the my app's name.
3- Review the .env file to change everything that you need to change to meet the parameters that your project needs

1. Set Up the Development Environment:
Clone the Repository: Begin by cloning the project repository using Git. You can achieve this using the following command:

```Bash
git clone https://github.com/chernandezosma/docker-python-django.git
```

Configure the Project: Navigate to the cloned repository directory using your terminal:

```Bash
cd <repository_name>
```
Replace `<repository_name>` with the actual name of the cloned repository.

2. Integrate Your Application Code:
Replace the Placeholder: Locate the `src/hello` directory within the project. This directory serves as a placeholder for your application code. Replace its contents with your own codebase. Remember, this directory name should reflect your specific application's name.

3. Customize Environment Variables:
Review the `.env` File: The project utilizes an `.env` file to store configuration variables. Open this file within your preferred text editor.

**Update Configuration Values**:  Carefully review the existing variables in the `.env` file. Modify or replace any values as needed to align with your project's specific requirements. Be sure to follow the instructions or formatting guidelines within the file for proper variable configuration.

This revised version provides a more formal tone and includes additional details to guide the user through the process.

## Requirements
To use the repository you need to have installed in your system all docker system and related tools. 

The particular instructions to install docker, docker-composer and their tools are available at the following link

- [Install Docker engine](https://docs.docker.com/engine/install/)
- [Install Docker Compose](https://docs.docker.com/compose/install/) 

## Usage

To raise the environment you must navigate to the root folder and locate the `docker-compose.yml` and you must build and raise the environment.

```Bash
docker compose build --no-cache
```
and when it finish the task you must type the following command.

```Bash
docker compose up --force-recreate
```
Remember that after June, 2023 the `docker-compose` has changed to the version 2.0 to the new way, that is `docker compose`
You can read about that [here](https://www.docker.com/blog/new-docker-compose-v2-and-v1-deprecation/#:~:text=Compose%20V1%20support%20will%20no,with%20running%20your%20Compose%20applications.)

## Contributing
This repository is an public and open source to be used for everyone. There is no fee to use it.
If you find any fix, change or suggestion, please feel free to open an issue or a pull request to be incorporated to the project.

## License
The code and the repo itself was created and it is under [MIT](https://choosealicense.com/licenses/mit/) licence