#!/bin/bash

# File to store tasks
TODO_FILE="todo_list.txt"

# Ensure the file exists
touch "$TODO_FILE"

# Function to display tasks
view_tasks() {
    if [[ ! -s "$TODO_FILE" ]]; then
        echo "No tasks found!"
    else
        echo "Your To-Do List:"
        cat -n "$TODO_FILE"
    fi
}

# Function to add a task
add_task() {
    read -p "Enter the task: " task
    echo "[ ] $task" >> "$TODO_FILE"
    echo "Task added!"
}

# Function to mark a task as done
mark_done() {
    view_tasks
    read -p "Enter the task number to mark as done: " task_num
    sed -i "${task_num}s/\[ \]/[x]/" "$TODO_FILE"
    echo "Task marked as done!"
}

# Function to delete a task
delete_task() {
    view_tasks
    read -p "Enter the task number to delete: " task_num
    sed -i "${task_num}d" "$TODO_FILE"
    echo "Task deleted!"
}

# Main Menu
while true; do
    echo -e "\nTo-Do List Manager"
    echo "1. View Tasks"
    echo "2. Add Task"
    echo "3. Mark Task as Done"
    echo "4. Delete Task"
    echo "5. Exit"
    read -p "Choose an option (1-5): " choice

    case $choice in
        1) view_tasks ;;
        2) add_task ;;
        3) mark_done ;;
        4) delete_task ;;
        5) echo "Goodbye!"; exit ;;
        *) echo "Invalid option. Please choose between 1 to 5." ;;
    esac
done
