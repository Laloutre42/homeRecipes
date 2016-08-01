(function() {
    'use strict';
    angular
        .module('homeRecipesApp')
        .factory('Recipe', Recipe);

    Recipe.$inject = ['$resource'];

    function Recipe ($resource) {
        var resourceUrl =  'api/recipes/:id';

        return $resource(resourceUrl, {}, {
            'query': { method: 'GET', isArray: true},
            'get': {
                method: 'GET',
                transformResponse: function (data) {
                    if (data) {
                        data = angular.fromJson(data);
                    }
                    return data;
                }
            },
            'update': { method:'PUT' }
        });
    }
})();
