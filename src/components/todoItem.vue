<template>
  <template v-if="editMode" class="editMode">
    <img
      @click="changeItemText"
      class="svg-icons"
      style="max-width: 24px"
      src="@/assets/SVG/edit.svg"
      alt=""
    />
    <input
      v-model="todoItem['title']"
      @keypress.enter="changeItemText"
      class="change-input todo-list-input"
      type="text"
      placeholder="change text"
    />
  </template>
  <div
    v-if="!editMode"
    @mouseenter="showRedact = true"
    @mouseleave="showRedact = false"
    class="form-check"
  >
    <div
      @click="selectItem"
      :class="{ completed: todoItem['checked'] }"
      :style="selectedItem ? fullText : null"
      class="form-check-label"
    >
      <input
        :checked="todoItem['checked']"
        @change="checkItem(todoItemIdx)"
        @click.stop
        class="checkbox"
        type="checkbox"
      />
      <section class="input-helper">
        <img
          v-if="showRedact"
          @click.stop="editMode = true"
          class="svg-icons"
          src="@/assets/SVG/edit.svg"
          alt=""
        />
        {{ todoItem["title"] }}
      </section>
      <!-- <i class="input-helper"></i> -->
    </div>
  </div>
  <i
    @click="removeTodoItem(todoItemIdx)"
    class="remove mdi mdi-close-circle-outline"
  ></i>
</template>

<script>
export default {
  data() {
    return {
      todoItem: this.todoItemObject,

      fullText: {
        "white-space": "normal",
      },

      selectedItem: false,
      editMode: false,
      showRedact: false,
    };
  },
  props: {
    todoItemObject: Object,
    todoItemIdx: Number,
  },
  emits: {
    checkItemIdx: Number,
    changeTodoItem: Object,
    removeTodoItemIdx: Number,
  },
  methods: {
    checkItem(idx) {
      this.$emit("checkItemIdx", idx);
    },

    selectItem() {
      this.selectedItem = !this.selectedItem;
    },

    changeItemText() {
      this.editMode = false;
      if (this.todoItem["title"].length === 0) {
        this.todoItem = this.todoItemObject;
      } else {
        this.$emit("changeTodoItem", this.todoItemIdx, this.todoItem);
      }
    },

    removeTodoItem(idx) {
      this.$emit("removeTodoItemIdx", idx);
    },
  },
};
</script>
