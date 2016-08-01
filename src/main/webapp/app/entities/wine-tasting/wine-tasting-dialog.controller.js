(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('WineTastingDialogController', WineTastingDialogController);

    WineTastingDialogController.$inject = ['$timeout', '$scope', '$stateParams', '$uibModalInstance', 'entity', 'WineTasting', 'Wine'];

    function WineTastingDialogController ($timeout, $scope, $stateParams, $uibModalInstance, entity, WineTasting, Wine) {
        var vm = this;

        vm.wineTasting = entity;
        vm.clear = clear;
        vm.datePickerOpenStatus = {};
        vm.openCalendar = openCalendar;
        vm.save = save;
        vm.wines = Wine.query();

        $timeout(function (){
            angular.element('.form-group:eq(1)>input').focus();
        });

        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function save () {
            vm.isSaving = true;
            if (vm.wineTasting.id !== null) {
                WineTasting.update(vm.wineTasting, onSaveSuccess, onSaveError);
            } else {
                WineTasting.save(vm.wineTasting, onSaveSuccess, onSaveError);
            }
        }

        function onSaveSuccess (result) {
            $scope.$emit('homeRecipesApp:wineTastingUpdate', result);
            $uibModalInstance.close(result);
            vm.isSaving = false;
        }

        function onSaveError () {
            vm.isSaving = false;
        }

        vm.datePickerOpenStatus.date = false;

        function openCalendar (date) {
            vm.datePickerOpenStatus[date] = true;
        }
    }
})();
