using System;
using System.Collections.Generic;

namespace ShoppingCart.Core.Models
{
    public partial class OrderDetails
    {
        public int OrderDetailId { get; set; }
        public int OrderId { get; set; }
        public int ItemId { get; set; }
        public int Quantity { get; set; }
        public decimal UnitPrice { get; set; }

        public Items Item { get; set; }
        public Orders Order { get; set; }
    }
}
