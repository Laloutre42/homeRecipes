(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('WineDialogController', WineDialogController);

    WineDialogController.$inject = ['$timeout', '$scope', '$stateParams', '$uibModalInstance', 'DataUtils', 'entity', 'Wine', 'WineTasting'];

    function WineDialogController ($timeout, $scope, $stateParams, $uibModalInstance, DataUtils, entity, Wine, WineTasting) {
        var vm = this;

        vm.wine = entity;
        vm.clear = clear;
        vm.datePickerOpenStatus = {};
        vm.openCalendar = openCalendar;
        vm.byteSize = DataUtils.byteSize;
        vm.openFile = DataUtils.openFile;
        vm.save = save;
        vm.winetastings = WineTasting.query();

        $timeout(function (){
            angular.element('.form-group:eq(1)>input').focus();
        });

        function clear () {
            $uibModalInstance.dismiss('cancel');
        }

        function save () {
            vm.isSaving = true;
            if (vm.wine.id !== null) {
                Wine.update(vm.wine, onSaveSuccess, onSaveError);
            } else {
                Wine.save(vm.wine, onSaveSuccess, onSaveError);
            }
        }

        function onSaveSuccess (result) {
            $scope.$emit('homeRecipesApp:wineUpdate', result);
            $uibModalInstance.close(result);
            vm.isSaving = false;
        }

        function onSaveError () {
            vm.isSaving = false;
        }


        vm.setImage = function ($file, wine) {
            if ($file && $file.$error === 'pattern') {
                return;
            }
            if ($file) {
                DataUtils.toBase64($file, function(base64Data) {
                    $scope.$apply(function() {
                        wine.image = base64Data;
                        wine.imageContentType = $file.type;
                    });
                });
            }
        };
        vm.datePickerOpenStatus.purchaseDate = false;

        function openCalendar (date) {
            vm.datePickerOpenStatus[date] = true;
        }
    }
})();
