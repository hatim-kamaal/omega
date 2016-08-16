(function () {
    'use strict';

    angular
        .module('gamerland')
        .controller('LoginController', LoginController)
        .controller('HomeController', HomeController)
		.controller('LogoutController', LogoutController)
		.controller('ChampionshipsController',ChampionshipsController)
		.controller('AddChampionshipsController', AddChampionshipsController)
		.controller('EditChampionshipsController', EditChampionshipsController)
        ;
    
    EditChampionshipsController.$inject = ['$rootScope','$scope', '$routeParams', '$http', 'NgTableParams', 'consts'];
    function EditChampionshipsController($rootScope, $scope, $routeParams, $http, NgTableParams, consts) {
    	
        var vm = this;
        vm.mode = "Edit";
        vm.gameId = $routeParams.id;
        $http.post( consts.apiUrl , { 'service':'Championship', 'method':'getById', 'id':$routeParams.id}).success(function(response) {
			//alert(response.data);
        	//$scope.records = response.data;        	
        	
        	vm.gameName = response.data.gameName;
        	vm.images = response.data.images;
            vm.platform = response.data.platform;
            vm.gamePrice = response.data.gamePrice;
            vm.until = response.data.until;
            vm.purchasePrize = response.data.purchasePrize;
            vm.gameType = response.data.gameType;
            vm.UserRegistered = response.data.UserRegistered;
            vm.TotalRounds = response.data.TotalRounds;
        	
        	$scope.usersTable = new NgTableParams({}, { dataset: $scope.records });
        	vm.dataLoading = false;
        }).error( function(response){alert('failed to invoke service')} );
        //getById
        
        
        vm.addChampionship = addChampionship;

        function addChampionship() {
            vm.dataLoading = true;
			$http.post( consts.apiUrl, {'service':'Championship', 'method':'update',images: vm.images,
				gameName: vm.gameName,
				platform: vm.platform,
				gamePrice: vm.gamePrice,
				until: vm.until,
				purchasePrize: vm.purchasePrize,
				gameType: vm.gameType,
				UserRegistered: vm.UserRegistered,
				TotalRounds: vm.TotalRounds,
				gameId: vm.gameId
				}).success(function(response) {
				
					if( response.success ) {
						FlashService.Success("Championship is registered successfully.");
					} else {
						FlashService.Error(response.message);
					}
					
			//alert(" RESP : " + response.HATIM);
        	//$scope.records = response.data.details;        	
        	//$scope.usersTable = new NgTableParams({}, { dataset: $scope.records });
				vm.dataLoading = false;
			}).error( function(response){alert('failed to invoke service')} );			
        };
		
    };
    
	AddChampionshipsController.$inject = ['$rootScope','$scope',  '$http', 'NgTableParams', 'consts', 'FlashService'];
    function AddChampionshipsController($rootScope, $scope, $http, NgTableParams, consts, FlashService) {
    	
        var vm = this;
        vm.mode = "Add";
        
        vm.images = "fifa.png";
        vm.platform = "PLAYSTATION 4";
        vm.gamePrice = "99";
        vm.until = "09/30/2016";
        vm.purchasePrize = "200";
        vm.gameType = "NUMERIC";
        vm.UserRegistered = "1";
        vm.TotalRounds = "1";
        

        vm.addChampionship = addChampionship;

        function addChampionship() {
            vm.dataLoading = true;
			$http.post( consts.apiUrl, {'service':'Championship', 'method':'create',images: vm.images,
				gameName: vm.gameName,
				platform: vm.platform,
				gamePrice: vm.gamePrice,
				until: vm.until,
				purchasePrize: vm.purchasePrize,
				gameType: vm.gameType,
				UserRegistered: vm.UserRegistered,
				TotalRounds: vm.TotalRounds
				}).success(function(response) {
				
					if( response.success ) {
					
					FlashService.Success("Championship is registered successfully.");
					} else {
						FlashService.Error(response.message);
					}
					
			//alert(" RESP : " + response.HATIM);
        	//$scope.records = response.data.details;        	
        	//$scope.usersTable = new NgTableParams({}, { dataset: $scope.records });
				vm.dataLoading = false;
			}).error( function(response){alert('failed to invoke service')} );			
        };
		
    };
	
	ChampionshipsController.$inject = ['$rootScope','$scope',  '$http', 'NgTableParams', 'consts'];
    function ChampionshipsController($rootScope, $scope,  $http, NgTableParams, consts) {
    	
        var vm = this;
        vm.dataLoading = true;
        vm.message = "Here it displays table";
        
        $http.post( consts.apiUrl , { 'service':'Championship', 'method':'get'}).success(function(response) {
			//alert(response.data);
        	$scope.records = response.data;        	
        	$scope.usersTable = new NgTableParams({}, { dataset: $scope.records });
        	vm.dataLoading = false;
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
        vm.dataLoading = true;
        vm.message = "Here it displays table";
        
        vm.user = {firstName : "Hatim"};
        
        $http.post( consts.apiUrl, { 'service':'User', 'method':'tableExample'}).success(function(response) {
        	$scope.users = response.data;
        	
        	$scope.usersTable = new NgTableParams({}, { dataset: $scope.users });
        	vm.dataLoading = false;
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