(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('RecipeDialogController', RecipeDialogController);

    RecipeDialogController.$inject = ['$timeout', '$scope', '$stateParams', '$uibModalInstance', 'DataUtils', 'entity', 'Recipe'];

    function RecipeDialogController ($timeout, $scope, $stateParams, $uibModalInstance, DataUtils, entity, Recipe) {
        var vm = this;

        vm.recipe = entity;
        vm.clear = clear;
        vm.byteSize = DataUtils.byteSize;
        vm.openFile = DataUtils.openFile;
        vm.save = save;

        $timeout(function (){
            angular.element('.form-group:eq(1)>input').focus();
        });

        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function save () {
            vm.isSaving = true;
            if (vm.recipe.id !== null) {
                Recipe.update(vm.recipe, onSaveSuccess, onSaveError);
            } else {
                Recipe.save(vm.recipe, onSaveSuccess, onSaveError);
            }
        }

        function onSaveSuccess (result) {
            $scope.$emit('homeRecipesApp:recipeUpdate', result);
            $uibModalInstance.close(result);
            vm.isSaving = false;
        }

        function onSaveError () {
            vm.isSaving = false;
        }


        vm.setImage = function ($file, recipe) {
            if ($file && $file.$error === 'pattern') {
                return;
            }
            if ($file) {
                DataUtils.toBase64($file, function(base64Data) {
                    $scope.$apply(function() {
                        recipe.image = base64Data;
                        recipe.imageContentType = $file.type;
                    });
                });
            }
        };

    }
})();
