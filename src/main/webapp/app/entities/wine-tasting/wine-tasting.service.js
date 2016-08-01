(function() {
    'use strict';
    angular
        .module('homeRecipesApp')
        .factory('WineTasting', WineTasting);

    WineTasting.$inject = ['$resource', 'DateUtils'];

    function WineTasting ($resource, DateUtils) {
        var resourceUrl =  'api/wine-tastings/:id';

        return $resource(resourceUrl, {}, {
            'query': { method: 'GET', isArray: true},
            'get': {
                method: 'GET',
                transformResponse: function (data) {
                    if (data) {
                        data = angular.fromJson(data);
                        data.date = DateUtils.convertDateTimeFromServer(data.date);
                    }
                    return data;
                }
            },
            'update': { method:'PUT' }
        });
    }
})();
