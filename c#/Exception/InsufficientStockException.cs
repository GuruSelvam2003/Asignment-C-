﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TechShop.exception
{
    public class InsufficientStockException : TechShopException
    {
        public InsufficientStockException(string message) : base(message) { }
    }
}
