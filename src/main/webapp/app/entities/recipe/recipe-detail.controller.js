(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('RecipeDetailController', RecipeDetailController);

    RecipeDetailController.$inject = ['$scope', '$rootScope', '$stateParams', 'previousState', 'DataUtils', 'entity', 'Recipe'];

    function RecipeDetailController($scope, $rootScope, $stateParams, previousState, DataUtils, entity, Recipe) {
        var vm = this;

        vm.recipe = entity;
        vm.previousState = previousState.name;
        vm.byteSize = DataUtils.byteSize;
        vm.openFile = DataUtils.openFile;

        var unsubscribe = $rootScope.$on('homeRecipesApp:recipeUpdate', function(event, result) {
            vm.recipe = result;
        });
        $scope.$on('$destroy', unsubscribe);
    }
})();
