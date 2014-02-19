@timerApp = angular.module('timerApp',[ "ngResource"])

@timerApp.config(['$httpProvider',($httpProvider) ->
  authToken = $("meta[name=\"csrf-token\"]").attr("content")
  $httpProvider.defaults.headers.common["X-CSRF-TOKEN"] = authToken
])

@timerApp.config(['$routeProvider' ,($routeProvider) ->
  $routeProvider
    .when '/',
      templateUrl: '/home/landing.html'
      controller: 'LandingController'
    .when '/try_it',
      templateUrl: '/home/demo.html'
      controller: 'TryItController'
    .when '/dashboard',
      templateUrl: '/templates/dashboard.html'
      controller: 'DashboardController'
    .when '/task_lists/:list_id',
      templateUrl: '/templates/task_list.html'
      controller: 'TodoListController'
])

$(document).on 'page:load', ->
  $('[ng-app]').each ->
    module = $(this).attr('ng-app')
    angular.bootstrap(this, [module])
