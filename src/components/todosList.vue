<template>
  <div class="list-wrapper">
    <ul class="d-flex flex-column-reverse todo-list">
      <li v-for="(todoItem, idx) in todoItems" :key="todoItem">
        <div class="form-check">
          <label class="form-check-label">
            <input class="checkbox" type="checkbox" />
            {{ todoItem }}
            <i class="input-helper"></i
          ></label>
        </div>
        <i
          @click="removeTodoItem(idx)"
          class="remove mdi mdi-close-circle-outline"
        ></i>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  data() {
    return {};
  },

  props: {
    todoItems: Array,
  },

  methods: {
    removeTodoItem(idx) {
      this.$emit("removeTodoItemIdx", idx);
    },
  },

  watch: {},
};
</script>
