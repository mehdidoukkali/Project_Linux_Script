# Project_Linux_Script
# Todo Task Manager Script
*By Mehdi Doukkali and Youssef Bouabid*

  ## Overview
This Bash script, `todo.sh`, manages daily tasks stored in a CSV file. It allows for creating, updating, deleting, and displaying tasks with various details such as title, description, location, due date, and time. The script is designed to handle tasks efficiently and is user-friendly, prompting the user for input as needed.

  ## Features
The script supports the following features:
- **Create a Task**: Add new tasks with necessary details.
- **Update a Task**: Modify existing tasks using their ID.
- **Delete a Task**: Remove tasks by their ID.
- **Show Task Details**: Display complete information of a task by ID.
- **List Tasks by Date**: Show tasks for a specific date.
- **Search Tasks by Title**: Find tasks based on a partial or complete title.
- **List All Tasks for Today**: Automatically lists tasks due on the current date when no specific command is provided.

  ## File Structure
The tasks are stored in `tasks.csv` with the following columns:
- **ID**: Unique identifier for each task.
- **Title**: Brief title of the task.
- **Description**: More detailed information about the task.
- **Location**: Location associated with the task.
- **Due Date**: Date by which the task needs to be completed.
- **Time**: Time by which the task should be completed.
- **Completed**: Status of the task, either 0 (not completed) or 1 (completed).

  ## Getting Started
To use this script, ensure that you have a Bash shell environment available. Place the script in a directory of your choice.

### Setup
1. Make the script executable:
   ```
   chmod +x todo.sh
   ```
2. Run the script using:
   ```
   ./todo.sh [command]
   ```

   ## Usage
Here is how to use each command supported by the script:

### Create a Task
```
./todo.sh create
```
- Prompts will appear to enter title, description, location, due date, and time.

### Update a Task
```
./todo.sh update
```
- You will be prompted to enter the ID of the task you want to update and the new details.

### Delete a Task
```
./todo.sh delete
```
- You will be prompted to enter the ID of the task you wish to delete.

### Show Task Details
```
./todo.sh show
```
- You will need to provide the ID of the task you want to view.

### List Tasks by Date
```
./todo.sh list
```
- Enter the specific date to list tasks due on that day.

### Search Tasks by Title
```
./todo.sh search
```
- Enter a title or part of a title to search for relevant tasks.

### Default: List All Tasks for Today
- Running the script without any arguments lists all tasks due on the current date:
  ```
  ./todo.sh
  ```

## Error Handling
The script ensures robust error handling, such as checking for the existence of the task file and validating task IDs. Error messages are clear and guide the user towards correct usage.

---
