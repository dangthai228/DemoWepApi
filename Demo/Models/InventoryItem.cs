using System;

namespace Demo.Models
{
    public class InventoryItem
    {
        public int Idinventory { get; set; }
        public int Iditem { get; set; }
        public int Status { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime? Expired { get; set; }
    }
}
