(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('WineDeleteController',WineDeleteController);

    WineDeleteController.$inject = ['$uibModalInstance', 'entity', 'Wine'];

    function WineDeleteController($uibModalInstance, entity, Wine) {
        var vm = this;

        vm.wine = entity;
        vm.clear = clear;
        vm.confirmDelete = confirmDelete;
        
        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function confirmDelete (id) {
            Wine.delete({id: id},
                function () {
                    $uibModalInstance.close(true);
                });
        }
    }
})();
