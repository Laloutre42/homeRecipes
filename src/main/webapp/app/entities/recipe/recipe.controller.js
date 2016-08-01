(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('RecipeController', RecipeController);

    RecipeController.$inject = ['$scope', '$state', 'DataUtils', 'Recipe'];

    function RecipeController ($scope, $state, DataUtils, Recipe) {
        var vm = this;
        
        vm.recipes = [];
        vm.openFile = DataUtils.openFile;
        vm.byteSize = DataUtils.byteSize;

        loadAll();

        function loadAll() {
            Recipe.query(function(result) {
                vm.recipes = result;
            });
        }
    }
})();
