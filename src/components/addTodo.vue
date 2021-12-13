<template>
  <div class="add-items d-flex">
    <input
      v-model="newTodoItem"
      @keypress.enter="addTodoItem"
      type="text"
      class="form-control todo-list-input"
      placeholder="What do you need to do today?"
    />
    <button
      @click="addTodoItem"
      class="add btn btn-primary font-weight-bold todo-list-add-btn"
    >
      Add
    </button>
  </div>
</template>

<script>
export default {
  data() {
    return {
      newTodoItem: "",
    };
  },
  methods: {
    addTodoItem() {
      this.$emit("addTodoItem", this.newTodoItem);
      this.newTodoItem = "";
    },
  },
};
</script>
