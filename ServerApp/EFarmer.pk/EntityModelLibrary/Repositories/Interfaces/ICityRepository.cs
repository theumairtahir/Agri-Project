﻿using EFarmer.Models;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace EFarmerPkModelLibrary.Repositories
{
    public interface ICityRepository : IDisposable
    {
        short Create(City model);
        bool Delete(short id);
        City Read(short id);
        Task<List<City>> ReadAllAsync();
        bool Update(City model);
    }
}