using ShoppingCart.Core.Models;
using System;
using System.Collections.Generic;
using System.Text;

namespace ShoppingCart.Core.ViewModels
{
    public class ShoppingCartViewModel
    {
        public List<Carts> CartItems { get; set; }
        public decimal CartTotal { get; set; }
    }
}
