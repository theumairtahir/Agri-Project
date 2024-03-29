﻿using Autofac;
using EFarmer.Connections;
using EFarmerPkModelLibrary.Repositories;
using EntityGrabber;

namespace EFarmerPkModelLibrary.Factories
{
    public class RepositoryFactory
    {
        private readonly BuildOptions options;
        public RepositoryFactory(BuildOptions options)
        {
            this.options = options;
        }
        public IContainer Build()
        {
            var builder = new ContainerBuilder();

            builder.RegisterType<SQLConnection>()
                .As<IDbConnection>()
                .WithParameter("connectionString", options.ConnectionString);
            builder.RegisterType<UserRepository>()
                .As<IUserRepository>();
            builder.RegisterType<CityRepository>()
                .As<ICityRepository>();
            builder.RegisterType<CategoryRepository>()
                .As<ICategoryRepository>();
            builder.RegisterType<AgroItemRepository>()
                .As<IAgroItemRepository>();
            builder.RegisterType<AdvertisementRepository>()
                .As<IAdvertisementRepository>();
            return builder.Build();
        }
        public class BuildOptions
        {
            public string ConnectionString { get; set; }
        }
    }
}
