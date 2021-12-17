<template>
  <link
    rel="stylesheet"
    href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
  />
  <div class="page-content page-container" id="page-content">
    <div class="padding">
      <div class="row container d-flex justify-content-center">
        <div class="col-md-12">
          <div class="card px-3">
            <div class="card-body">
              <h4 class="card-title">Awesome Todo list</h4>
              <add-todo @addTodoItem="addTodoItem" />
              <todos-list
                @removeTodoItemIdx="removeTodoItem"
                @checkItemIdx="checkItemIdx"
                :todoItems="todoItems"
              />
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import addTodo from "./components/addTodo.vue";
import TodosList from "./components/todosList.vue";

export default {
  name: "Todo",
  components: {
    addTodo,
    TodosList,
  },
  data() {
    return {
      todoItems: [],
    };
  },

  mounted() {
    if (window.localStorage.getItem("todoItems")) {
      this.todoItems = JSON.parse(window.localStorage.getItem("todoItems"));
    }
  },

  methods: {
    addTodoItem(newTodoItemTitle) {
      const newTodoItem = {
        checked: false,
        title: newTodoItemTitle,
      };

      if (newTodoItem.title.length) this.todoItems.push(newTodoItem);
    },

    removeTodoItem(idxTodoItem) {
      this.todoItems = this.todoItems.filter(
        (t, idx) => idx !== Number(idxTodoItem)
      );
    },

    checkItemIdx(idx) {
      this.todoItems[idx]["checked"] = !this.todoItems[idx]["checked"];
      window.localStorage.setItem("todoItems", JSON.stringify(this.todoItems));
    },
  },

  watch: {
    todoItemsLength() {
      window.localStorage.setItem("todoItems", JSON.stringify(this.todoItems));
    },
  },

  computed: {
    todoItemsLength() {
      return this.todoItems.length;
    },
  },
};
</script>

<style scoped lang="css">
@import "./assets/todo-style.css";
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css");
@import url("https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css");
</style>
