(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('WineTastingController', WineTastingController);

    WineTastingController.$inject = ['$scope', '$state', 'WineTasting'];

    function WineTastingController ($scope, $state, WineTasting) {
        var vm = this;
        
        vm.wineTastings = [];

        loadAll();

        function loadAll() {
            WineTasting.query(function(result) {
                vm.wineTastings = result;
            });
        }
    }
})();
