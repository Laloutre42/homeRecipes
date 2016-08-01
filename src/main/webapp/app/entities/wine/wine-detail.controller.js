(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('WineDetailController', WineDetailController);

    WineDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'DataUtils', 'entity', 'Wine', 'WineTasting'];

    function WineDetailController($scope, $rootScope, $stateParams, previousState, DataUtils, entity, Wine, WineTasting) {
        var vm = this;

        vm.wine = entity;
        vm.previousState = previousState.name;
        vm.byteSize = DataUtils.byteSize;
        vm.openFile = DataUtils.openFile;

        var unsubscribe = $rootScope.$on('homeRecipesApp:wineUpdate', function(event, result) {
            vm.wine = result;
        });
        $scope.$on('$destroy', unsubscribe);
    }
})();
