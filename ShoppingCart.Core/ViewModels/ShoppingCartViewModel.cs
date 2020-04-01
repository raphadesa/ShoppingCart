using ShoppingCart.Core.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ShoppingCart.Core.ViewModels
{
    public class ShoppingCartViewModel
    {
        public List<Carts> CartItems { get; set; }
        public decimal CartTotal => CartItems.Sum(c => c.Count * c.Item.Price);
    }
}
