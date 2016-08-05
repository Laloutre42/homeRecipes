(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('WineController', WineController);

    WineController.$inject = ['$scope', '$state', '$filter', '$log', 'NgTableParams', 'DataUtils', 'Wine'];

    function WineController ($scope, $state, $filter, $log, NgTableParams, DataUtils, Wine) {
        var vm = this;
        
        vm.wines = [];
        vm.openFile = DataUtils.openFile;
        vm.byteSize = DataUtils.byteSize;

       vm.wines = new NgTableParams({
          page: 1,
          count: 10,
        }, {
          getData: function (params) {

            var filter = params.filter();
            var sorting = params.sorting();
            var count = params.count();
            var page = params.page();


              return Wine.query().$promise.then(function (data) {
                  $log.debug('[WineController][getData] recipes data length is ', data.length);

                  params.total(data.length);
                  data = params.sorting() ? $filter('orderBy')(data, params.orderBy()) : data;
                  data = params.filter() ? $filter('filter')(data, params.filter()) : data;
                  data = data.slice((params.page() - 1) * params.count(), params.page() * params.count());

                  return data;
            });
          }
        });
    }
})();
