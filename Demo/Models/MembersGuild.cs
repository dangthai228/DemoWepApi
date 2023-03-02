namespace Demo.Models
{
    public class MembersGuild
    {
        public MembersGuild(int accId, string name, string rollname, int point)
        {
            AccId = accId;
            Name = name;
            Rollname = rollname;
            Point = point;
        }

        public int AccId { get; set; }
        public string Name { get; set; }
        public string Rollname { get; set; }
        public int Point { get; set; }
    }
}
