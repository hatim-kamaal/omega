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
		.controller('EmailAllController',EmailAllController)
		.controller('EmailTemplateController',EmailTemplateController)
		.controller('UserController',UserController)
		.controller('ReportChampsController',ReportChampsController)
		.controller('UserRankController',UserRankController)
		.controller('ResetPasswordController',ResetPasswordController)
		
		.controller('RnDController', RnDController)
        ;

    ResetPasswordController.$inject = ['$location', 'UserService', 'FlashService'];
    function ResetPasswordController($location, UserService, FlashService) {
        var vm = this;

        vm.login = login;

        
        (function initController() {
        	UserService.ConfirmResetRequest(function (response) {
                if (response.success) {
                	FlashService.Success("Please reset your password here.");
                } else {
                    FlashService.Error(response.message);
                }
            });
        })();

        function login() {
            vm.dataLoading = true;
            UserService.ResetPassword(vm.password1, '123456789', function (response) {
                if (response.success) {
                	FlashService.Success(response.message);
                } else {
                    FlashService.Error(response.message);
                }
                vm.dataLoading = false;
            });
        };
    };
    
    UserRankController.$inject = ['$scope','FlashService', 'UserService', 'NgTableParams'];	
    function UserRankController($scope, FlashService, UserService,NgTableParams) {
    	var vm = this;
		vm.dataLoading = true;
		UserService.GetUserByRank(function(r2){
			if( r2.success ) {
				$scope.records = r2.data;
				$scope.usersTable = new NgTableParams({}, { dataset: $scope.records });
			} else {
				FlashService.Error(r2.message);
			}
			vm.dataLoading = false;
		});
    };
    
    
    ReportChampsController.$inject = ['$scope','FlashService','ChampionshipService'];	
    function ReportChampsController($scope, FlashService,ChampionshipService) {
    	var vm = this;
		vm.dataLoading = true;
		vm.type = "platform";
		vm.changeType = function(){
			ChampionshipService.GetStats(vm.type , function(r2){
				if( r2.success ) {
					
					$scope.pielabels = r2.data.names;
					$scope.piedata = r2.data.counts;
				} else {
					FlashService.Error(r2.message);
				}
				vm.dataLoading = false;
			});
		};
		
    	ChampionshipService.GetStats(vm.type , function(r2){
			if( r2.success ) {
				
				$scope.pielabels = r2.data.names;
				$scope.piedata = r2.data.counts;
			} else {
				FlashService.Error(r2.message);
			}
			vm.dataLoading = false;
		});
    };
    
    UserController.$inject = ['$scope','FlashService', 'UserService', 'NgTableParams'];	
    function UserController($scope, FlashService, UserService,NgTableParams) {
    	var vm = this;
		vm.dataLoading = true;
		UserService.GetAll(function(r2){
			if( r2.success ) {
				$scope.records = r2.data;
				$scope.usersTable = new NgTableParams({}, { dataset: $scope.records });
			} else {
				FlashService.Error(r2.message);
			}
			vm.dataLoading = false;
		});
    };
    
    EmailTemplateController.$inject = ['$scope','FlashService', 'EmailService', 'NgTableParams'];	
    function EmailTemplateController($scope, FlashService, EmailService,NgTableParams) {
    	var vm = this;
		vm.dataLoading = true;
		EmailService.GetAllTemplate(function(r2){
			if( r2.success ) {
				//FlashService.Success(r2.message);
				$scope.records = r2.data;
				$scope.usersTable = new NgTableParams({}, { dataset: $scope.records });
			} else {
				FlashService.Error(r2.message);
			}
			vm.dataLoading = false;
		});
		
		vm.save = Save;
		
		function Save() {
			alert("Save method called");
			vm.dataSaving = true;
			EmailService.EditTemplate(vm, function(r2){
				if( r2.success ) {
					FlashService.Success(r2.message);
				} else {
					FlashService.Error(r2.message);
				}
				vm.dataSaving = false;
			});
		};
		
		
		vm.editMode = function() {
			
		}
    };

    
    EmailAllController.$inject = ['$scope','FlashService', 'EmailService'];	
    function EmailAllController($scope, FlashService, EmailService) {
    	var vm = this;
    	vm.SendEmail = SendEmail;
    	function SendEmail() {
    		EmailService.SendToAll(function(r2){
				if( r2.success ) {
					FlashService.Success(r2.message);
				} else {
					FlashService.Error(r2.message);
				}
			});
    	};
    };
    
    
