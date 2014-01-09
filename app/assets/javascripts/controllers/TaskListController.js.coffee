angular.module('timerApp').controller "TodoListController", ($scope, $timeout, $routeParams, Task, TaskList) ->

  $scope.init = () ->
    @taskService = new Task($routeParams.list_id, serverErrorHandler)
    @listService = new TaskList(serverErrorHandler)

    $scope.list = @listService.find $routeParams.list_id

  $scope.addTask = ->
    raisePriorities()
    task = @taskService.create(description: $scope.taskDescription)
    task.priority = 1
    $scope.list.tasks.unshift(task)
    $scope.taskDescription = ""

  $scope.deleteTask = (task) ->
    lowerPrioritiesBelow(task)
    @taskService.delete(task)
    $scope.list.tasks.splice($scope.list.tasks.indexOf(task), 1)

  $scope.toggleTask = (task) ->
    @taskService.update(task, completed: task.completed)

  $scope.listNameEdited = (listName) ->
    @listService.update(@list, name: listName)

  $scope.taskEdited = (task) ->
    @taskService.update(task, description: task.description)

  $scope.dueDatePicked = (task) ->
    @taskService.update(task, due_date: task.due_date)

  $scope.dueDateNullLast = (task) ->
    task.due_date ? '2999-12-31'

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")

  tasksBelow = (task) ->
    $scope.list.tasks.slice($scope.list.tasks.indexOf(task), $scope.list.tasks.length)
