using System;
using System.Collections.Generic;

namespace ShoppingCart.Core.Models
{
    public partial class Categories
    {
        public Catagories()
        {
            Items = new HashSet<Items>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        public ICollection<Items> Items { get; set; }
    }
}
