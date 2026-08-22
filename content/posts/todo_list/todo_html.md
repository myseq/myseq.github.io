<!DOCTYPE html>
<html>
<head>
  <title>To-Do List</title>
  <style>
    body {
      font-family: sans-serif;
    }
    #todo-list {
      list-style: none;
      padding: 0;
    }
    .todo-item {
      display: flex;
      align-items: center;
      padding: 8px;
      border-bottom: 1px solid #ccc;
    }
    .todo-item.completed {
      text-decoration: line-through;
      color: #aaa;
    }
    .todo-item input[type="checkbox"] {
      margin-right: 8px;
    }
    .todo-item button {
      margin-left: auto;
      background: #f44336;
      color: white;
      border: none;
      padding: 4px 8px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <h1>To-Do List</h1>
  <input type="text" id="new-todo" placeholder="Add a new to-do">
  <button id="add-todo">Add</button>
  <ul id="todo-list"></ul>

  <script>
    const todoList = document.getElementById('todo-list');
    const newTodoInput = document.getElementById('new-todo');
    const addTodoButton = document.getElementById('add-todo');

    let todos = JSON.parse(localStorage.getItem('todos')) || [];

    function saveTodos() {
      localStorage.setItem('todos', JSON.stringify(todos));
    }

    function renderTodos() {
      todoList.innerHTML = '';
      for (let i = 0; i < todos.length; i++) {
        const todo = todos[i];
        const todoItem = document.createElement('li');
        todoItem.className = 'todo-item';
        if (todo.completed) {
          todoItem.classList.add('completed');
        }

        const checkbox = document.createElement('input');
        checkbox.type = 'checkbox';
        checkbox.checked = todo.completed;
        checkbox.addEventListener('change', () => {
          todos[i].completed = checkbox.checked;
          saveTodos();
          renderTodos();
        });

        const text = document.createElement('span');
        text.textContent = todo.text;

        const removeButton = document.createElement('button');
        removeButton.textContent = 'Remove';
        removeButton.addEventListener('click', () => {
          todos.splice(i, 1);
          saveTodos();
          renderTodos();
        });

        todoItem.appendChild(checkbox);
        todoItem.appendChild(text);
        todoItem.appendChild(removeButton);
        todoList.appendChild(todoItem);
      }
    }

    addTodoButton.addEventListener('click', () => {
      const text = newTodoInput.value.trim();
      if (text) {
        todos.push({ text, completed: false });
        newTodoInput.value = '';
        saveTodos();
        renderTodos();
      }
    });

    renderTodos();
  </script>
</body>
</html>