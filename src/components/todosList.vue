<template>
  <div class="list-wrapper">
    <ul class="d-flex flex-column-reverse todo-list">
      <li v-for="(item, idx) in todoItems" :key="item">
        <!-- {{ todoItem }} : {{ idx }} -->
        <todo-item
          :todoItemObject="item"
          :todoItemIdx="idx"
          @checkItemIdx="checkItem"
          @changeTodoItem="updateTodoItem"
          @removeTodoItemIdx="removeTodoItem"
        />
      </li>
    </ul>
  </div>
</template>

<script>
import todoItem from "@/components/todoItem.vue";

export default {
  components: {
    todoItem,
  },

  data() {
    return {};
  },

  props: {
    todoItems: Array,
  },

  emits: {
    removeTodoItemIdx: [Number, Boolean],
    checkItemIdx: [Number, Boolean],
    updateTodoItem: [Number, Object],
  },

  methods: {
    removeTodoItem(idx) {
      this.$emit("removeTodoItemIdx", idx);
    },

    checkItem(idx) {
      this.$emit("checkItemIdx", idx);
    },

    updateTodoItem(idx, newTodoItem) {
      this.$emit("updateTodoItem", idx, newTodoItem);
    },
  },
};
</script>
