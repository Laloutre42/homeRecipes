(function() {
    'use strict';
    angular
        .module('homeRecipesApp')
        .factory('Wine', Wine);

    Wine.$inject = ['$resource', 'DateUtils'];

    function Wine ($resource, DateUtils) {
        var resourceUrl =  'api/wines/:id';

        return $resource(resourceUrl, {}, {
            'query': { method: 'GET', isArray: true},
            'get': {
                method: 'GET',
                transformResponse: function (data) {
                    if (data) {
                        data = angular.fromJson(data);
                        data.purchaseDate = DateUtils.convertLocalDateFromServer(data.purchaseDate);
                    }
                    return data;
                }
            },
            'update': {
                method: 'PUT',
                transformRequest: function (data) {
                    data.purchaseDate = DateUtils.convertLocalDateToServer(data.purchaseDate);
                    return angular.toJson(data);
                }
            },
            'save': {
                method: 'POST',
                transformRequest: function (data) {
                    data.purchaseDate = DateUtils.convertLocalDateToServer(data.purchaseDate);
                    return angular.toJson(data);
                }
            }
        });
    }
})();
