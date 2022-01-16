<template>
  <div :style="{ width: todoWidth[selectedTodoWidth] }" class="page-container">
    <div class="card">
      <div class="card-body">
        <div
          class="attr-panel"
          style="display: flex; justify-content: space-between"
        >
          <h4 class="card-title">Todo-shka</h4>
          <div class="options">
            <select v-model="selectedTodoWidth" name="width" id="select-width">
              <option>Small</option>
              <option>Medium</option>
              <option>Large</option>
            </select>
          </div>
        </div>
        <add-todo @addTodoItem="addTodoItem" />
        <todos-list
          @removeTodoItemIdx="removeTodoItem"
          @checkItemIdx="checkItemIdx"
          @updateTodoItem="updateTodoItem"
          :todoItems="todoItems"
        />
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
      todoWidth: {
        Small: "320px",
        Medium: "480px",
        Large: "720px",
      },
      selectedTodoWidth: "Small",

      todoItems: [],
    };
  },

  mounted() {
    if (window.localStorage.getItem("todoItems")) {
      this.todoItems = JSON.parse(window.localStorage.getItem("todoItems"));
    }
    if (window.localStorage.getItem("todoWidth")) {
      this.selectedTodoWidth = window.localStorage.getItem("todoWidth");
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

    updateTodoItem(idx, newTodoItem) {
      // if (!newTodoItem["title"].length) {
      //   // this.removeTodoItem(idx);
      //   return;
      // }
      this.todoItems[idx] = newTodoItem;
      window.localStorage.setItem("todoItems", JSON.stringify(this.todoItems));
    },
  },

  watch: {
    todoItemsLength() {
      window.localStorage.setItem("todoItems", JSON.stringify(this.todoItems));
    },

    selectedTodoWidth() {
      window.localStorage.setItem("todoWidth", this.selectedTodoWidth);
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
