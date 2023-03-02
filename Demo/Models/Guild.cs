namespace Demo.Models
{
    public class Guild
    {
        public int Id { get; set; }
        public int IdenCode { get; set; }
        public string GuildName { get; set; }
        public string Description { get; set;}
        public int CurMembers { get; set; }
        public int MaxMembers { get; set;}
        public int TotalPoint { get; set; }

        public Guild(int id, int idenCode, string guildName, string description, int curMembers, int maxMembers, int totalPoint)
        {
            Id = id;
            IdenCode = idenCode;
            GuildName = guildName;
            Description = description;
            CurMembers = curMembers;
            MaxMembers = maxMembers;
            TotalPoint = totalPoint;
        }
    }
}
