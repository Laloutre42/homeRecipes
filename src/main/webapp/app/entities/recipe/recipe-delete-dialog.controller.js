(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('RecipeDeleteController',RecipeDeleteController);

    RecipeDeleteController.$inject = ['$uibModalInstance', 'entity', 'Recipe'];

    function RecipeDeleteController($uibModalInstance, entity, Recipe) {
        var vm = this;

        vm.recipe = entity;
        vm.clear = clear;
        vm.confirmDelete = confirmDelete;
        
        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function confirmDelete (id) {
            Recipe.delete({id: id},
                function () {
                    $uibModalInstance.close(true);
                });
        }
    }
})();
