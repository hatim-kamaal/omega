(function () {
    'use strict';

    angular
        .module('gamerland')
        .controller('LoginController', LoginController)
        .controller('HomeController', HomeController)
        ;
    
    //, 'ngTableParams' // , $http, ngTableParams
    HomeController.$inject = ['$rootScope','$scope',  '$http', 'NgTableParams'];
    function HomeController($rootScope, $scope,  $http, NgTableParams) {
    	
        var vm = this;
        vm.message = "Here it displays table";
        
        vm.user = {firstName : "Hatim"};
        
        $http.get('http://localhost/angjs-omega-gamerland/php/TableExampleService.php').success(function(response) {
			/*
        	response = {
				success : response.data.status,
				message : response.data.msg
			};
			callback(response);
			*/
	
        	$scope.users = response.data;
        	
        	$scope.usersTable = new NgTableParams({}, { dataset: $scope.users });
}).error( function(response){alert('failed to invoke service')} );
    };
  
    LoginController.$inject = ['$location', 'AuthenticationService', 'FlashService'];
    function LoginController($location, AuthenticationService, FlashService) {
        var vm = this;

        vm.login = login;

        (function initController() {
            // reset login status
            AuthenticationService.ClearCredentials();
        })();

        function login() {
            vm.dataLoading = true;
            AuthenticationService.Login(vm.username, vm.password, function (response) {
                if (response.success) {
                    AuthenticationService.SetCredentials(vm.username, vm.password);
                    $location.path('/');
                } else {
                    FlashService.Error(response.message);
                    vm.dataLoading = false;
                }
            });
        };
    };

    
    
    LandingController.$inject = ['UserService', '$rootScope', '$scope'];
    function LandingController(UserService, $rootScope, $scope) {
        var vm = this;
        
        vm.welcomeMsg = "Admin account needs login.";
        $scope.isLoggedIn = false;
        
        $scope.login = function() {
            
          };
        /*
        $scope.login = function() {
          $facebook.login().then(function() {
            refresh();
          });
        }
        function refresh() {
          $facebook.api("/me").then( 
            function(response) {
              $scope.welcomeMsg = "Welcome " + response.name;
              $scope.isLoggedIn = true;
            },
            function(err) {
              $scope.welcomeMsg = "Please log in";
            });
        }
        
        
        refresh();
        */
    };
})();