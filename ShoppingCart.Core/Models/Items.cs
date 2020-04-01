using System;
using System.Collections.Generic;

namespace ShoppingCart.Core.Models
{
    public partial class Items
    {
        public Items()
        {
            Carts = new HashSet<Carts>();
            OrderDetails = new HashSet<OrderDetails>();
        }

        public int Id { get; set; }
        public int CategoryId { get; set; }
        public string Name { get; set; }
        public decimal Price { get; set; }
        public string ItemPictureUrl { get; set; }
        public byte[] InternalImage { get; set; }

        public Categories Category { get; set; }
        public ICollection<Carts> Carts { get; set; }
        public ICollection<OrderDetails> OrderDetails { get; set; }
    }
}
