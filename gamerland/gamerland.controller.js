(function () {
    'use strict';

    angular
        .module('gamerland')
        .controller('LoginController', LoginController)
        .controller('HomeController', HomeController)
		.controller('LogoutController', LogoutController)
		.controller('ChampionshipsController',ChampionshipsController)
		.controller('AddChampionshipsController', AddChampionshipsController)
        ;
    
	AddChampionshipsController.$inject = ['$rootScope','$scope',  '$http', 'NgTableParams', 'consts'];
    function AddChampionshipsController($rootScope, $scope,  $http, NgTableParams, consts) {
    	
        var vm = this;

        vm.addChampionship = addChampionship;

        function addChampionship() {
            vm.dataLoading = true;
            /*AuthenticationService.Login(vm.username, vm.password, function (response) {
                if (response.success) {
                    AuthenticationService.SetCredentials(vm.username, vm.password);
                    $location.path('/');
                } else {
                    FlashService.Error(response.message);
                    vm.dataLoading = false;
                }
            });
			*/
			$http.get( consts.apiUrl +  'ChampionshipService.php').success(function(response) {
			//alert(response.data);
        	//$scope.records = response.data.details;        	
        	//$scope.usersTable = new NgTableParams({}, { dataset: $scope.records });
				vm.dataLoading = false;
			}).error( function(response){alert('failed to invoke service')} );			
        };
		
    };
	
	ChampionshipsController.$inject = ['$rootScope','$scope',  '$http', 'NgTableParams', 'consts'];
    function ChampionshipsController($rootScope, $scope,  $http, NgTableParams, consts) {
    	
        var vm = this;
        
        $http.get( consts.apiUrl +  'ChampionshipService.php').success(function(response) {
			//alert(response.data);
        	$scope.records = response.data.details;        	
        	$scope.usersTable = new NgTableParams({}, { dataset: $scope.records });
}).error( function(response){alert('failed to invoke service')} );
    };
	
	LogoutController.$inject = ['$location', 'AuthenticationService', 'FlashService'];
    function LogoutController($location, AuthenticationService, FlashService) {
		
		(function initController() {
            // reset login status
            AuthenticationService.ClearCredentials();
        })();
		
        //AuthenticationService.ClearCredentials();
		$location.path('/home');
		FlashService.Error("You have been logged out successfully.");
    };
	
    //, 'ngTableParams' // , $http, ngTableParams
    HomeController.$inject = ['$rootScope','$scope',  '$http', 'NgTableParams', 'consts'];
    function HomeController($rootScope, $scope,  $http, NgTableParams, consts) {
    	
        var vm = this;
        vm.message = "Here it displays table";
        
        vm.user = {firstName : "Hatim"};
        
        $http.get( consts.apiUrl +  'TableExampleService.php').success(function(response) {
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