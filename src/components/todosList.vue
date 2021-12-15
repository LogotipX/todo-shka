<template>
  <div class="list-wrapper">
    <ul class="d-flex flex-column-reverse todo-list">
      <li v-for="(todoItem, idx) in todoItems" :key="todoItem">
        <div class="form-check">
          <div
            @click="selectItemIdx(idx)"
            :class="{ completed: todoItem['checked'] }"
            :style="
              selectedItems.find((i) => String(i) === String(idx))
                ? fullText
                : null
            "
            class="form-check-label"
          >
            <input
              :checked="todoItem['checked']"
              @change="checkItem(idx)"
              @click.stop
              class="checkbox"
              type="checkbox"
            />
            {{ todoItem["title"] }}
            <i class="input-helper"></i>
          </div>
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
    return {
      fullText: {
        "white-space": "normal",
      },

      selectedItems: [],
    };
  },

  props: {
    todoItems: Array,
  },

  emits: {
    removeTodoItemIdx: [Number, Boolean],
    checkItemIdx: [Number, Boolean],
  },

  methods: {
    removeTodoItem(idx) {
      this.$emit("removeTodoItemIdx", idx);
    },

    checkItem(idx) {
      this.$emit("checkItemIdx", idx);
    },

    selectItemIdx(idx) {
      // debugger; // eslint-disable-line no-debugger
      if (!this.selectedItems.find((i) => String(i) === String(idx))) {
        // debugger; // eslint-disable-line no-debugger
        this.selectedItems.push(String(idx));
        // debugger; // eslint-disable-line no-debugger
      } else {
        this.selectedItems = this.selectedItems.filter(
          (i) => String(i) !== String(idx)
        );
      }
    },
  },
};
</script>
