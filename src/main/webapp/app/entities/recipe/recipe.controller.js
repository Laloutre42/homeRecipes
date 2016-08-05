(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .controller('RecipeController', RecipeController);

    RecipeController.$inject = ['$scope', '$state', '$filter', '$log', 'NgTableParams', 'DataUtils', 'Recipe'];

    function RecipeController ($scope, $state, $filter, $log, NgTableParams, DataUtils, Recipe) {
        var vm = this;
        
        vm.recipes = [];
        vm.openFile = DataUtils.openFile;
        vm.byteSize = DataUtils.byteSize;

        vm.recipes = new NgTableParams({
          page: 1,
          count: 10,
        }, {
          getData: function (params) {

            var filter = params.filter();
            var sorting = params.sorting();
            var count = params.count();
            var page = params.page();


              return Recipe.query().$promise.then(function (data) {
                  $log.debug('[RecipeController][getData] recipes data length is ', data.length);

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
