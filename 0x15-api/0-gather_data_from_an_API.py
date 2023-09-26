#!/usr/bin/python3
"""
Using a REST API, for a given employee ID, returns information about his/her
TODO list progress.

Requirements:
    - You must use urllib or requests module
    - The script must accept an integer as a parameter, which is the
      employee ID
    - The script must display on the standard output the employee TODO list
      progress in this exact format:
    - First line: Employee EMPLOYEE_NAME is done with tasks
      (NUMBER_OF_DONE_TASKS/TOTAL_NUMBER_OF_TASKS):
        EMPLOYEE_NAME: name of the employee
        NUMBER_OF_DONE_TASKS: number of completed tasks
        TOTAL_NUMBER_OF_TASKS: total number of tasks, which is the sum of
          completed and non-completed tasks
    - Second and N next lines display the title of completed tasks: TASK_TITLE
      (with 1 tabulation and 1 space before the TASK_TITLE)
"""

from requests import get
from sys import argv

if __name__ == '__main__':
    base_url = 'https://jsonplaceholder.typicode.com'
    todo_endpoint = base_url + "/user/{}/todos".format(argv[1])
    name_endpoint = base_url + "/users/{}".format(argv[1])
    todo_result = get(todo_endpoint).json()
    name_result = get(name_endpoint).json()

    todo_num = len(todo_result)
    todo_complete = len([todo for todo in todo_result
                         if todo.get("completed")])
    name = name_result.get("name")
    print("Employee {} is done with tasks({}/{}):"
          .format(name, todo_complete, todo_num))
    for todo in todo_result:
        if (todo.get("completed")):
            print("\t {}".format(todo.get("title")))
