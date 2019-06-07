using System;
using System.Collections.Generic;
using System.Text;

namespace ShoppingCart.Core.ViewModels
{
    public class ShoppingCartRemoveViewModel
    {        
        public string Message { get; set; }
        public decimal CartTotal { get; set; }
        public int CartCount { get; set; }
        public int ItemCount { get; set; }
        public int DeleteId { get; set; }        
    }
}
