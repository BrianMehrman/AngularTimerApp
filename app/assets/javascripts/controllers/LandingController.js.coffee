@timerApp.controller "LandingController", ($scope, $routeParams, $location, Task, TaskList) ->

  $scope.init = ->
    @taskService = new Task(1, serverErrorHandler)

    $scope.tasks = @taskService.all()

  serverErrorHandler = ->
    alert("There was a server error, please reload the page and try again.")

