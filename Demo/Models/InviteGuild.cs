using System;

namespace Demo.Models
{
    public class InviteGuild
    {
        public int GuildId { get; set; }
        public string GuildName { get; set; }
        public string Description { get; set;}
        public int TotalPoint { get; set; }
        public DateTime TimeAdd { get; set; }

        public InviteGuild(int guildId, string guildName, string description, int totalPoint, DateTime timeAdd)
        {
            GuildId = guildId;
            GuildName = guildName;
            Description = description;
            TotalPoint = totalPoint;
            TimeAdd = timeAdd;
        }
    }
}
