using Microsoft.EntityFrameworkCore;
using ShoppingCart.Core.Models;
using ShoppingCart.Core.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;

namespace ShoppingCart.Core.Services
{ 
    public class ShoppingCartService
    {
        ShoppingCartDBContext storeDB = new ShoppingCartDBContext();
        public static string ShoppingCartId { get; set; } = Guid.NewGuid().ToString();           

        public static async Task<ShoppingCartService> GetCart()
        {
            var cart = new ShoppingCartService();             
            return await Task.FromResult(cart);
        }


        public async Task<ShoppingCartViewModel> shoppingCart()
        {
            var cart = await ShoppingCartService.GetCart();

            //Set up our ViewModel
            var viewModel = new ShoppingCartViewModel
            {
                CartItems = await cart.GetCartItems()                
            };
            //Return the view
            return viewModel;
        }

        public async Task<ShoppingCartRemoveViewModel> AddToCart(int id)
        {
            // Retrieve the item from the database
            var addedItem = await storeDB.Items
                .SingleAsync(item => item.Id == id);

            // Add it to the shopping cart
            var cart = await ShoppingCartService.GetCart();

            int count = await cart.AddToCart(addedItem);

            // Display the confirmation message
            var results = new ShoppingCartRemoveViewModel
            {
                Message = HttpUtility.HtmlEncode(addedItem.Name) +
                    " has been added to your shopping cart.",
                CartTotal = await cart.GetTotal(),
                CartCount = await cart.GetCount(),
                ItemCount = count,
                DeleteId = id
            };
            return results;          
           
        }

        public async Task<ShoppingCartRemoveViewModel> RemoveFromCart(int id)
        {
            // Remove the item from the cart
            var cart = await ShoppingCartService.GetCart();

            // Get the name of the item to display confirmation

            // Get the name of the album to display confirmation
            string itemName = storeDB.Items
                .Single(item => item.Id == id).Name;

            // Remove from cart
            int itemCount = await cart.RemoveFromCartItem(id);

            // Display the confirmation message
            var results = new ShoppingCartRemoveViewModel
            {
                Message = "One (1) " + HttpUtility.HtmlEncode(itemName) +
                    " has been removed from your shopping cart.",
                CartTotal = await cart.GetTotal(),
                CartCount = await cart.GetCount(),
                ItemCount = itemCount,
                DeleteId = id
            };
            return results;
        }

        public async Task<int> CartCount()
        {
            var cart = await ShoppingCartService.GetCart();
            return await cart.GetCount();
        }

        public async Task<int> AddToCart(Items item)
        {
            // Get the matching cart and item instances
            var cartItem = await storeDB.Carts.SingleOrDefaultAsync(
                c => c.CartId == ShoppingCartId
                && c.ItemId == item.Id);

            if (cartItem == null)
            {
                // Create a new cart item if no cart item exists
                cartItem = new Carts
                {
                    ItemId = item.Id,
                    CartId = ShoppingCartId,
                    Count = 1,
                    DateCreated = DateTime.Now
                };
                storeDB.Carts.Add(cartItem);
            }
            else
            {
                // If the item does exist in the cart, 
                // then add one to the quantity
                cartItem.Count++;
            }
            // Save changes
           await storeDB.SaveChangesAsync();

           return cartItem.Count;
        }

        public async Task<int> RemoveFromCartItem(int id)
        {
            // Get the cart

            var cartItem =await storeDB.Carts.SingleAsync(
                cart => cart.CartId == ShoppingCartId
                && cart.ItemId == id);


            int itemCount = 0;

            if (cartItem != null)
            {
                if (cartItem.Count > 1)
                {
                    cartItem.Count--;
                    itemCount = cartItem.Count;
                }
                else
                {
                    storeDB.Carts.Remove(cartItem);
                }
                // Save changes
                await storeDB.SaveChangesAsync();
            }
            return itemCount;
        }

        public async Task EmptyCart()
        {
            var cartItems = storeDB.Carts.Where(
                cart => cart.CartId == ShoppingCartId);

            foreach (var cartItem in cartItems)
            {
                storeDB.Carts.Remove(cartItem);
            }
            // Save changes
           await storeDB.SaveChangesAsync();
        }

        public async Task<List<Carts>> GetCartItems()
        {
            return await storeDB.Carts.Include("Item").Where(
                cart => cart.CartId == ShoppingCartId).ToListAsync();
        }

        public async Task<List<Items>> getItems()
        {
            //Return the view
            return await storeDB.Items.Include("Category").ToListAsync();

        }

        public async Task<int> GetCount()
        {
            // Get the count of each item in the cart and sum them up
            int? count = await (from cartItems in storeDB.Carts
                          where cartItems.CartId == ShoppingCartId
                          select (int?)cartItems.Count).SumAsync();
            // Return 0 if all entries are null
            return count ?? 0;
        }

        public async Task<decimal> GetTotal()
        {
            // Multiply item price by count of that item to get 
            // the current price for each of those items in the cart
            // sum all item price totals to get the cart total
            decimal? total =await (from cartItems in storeDB.Carts
                              where cartItems.CartId == ShoppingCartId
                              select (int?)cartItems.Count *
                              cartItems.Item.Price).SumAsync();

            return total ?? decimal.Zero;
        }

        public async Task<Orders> CreateOrder(Orders order)
        {
            decimal orderTotal = 0;
            order.OrderDetails = new List<OrderDetails>();

            var cartItems = await GetCartItems();
            // Iterate over the items in the cart, 
            // adding the order details for each
            foreach (var item in cartItems)
            {
                var orderDetail = new OrderDetails
                {
                    ItemId = item.ItemId,
                    OrderId = order.OrderId,
                    UnitPrice = item.Item.Price,
                    Quantity = item.Count
                };
                // Set the order total of the shopping cart
                orderTotal += (item.Count * item.Item.Price);
                order.OrderDetails.Add(orderDetail);
                storeDB.OrderDetails.Add(orderDetail);

            }
            // Set the order's total to the orderTotal count
            order.Total = orderTotal;

            // Save the order
           await storeDB.SaveChangesAsync();
            // Empty the shopping cart
           await EmptyCart();
            // Return the OrderId as the confirmation number
            return order;
        }

        
        // When a user has logged in, migrate their shopping cart to
        // be associated with their username
        public async Task MigrateCart(string userName)
        {
            var shoppingCart = storeDB.Carts.Where(
                c => c.CartId == ShoppingCartId);

            foreach (Carts item in shoppingCart)
            {
                item.CartId = userName;
            }
            await storeDB.SaveChangesAsync();
        }
    }
}
    
