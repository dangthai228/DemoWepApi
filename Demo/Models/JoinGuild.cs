using System;

namespace Demo.Models
{
    public class JoinGuild
    {
        public int AccountId { get; set; }
        public string Name { get; set; }
        public int Point { get; set; }
        public DateTime TimeAdd { get; set; }

        public JoinGuild(int accountId, string name, int point, DateTime timeAdd)
        {
            AccountId = accountId;
            Name = name;
            Point = point;
            TimeAdd = timeAdd;
        }
    }
}
