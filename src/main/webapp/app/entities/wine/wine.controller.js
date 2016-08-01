(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('WineController', WineController);

    WineController.$inject = ['$scope', '$state', 'DataUtils', 'Wine'];

    function WineController ($scope, $state, DataUtils, Wine) {
        var vm = this;
        
        vm.wines = [];
        vm.openFile = DataUtils.openFile;
        vm.byteSize = DataUtils.byteSize;

        loadAll();

        function loadAll() {
            Wine.query(function(result) {
                vm.wines = result;
            });
        }
    }
})();
