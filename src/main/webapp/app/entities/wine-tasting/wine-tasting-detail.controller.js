(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('WineTastingDetailController', WineTastingDetailController);

    WineTastingDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'entity', 'WineTasting', 'Wine'];

    function WineTastingDetailController($scope, $rootScope, $stateParams, previousState, entity, WineTasting, Wine) {
        var vm = this;

        vm.wineTasting = entity;
        vm.previousState = previousState.name;

        var unsubscribe = $rootScope.$on('homeRecipesApp:wineTastingUpdate', function(event, result) {
            vm.wineTasting = result;
        });
        $scope.$on('$destroy', unsubscribe);
    }
})();
