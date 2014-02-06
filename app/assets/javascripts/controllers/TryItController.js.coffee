@timerApp.controller "TryItController", ($scope, $routeParams, $location, Task) ->
  $scope.init = ->
    $scope.taskLists = []
