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
    public partial class ADVERTISEMENT {

        private ILazyLoader lazyLoader;
        protected ADVERTISEMENT(ILazyLoader lazyLoader)
        {
            this.lazyLoader = lazyLoader;
        }
        public ADVERTISEMENT()
        {
            this.BUYERADDSDIFFERENTADSTOFAVs_AdId = new List<BUYERADDSDIFFERENTADSTOFAV>();
            OnCreated();
        }

        public virtual long Id
        {
            get;
            set;
        }

        public virtual short Quality
        {
            get;
            set;
        }

        public virtual short Quantity
        {
            get;
            set;
        }

        public virtual System.DateTime PostedDateTime
        {
            get;
            set;
        }

        public virtual decimal Price
        {
            get;
            set;
        }

        public virtual string Picture
        {
            get;
            set;
        }

        public virtual CITY City
        {
            get;
            set;
        }

        public virtual AGROITEM AgroItem
        {
            get;
            set;
        }

        public virtual USER Seller
        {
            get;
            set;
        }

        public virtual IList<BUYERADDSDIFFERENTADSTOFAV> BUYERADDSDIFFERENTADSTOFAVs_AdId
        {
            get;
            set;
        }

        #region Extensibility Method Definitions

        partial void OnCreated();

        #endregion
    }

}
