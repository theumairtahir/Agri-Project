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
    public partial class GetCategoryResult {

        private ILazyLoader lazyLoader;
        protected GetCategoryResult(ILazyLoader lazyLoader)
        {
            this.lazyLoader = lazyLoader;
        }
        public GetCategoryResult()
        {
            OnCreated();
        }

        public virtual short Id
        {
            get;
            set;
        }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }

}
