(function() {
	'use strict';

	angular.module('gamerland').factory('AuthenticationService',
			AuthenticationService)
			.factory('UserService', UserService)
			.factory('ChampionshipService', ChampionshipService)
			.factory('FileUploadService', FileUploadService)
			.factory('EmailService', EmailService)
			.factory('FlashService', FlashService);

	
	EmailService.$inject = [ '$http','consts' ];
	function EmailService($http,consts) {
		var service = {};
	
		service.SendToAll = SendToAll;
	
		return service;
		
		function SendToAll(callback) {
			$http.post( consts.apiUrl , { 'service':'EmailService', 'method':'broadcast'})
			.success(function(response){callback(response);})
			.error(function(response){callback({success:false,message:"Service invokation error."});});
        }
	}
	
	AuthenticationService.$inject = [ '$http', '$cookieStore', '$rootScope',
			'$timeout', 'UserService', 'consts' ];
	function AuthenticationService($http, $cookieStore, $rootScope, $timeout,
			UserService, consts) {
		var service = {};

		service.Login = Login;
		service.SetCredentials = SetCredentials;
		service.ClearCredentials = ClearCredentials;

		return service;

		function Login(username, password, callback) {

				$http.post(consts.apiUrl, { 'service':'User', 'method':'signin','email': username, 'code':
					 password }).success(function(response) {
						callback(response);
			}).error( function(response){alert('failed to invoke service')} );
		}

		function SetCredentials(username, password) {
			var authdata = Base64.encode(username + ':' + password);

			$rootScope.globals = {
				currentUser : {
					username : username,
					authdata : authdata
				}
			};

			$http.defaults.headers.common['Authorization'] = 'Basic '
					+ authdata; // jshint ignore:line
			$cookieStore.put('globals', $rootScope.globals);
			$rootScope.authen = true;
		}

		function ClearCredentials() {
			$rootScope.globals = {};
			$cookieStore.remove('globals');
			$http.defaults.headers.common.Authorization = 'Basic';
			$rootScope.authen = false;
		}
	}

	// Base64 encoding service used by AuthenticationService
	var Base64 = {

		keyStr : 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=',

		encode : function(input) {
			var output = "";
			var chr1, chr2, chr3 = "";
			var enc1, enc2, enc3, enc4 = "";
			var i = 0;

			do {
				chr1 = input.charCodeAt(i++);
				chr2 = input.charCodeAt(i++);
				chr3 = input.charCodeAt(i++);

				enc1 = chr1 >> 2;
				enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);
				enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);
				enc4 = chr3 & 63;

				if (isNaN(chr2)) {
					enc3 = enc4 = 64;
				} else if (isNaN(chr3)) {
					enc4 = 64;
				}

				output = output + this.keyStr.charAt(enc1)
						+ this.keyStr.charAt(enc2) + this.keyStr.charAt(enc3)
						+ this.keyStr.charAt(enc4);
				chr1 = chr2 = chr3 = "";
				enc1 = enc2 = enc3 = enc4 = "";
			} while (i < input.length);

			return output;
		},

		decode : function(input) {
			var output = "";
			var chr1, chr2, chr3 = "";
			var enc1, enc2, enc3, enc4 = "";
			var i = 0;

			// remove all characters that are not A-Z, a-z, 0-9, +, /, or =
			var base64test = /[^A-Za-z0-9\+\/\=]/g;
			if (base64test.exec(input)) {
				window
						.alert("There were invalid base64 characters in the input text.\n"
								+ "Valid base64 characters are A-Z, a-z, 0-9, '+', '/',and '='\n"
								+ "Expect errors in decoding.");
			}
			input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");

			do {
				enc1 = this.keyStr.indexOf(input.charAt(i++));
				enc2 = this.keyStr.indexOf(input.charAt(i++));
				enc3 = this.keyStr.indexOf(input.charAt(i++));
				enc4 = this.keyStr.indexOf(input.charAt(i++));

				chr1 = (enc1 << 2) | (enc2 >> 4);
				chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);
				chr3 = ((enc3 & 3) << 6) | enc4;

				output = output + String.fromCharCode(chr1);

				if (enc3 != 64) {
					output = output + String.fromCharCode(chr2);
				}
				if (enc4 != 64) {
					output = output + String.fromCharCode(chr3);
				}

				chr1 = chr2 = chr3 = "";
				enc1 = enc2 = enc3 = enc4 = "";

			} while (i < input.length);

			return output;
		}
	};
	
	
	FileUploadService.$inject = ['$http', 'consts'];
    function FileUploadService($http , consts) {
        var service = {};
        service.UploadOnServer = UploadOnServer;
        return service;

        function UploadOnServer(formdata , callback) {
            $http({ method: 'POST',
                    url: consts.fileUpoadUrl,
                    data: formdata,
                    headers: {'Content-Type': undefined }
                })
			.success(function(response){callback(response);})
			.error( function(response){callback({success:false, message:"Service invokation error."});});
        }
    };
	
	//ChampionshipService
	
	ChampionshipService.$inject = ['$http', 'consts'];
    function ChampionshipService($http , consts) {
        var service = {};

        service.GetAll = GetAll;
        service.GetById = GetById;
        service.Create = Create;
        service.Update = Update;
		/*
        service.Delete = Delete;
		*/

        return service;

        function GetAll(callback) {
			$http.post( consts.apiUrl , { 'service':'Championship', 'method':'get'})			
			.success(function(response) {			
			callback(response);
			}).error( function(response){				
				callback({ success: false, message: "Service invokation error." }) ;				
			} );
        }
        function GetById(id , callback) {
			$http.post( consts.apiUrl , { 'service':'Championship', 'method':'getById', 'id':id})
			.success(function(response){callback(response);})
			.error(function(response){callback({success:false,message:"Service invokation error."});});
        }
		
        function Create(fileName, vm , callback) {
            $http.post( consts.apiUrl , 
			{'service':'Championship', 'method':'create',images: fileName,
        	gameName: vm.gameName,platform: vm.platform,gamePrice: vm.gamePrice,
        	until: vm.until,purchasePrize: vm.purchasePrize,gameType: vm.gameType,
        	UserRegistered: vm.UserRegistered,TotalRounds: vm.TotalRounds})
			.success(function(response){callback(response);})
			.error(function(response){callback({success:false,message:"Service invokation error."});});
        }

		function Update(fileName, vm , callback) {
            $http.post( consts.apiUrl , 
			{'service':'Championship', 'method':'update',images: fileName,
        	gameName: vm.gameName,platform: vm.platform,gamePrice: vm.gamePrice,
        	until: vm.until,purchasePrize: vm.purchasePrize,gameType: vm.gameType,
        	UserRegistered: vm.UserRegistered,TotalRounds: vm.TotalRounds,
        	gameId: vm.gameId})
			.success(function(response){callback(response);})
			.error(function(response){callback({success:false,message:"Service invokation error."});});
        }

		/*
        function GetByUsername(username) {
            return $http.get('/api/users/' + username).then(handleSuccess, handleError('Error getting user by username'));
        }

        function Delete(id) {
            return $http.delete('/api/users/' + id).then(handleSuccess, handleError('Error deleting user'));
        }
		*/
        // private functions

        function handleSuccess(res) {
			alert("Service finished");
            return res;
        }

        function handleError(error) {
            return function () {
                return { success: false, message: error };
            };
        }
		
    };
	
	UserService.$inject = ['$http'];
    function UserService($http) {
        var service = {};

        service.GetAll = GetAll;
        service.GetById = GetById;
        service.GetByUsername = GetByUsername;
        service.Create = Create;
        service.Update = Update;
        service.Delete = Delete;

        return service;

        function GetAll() {
            return $http.get('/services/member').then(handleSuccess, handleError('Error getting all users'));
        }

        function GetById(id) {
            return $http.get('/api/users/' + id).then(handleSuccess, handleError('Error getting user by id'));
        }

        function GetByUsername(username) {
            return $http.get('/api/users/' + username).then(handleSuccess, handleError('Error getting user by username'));
        }

        function Create(user) {
            return $http.post('/api/users', user).then(handleSuccess, handleError('Error creating user'));
        }

        function Update(user) {
            return $http.put('/api/users/' + user.id, user).then(handleSuccess, handleError('Error updating user'));
        }

        function Delete(id) {
            return $http.delete('/api/users/' + id).then(handleSuccess, handleError('Error deleting user'));
        }

        // private functions

        function handleSuccess(res) {
            return res.data;
        }

        function handleError(error) {
            return function () {
                return { success: false, message: error };
            };
        }
    };
    
    FlashService.$inject = ['$rootScope'];
    function FlashService($rootScope) {
        var service = {};

        service.Success = Success;
        service.Error = Error;

        initService();

        return service;

        function initService() {
            $rootScope.$on('$locationChangeStart', function () {
                clearFlashMessage();
            });

            function clearFlashMessage() {
                var flash = $rootScope.flash;
                if (flash) {
                    if (!flash.keepAfterLocationChange) {
                        delete $rootScope.flash;
                    } else {
                        // only keep for a single location change
                        flash.keepAfterLocationChange = false;
                    }
                }
            }
        }

        function Success(message, keepAfterLocationChange) {
            $rootScope.flash = {
                message: message,
                type: 'success', 
                keepAfterLocationChange: keepAfterLocationChange
            };
        }

        function Error(message, keepAfterLocationChange) {
            $rootScope.flash = {
                message: message,
                type: 'error',
                keepAfterLocationChange: keepAfterLocationChange
            };
        }
    };

	
    
	
	angular.module('gamerland').directive('fileModel', ['$parse', function ($parse) {
		return {
		   restrict: 'A',
		   link: function(scope, element, attrs) {
			  var model = $parse(attrs.fileModel);
			  var modelSetter = model.assign;
			  
			  element.bind('change', function(){
				 scope.$apply(function(){
					modelSetter(scope, element[0].files[0]);
				 });
			  });
		   }
		};
	 }])
	 .directive('ngFiles', ['$parse', function ($parse) {

        function fn_link(scope, element, attrs) {
            var onChange = $parse(attrs.ngFiles);
            element.on('change', function (event) {
                onChange(scope, { $files: event.target.files });
            });
        };

        return {
            link: fn_link
        }
    } ])
	 ;
	
	angular.module('gamerland').service('fileUpload', ['$http', function ($http) {
		this.uploadFileToUrl = function(file, uploadUrl){
		   var fd = new FormData();
		   fd.append('file', file);
		   fd.append('name', "Hatim");
		
		   $http.post(uploadUrl, fd, {
			  transformRequest: angular.identity,
			  headers: {'Content-Type': undefined}
		   })
		
		   .success(function(response){
			   alert(response);
		   })
		
		   .error(function(){
			   alert("Got erro");
		   });
		}
	 }]);
      
	
	
})();