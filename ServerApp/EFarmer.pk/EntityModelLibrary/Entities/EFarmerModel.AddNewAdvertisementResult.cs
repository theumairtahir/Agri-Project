﻿//------------------------------------------------------------------------------
// This is auto-generated code.
//------------------------------------------------------------------------------
// This code was generated by Entity Developer tool using EF Core template.
// Code is generated on: 2/6/2020 9:33:50 PM
//
// Changes to this file may cause incorrect behavior and will be lost if
// the code is regenerated.
//------------------------------------------------------------------------------

using System;
using System.Data;
using System.ComponentModel;
using System.Linq;
using System.Linq.Expressions;
using System.Data.Common;
using System.Collections.Generic;
using Microsoft.EntityFrameworkCore.Infrastructure;

namespace EFarmerPkModelLibrary.Entities
{
    public partial class AddNewAdvertisementResult {

        public AddNewAdvertisementResult()
        {
            OnCreated();
        }
        private ILazyLoader lazyLoader;
        protected AddNewAdvertisementResult(ILazyLoader lazyLoader)
        {
            this.lazyLoader = lazyLoader;
        }
        public virtual decimal? Column0
        {
            get;
            set;
        }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }

}
