#!/bin/bash

TASKS_FILE="tasks.csv"

# Initialize file with headers if it doesn't exist
if [ ! -f "$TASKS_FILE" ]; then
    echo "id,title,description,location,due_date,time,completed" > $TASKS_FILE
fi

# Function to create a task
create_task() {
    local id=$(($(tail -1 $TASKS_FILE | cut -d, -f1) + 1))
    echo "$id,$1,$2,$3,$4,$5,0" >> $TASKS_FILE
    echo "Task created successfully."
}

# Function to update a task
update_task() {
    local id=$1
    local line=$(grep -n "^$id," $TASKS_FILE | cut -d: -f1)
    if [ -n "$line" ]; then
        sed -i "${line}s/.*/$id,$2,$3,$4,$5,$6,${7:-0}/" $TASKS_FILE
        echo "Task updated successfully."
    else
        echo "Task not found."
    fi
}

# Function to delete a task
delete_task() {
    sed -i "/^$1,/d" $TASKS_FILE
    echo "Task deleted successfully."
}

# Function to show all information about a task
show_task() {
    grep "^$1," $TASKS_FILE
}

# Function to list all tasks of the current day
list_all_tasks() {
    local current_date=$(date +%Y-%m-%d)  # Format YYYY-MM-DD
    echo "Tasks for today ($current_date):"
    grep ",$current_date," $TASKS_FILE
    if [ $? -ne 0 ]; then
        echo "No tasks for today."
    fi
}

# Function to list tasks of a given day
list_tasks() {
    echo "Tasks due on $1:"
    grep ",$1," $TASKS_FILE
}
# Function to search for a task by title
search_task() {
    echo "Searching for tasks with title containing '$1':"
    grep -i ",$1," $TASKS_FILE
    if [ $? -ne 0 ]; then
        echo "No tasks found with the title containing '$1'."
    fi
}

# Main program logic based on arguments
case $1 in
    create)
        read -p "Enter title: " title
        read -p "Enter description: " description
        read -p "Enter location: " location
        read -p "Enter due date: " due_date
        read -p "Enter time: " time
        create_task "$title" "$description" "$location" "$due_date" "$time"
        ;;
    update)
        read -p "Enter ID of task to update: " id
        read -p "Enter new title: " title
        read -p "Enter new description: " description
        read -p "Enter new location: " location
        read -p "Enter new due date: " due_date
        read -p "Enter new time: " time
        read -p "Enter completion status (0 or 1): " completed
        update_task "$id" "$title" "$description" "$location" "$due_date" "$time" "$completed"
        ;;
    delete)
        read -p "Enter ID of task to delete: " id
        delete_task "$id"
        ;;
    show)
        read -p "Enter ID of task to show: " id
        show_task "$id"
        ;;
    list)
        read -p "Enter due date to list tasks: " due_date
        list_tasks "$due_date"
        ;;
    search)
        read -p "Enter title to search for: " title
        search_task "$title"
        ;;
    *)
        echo "Usage: todo.sh [create|update|delete|show|list|search]"
        list_all_tasks
        ;;
esac
