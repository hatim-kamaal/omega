(function () {
    'use strict';

    //, 'ngFacebook'
    //, 'datatables', , 'ngTable' //,'ui.router'
    angular
        .module('gamerland', ['ngRoute', 'ngResource','ngCookies', 'ngTable','chart.js'])
		.constant('consts', {
			appName: 'GamerLand',
			appVersion: 0.1,
			apiUrl: 'http://localhost/omega/gamerland/service/Service.php',
			fileUpoadUrl: 'http://localhost/omega/gamerland/service/FileUpload.php'
			})
        .config(config)
        .run(run);
	
	
	//gamerland	

    //, '$facebookProvider'
    config.$inject = ['$routeProvider', '$locationProvider'];
    function config($routeProvider, $locationProvider) {
    	
    	//$facebookProvider.setAppId('1564484997178485');
    	
        $routeProvider
            .when('/', {
                controller: 'HomeController',
                templateUrl: 'view/home.view.html',
                controllerAs: 'vm'
            })
            .when('/login', {
                controller: 'LoginController',
                templateUrl: 'view/login.view.html',
                controllerAs: 'vm'
            })
			.when('/logout', {
                controller: 'LogoutController',
                templateUrl: 'view/logout.view.html',
                controllerAs: 'vm'
            })
			.when('/championships', {
                controller: 'ChampionshipsController',
                templateUrl: 'view/championships.view.html',
                controllerAs: 'vm'
            })
			.when('/addcmpnships', {
                controller: 'AddChampionshipsController',
                templateUrl: 'view/add.championships.view.html',
                controllerAs: 'vm'
            })
            .when('/editcmpnships/:id', {
                controller: 'EditChampionshipsController',
                templateUrl: 'view/add.championships.view.html',
                controllerAs: 'vm'
            })
            .when('/email-all', {
                controller: 'EmailAllController',
                templateUrl: 'view/email.broadcast.view.html',
                controllerAs: 'vm'
            })
            .when('/email-tmplte', {
                controller: 'EmailTemplateController',
                templateUrl: 'view/email.template.view.html',
                controllerAs: 'vm'
            })
            .when('/users', {
                controller: 'UserController',
                templateUrl: 'view/users.view.html',
                controllerAs: 'vm'
            })
            .when('/report-champs', {
                controller: 'ReportChampsController',
                templateUrl: 'view/report.championship.view.html',
                controllerAs: 'vm'
            })
            .when('/user-rank', {
                controller: 'UserRankController',
                templateUrl: 'view/report.user.rank.view.html',
                controllerAs: 'vm'
            })
            .when('/pwd-reset', {
                controller: 'ResetPasswordController',
                templateUrl: 'view/reset.password.view.html',
                controllerAs: 'vm'
            })
            .when('/rnd', {
                controller: 'RnDController',
                templateUrl: 'view/rnd.view.html',
                controllerAs: 'vm'
            })
            /*
            
            .when('/register', {
                controller: 'RegisterController',
                templateUrl: 'view/register.view.html',
                controllerAs: 'vm'
            })
            
		  .when('/store', {
			templateUrl: 'partials/store.htm',
			controller: storeController 
		  }).
		  when('/products/:productSku', {
			templateUrl: 'partials/product.htm',
			controller: storeController
		  }).
		  when('/cart', {
			templateUrl: 'partials/shoppingCart.htm',
			controller: storeController
		  })
            */
			
            .otherwise({ redirectTo: '/login' });
    }

    run.$inject = ['$rootScope', '$location', '$cookieStore', '$http','$window'];
    function run($rootScope,  $location, $cookieStore, $http, $window) {
    	$rootScope.authen = false;
    	/*
    	(function(){
    	     // If we've already installed the SDK, we're done
    	     if (document.getElementById('facebook-jssdk')) {return;}

    	     // Get the first script element, which we'll use to find the parent node
    	     var firstScriptElement = document.getElementsByTagName('script')[0];

    	     // Create a new script element and set its id
    	     var facebookJS = document.createElement('script'); 
    	     facebookJS.id = 'facebook-jssdk';

    	     // Set the new script's source to the source of the Facebook JS SDK
    	     facebookJS.src = '//connect.facebook.net/en_US/all.js';

    	     // Insert the Facebook JS SDK into the DOM
    	     firstScriptElement.parentNode.insertBefore(facebookJS, firstScriptElement);
    	   }());
		*/
        // keep user logged in after page refresh
        $rootScope.globals = $cookieStore.get('globals') || {};
        if ($rootScope.globals.currentUser) {
            $http.defaults.headers.common['Authorization'] = 'Basic ' + $rootScope.globals.currentUser.authdata; // jshint ignore:line
        }

        $rootScope.$on('$locationChangeStart', function (event, next, current) {
            // redirect to login page if not logged in and trying to access a restricted page
            var restrictedPage = $.inArray($location.path(), ['/login', '/pwd-reset']) === -1;
            var loggedIn = $rootScope.globals.currentUser;
            if(loggedIn){
            	$rootScope.authen = true;
            }
            if (restrictedPage && !loggedIn) {
                $location.path('/login');
            }
        });
    }

})();