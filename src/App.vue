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

              <div class="list-wrapper">
                <ul class="d-flex flex-column-reverse todo-list">
                  <li v-for="todoItem in todoItems" :key="todoItem">
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="checkbox" type="checkbox" />
                          {{ todoItem }}
                        <i class="input-helper"></i
                      ></label>
                    </div>
                    <i class="remove mdi mdi-close-circle-outline"></i>
                  </li>
                </ul>
              </div>

              <!-- <div class="list-wrapper">
                <ul class="d-flex flex-column-reverse todo-list">
                  <li>
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="checkbox" type="checkbox" /> For what
                        reason would it be advisable.
                        <i class="input-helper"></i
                      ></label>
                    </div>
                    <i class="remove mdi mdi-close-circle-outline"></i>
                  </li>
                  <li class="completed">
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="checkbox" type="checkbox" checked="" />
                        For what reason would it be advisable for me to think.
                        <i class="input-helper"></i
                      ></label>
                    </div>
                    <i class="remove mdi mdi-close-circle-outline"></i>
                  </li>
                  <li>
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="checkbox" type="checkbox" /> it be
                        advisable for me to think about business content?
                        <i class="input-helper"></i
                      ></label>
                    </div>
                    <i class="remove mdi mdi-close-circle-outline"></i>
                  </li>
                  <li>
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="checkbox" type="checkbox" /> Print
                        Statements all <i class="input-helper"></i
                      ></label>
                    </div>
                    <i class="remove mdi mdi-close-circle-outline"></i>
                  </li>
                  <li class="completed">
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="checkbox" type="checkbox" checked="" />
                        Call Rampbo <i class="input-helper"></i
                      ></label>
                    </div>
                    <i class="remove mdi mdi-close-circle-outline"></i>
                  </li>
                  <li>
                    <div class="form-check">
                      <label class="form-check-label">
                        <input class="checkbox" type="checkbox" /> Print bills
                        <i class="input-helper"></i
                      ></label>
                    </div>
                    <i class="remove mdi mdi-close-circle-outline"></i>
                  </li>
                </ul>
              </div> -->
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import addTodo from "./components/addTodo.vue";

export default {
  name: "Todo",
  components: {
    addTodo,
  },
  data() {
    return {
      todoItems: [],
    };
  },
  methods: {
    addTodoItem(newTodoItem) {
      this.todoItems.push(newTodoItem);
    },
  },
};
</script>

<style scoped lang="css">
@import "./assets/todo-style.css";
@import url("https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css");
@import url("https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css");
</style>