/*
	    EditChampionshipsController.$inject = ['$rootScope','$scope', '$routeParams', 
	'$http', 'NgTableParams', 'consts', 'FlashService', 'ChampionshipService', 'FileUploadService'];
	
    function EditChampionshipsController($rootScope, $scope, $routeParams, 
	$http, NgTableParams, consts, FlashService, ChampionshipService, FileUploadService) {
	*/
	
    RnDController.$inject = ['$scope','FlashService'];	
    function RnDController($scope, FlashService) {
		FlashService.Success("You are at RnD page");
		
		 $scope.pielabels = ["Download Sales", "In-Store Sales", "Mail-Order Sales"];
		  $scope.piedata = [300, 500, 100];
		
		
		
		  $scope.labels = ["January", "February", "March", "April", "May", "June", "July"];
		  $scope.series = ['Series A', 'Series B'];
		  $scope.data = [
			[65, 59, 80, 81, 56, 55, 40],
			[28, 48, 40, 19, 86, 27, 90]
		  ];
		  $scope.onClick = function (points, evt) {
			console.log(points, evt);
		  };
		  $scope.datasetOverride = [{ yAxisID: 'y-axis-1' }, { yAxisID: 'y-axis-2' }];
		  $scope.options = {
			scales: {
			  yAxes: [
				{
				  id: 'y-axis-1',
				  type: 'linear',
				  display: true,
				  position: 'left'
				},
				{
				  id: 'y-axis-2',
				  type: 'linear',
				  display: true,
				  position: 'right'
				}
			  ]
			}
		  };
	}	
	
    EditChampionshipsController.$inject = ['$routeParams','FlashService', 'ChampionshipService', 'FileUploadService'];	
    function EditChampionshipsController($routeParams, FlashService, ChampionshipService, FileUploadService) {
    	
        var vm = this;
		vm.dataLoading = true;
		vm.edit = true;
        vm.mode = "Edit";
        vm.gameId = $routeParams.id;	
        vm.addChampionship = addChampionship;
		
		ChampionshipService.GetById($routeParams.id,function(response){
			if( response.success ) {
				vm.gameName = response.data.gameName;
				vm.images = response.data.images;
				vm.platform = response.data.platform;
				vm.gamePrice = response.data.gamePrice;
				vm.until = response.data.until;
				vm.purchasePrize = response.data.purchasePrize;
				vm.gameType = response.data.gameType;
				vm.UserRegistered = response.data.UserRegistered;
				vm.TotalRounds = response.data.TotalRounds;
			} else {
				FlashService.Error("Technical issue collecting the value.");
			}
        	vm.dataLoading = false;
		});
        
		var formdata = new FormData();
		vm.getTheFiles = function ($files) {
            angular.forEach($files, function (value, key) {
                formdata.append(key, value);
            });
        };
        function addChampionship() {
            vm.dataLoading = true;
            
			FileUploadService.UploadOnServer(formdata, function(response){
				if( response.success ) {
					FlashService.Success("File uploaded, now loading championship details.");
					ChampionshipService.Update( response.message, vm, function(r2){
						if( r2.success ) {
							FlashService.Success("Championship details update successfully.");
						} else {
							FlashService.Error(r2.message);
						}
					} );
				} else {
					FlashService.Error(response.message);
				}
				vm.dataLoading = false;
			});
        };		
    };

/*
	AddChampionshipsController.$inject = ['$rootScope','$scope',  '$http', 'NgTableParams', 'consts', 'FlashService', 'ChampionshipService', 'FileUploadService'];
    function AddChampionshipsController($rootScope, $scope, $http, NgTableParams, consts, FlashService, ChampionshipService, FileUploadService) {

*/    
	AddChampionshipsController.$inject = ['FlashService', 'ChampionshipService', 'FileUploadService'];
    function AddChampionshipsController(FlashService, ChampionshipService, FileUploadService) {
    	
        var vm = this;
		vm.edit = false;
        vm.mode = "Add";
        
        vm.addChampionship = addChampionship;
		
		var formdata = new FormData();
		vm.getTheFiles = function ($files) {
            angular.forEach($files, function (value, key) {
                formdata.append(key, value);
            });
        };

		function addChampionship() {
            vm.dataLoading = true;
            
			FileUploadService.UploadOnServer(formdata, function(response){
				if( response.success ) {
					FlashService.Success("File uploaded, now loading championship details.");
					ChampionshipService.Create( response.message, vm, function(r2){
						if( r2.success ) {
							FlashService.Success("Championship details added successfully.");
						} else {
							FlashService.Error(r2.message);
						}
					} );
				} else {
					FlashService.Error(response.message);
				}
				vm.dataLoading = false;
			});
        };		
    };
	
	/*
	ChampionshipsController.$inject = ['$rootScope','$scope',  '$http', 'NgTableParams', 'consts', 'ChampionshipService'];
    function ChampionshipsController($rootScope, $scope,  $http, NgTableParams, consts , ChampionshipService) {
	*/
	
	ChampionshipsController.$inject = ['$scope',  'NgTableParams', 'ChampionshipService'];
    function ChampionshipsController($scope,  NgTableParams, ChampionshipService) {
    	
        var vm = this;
        vm.dataLoading = true;
        vm.message = "Here it displays table";
		
		ChampionshipService.GetAll(function(response) {
			if( response.success ) {
				$scope.records = response.data;
				$scope.usersTable = new NgTableParams({}, { dataset: $scope.records });
			} else {
				alert("Nowjhfjksah dkjshdf ksahd ksa ");
			}
			vm.dataLoading = false;
		});		
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