﻿//------------------------------------------------------------------------------
// This is auto-generated code.
//------------------------------------------------------------------------------
// This code was generated by Entity Developer tool using EF Core template.
// Code is generated on: 2/6/2020 9:30:53 PM
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
    public partial class CATEGORY {

        private ILazyLoader lazyLoader;
        protected CATEGORY(ILazyLoader lazyLoader)
        {
            this.lazyLoader = lazyLoader;
        }
        public CATEGORY()
        {
            this.AGROITEMS = new List<AGROITEM>();
            OnCreated();
        }

        public virtual short Id
        {
            get;
            set;
        }

        public virtual string Name
        {
            get;
            set;
        }

        public virtual string UName
        {
            get;
            set;
        }

        public virtual IList<AGROITEM> AGROITEMS
        {
            get;
            set;
        }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }

}
