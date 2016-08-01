(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('WineTastingDeleteController',WineTastingDeleteController);

    WineTastingDeleteController.$inject = ['$uibModalInstance', 'entity', 'WineTasting'];

    function WineTastingDeleteController($uibModalInstance, entity, WineTasting) {
        var vm = this;

        vm.wineTasting = entity;
        vm.clear = clear;
        vm.confirmDelete = confirmDelete;
        
        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function confirmDelete (id) {
            WineTasting.delete({id: id},
                function () {
                    $uibModalInstance.close(true);
                });
        }
    }
})();
