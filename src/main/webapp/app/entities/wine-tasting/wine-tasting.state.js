(function() {
    'use strict';

    angular
        .module('homeRecipesApp')
        .config(stateConfig);

    stateConfig.$inject = ['$stateProvider'];

    function stateConfig($stateProvider) {
        $stateProvider
        .state('wine-tasting', {
            parent: 'entity',
            url: '/wine-tasting',
            data: {
                authorities: ['ROLE_USER'],
                pageTitle: 'WineTastings'
            },
            views: {
                'content@': {
                    templateUrl: 'app/entities/wine-tasting/wine-tastings.html',
                    controller: 'WineTastingController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
            }
        })
        .state('wine-tasting-detail', {
            parent: 'entity',
            url: '/wine-tasting/{id}',
            data: {
                authorities: ['ROLE_USER'],
                pageTitle: 'WineTasting'
            },
            views: {
                'content@': {
                    templateUrl: 'app/entities/wine-tasting/wine-tasting-detail.html',
                    controller: 'WineTastingDetailController',
                    controllerAs: 'vm'
                }
            },
            resolve: {
                entity: ['$stateParams', 'WineTasting', function($stateParams, WineTasting) {
                    return WineTasting.get({id : $stateParams.id}).$promise;
                }],
                previousState: ["$state", function ($state) {
                    var currentStateData = {
                        name: $state.current.name || 'wine-tasting',
                        params: $state.params,
                        url: $state.href($state.current.name, $state.params)
                    };
                    return currentStateData;
                }]
            }
        })
        .state('wine-tasting-detail.edit', {
            parent: 'wine-tasting-detail',
            url: '/detail/edit',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/wine-tasting/wine-tasting-dialog.html',
                    controller: 'WineTastingDialogController',
                    controllerAs: 'vm',
                    backdrop: 'static',
                    size: 'lg',
                    resolve: {
                        entity: ['WineTasting', function(WineTasting) {
                            return WineTasting.get({id : $stateParams.id}).$promise;
                        }]
                    }
                }).result.then(function() {
                    $state.go('^', {}, { reload: false });
                }, function() {
                    $state.go('^');
                });
            }]
        })
        .state('wine-tasting.new', {
            parent: 'wine-tasting',
            url: '/new',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/wine-tasting/wine-tasting-dialog.html',
                    controller: 'WineTastingDialogController',
                    controllerAs: 'vm',
                    backdrop: 'static',
                    size: 'lg',
                    resolve: {
                        entity: function () {
                            return {
                                date: null,
                                note: null,
                                comment: null,
                                id: null
                            };
                        }
                    }
                }).result.then(function() {
                    $state.go('wine-tasting', null, { reload: true });
                }, function() {
                    $state.go('wine-tasting');
                });
            }]
        })
        .state('wine-tasting.edit', {
            parent: 'wine-tasting',
            url: '/{id}/edit',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/wine-tasting/wine-tasting-dialog.html',
                    controller: 'WineTastingDialogController',
                    controllerAs: 'vm',
                    backdrop: 'static',
                    size: 'lg',
                    resolve: {
                        entity: ['WineTasting', function(WineTasting) {
                            return WineTasting.get({id : $stateParams.id}).$promise;
                        }]
                    }
                }).result.then(function() {
                    $state.go('wine-tasting', null, { reload: true });
                }, function() {
                    $state.go('^');
                });
            }]
        })
        .state('wine-tasting.delete', {
            parent: 'wine-tasting',
            url: '/{id}/delete',
            data: {
                authorities: ['ROLE_USER']
            },
            onEnter: ['$stateParams', '$state', '$uibModal', function($stateParams, $state, $uibModal) {
                $uibModal.open({
                    templateUrl: 'app/entities/wine-tasting/wine-tasting-delete-dialog.html',
                    controller: 'WineTastingDeleteController',
                    controllerAs: 'vm',
                    size: 'md',
                    resolve: {
                        entity: ['WineTasting', function(WineTasting) {
                            return WineTasting.get({id : $stateParams.id}).$promise;
                        }]
                    }
                }).result.then(function() {
                    $state.go('wine-tasting', null, { reload: true });
                }, function() {
                    $state.go('^');
                });
            }]
        });
    }

})();
