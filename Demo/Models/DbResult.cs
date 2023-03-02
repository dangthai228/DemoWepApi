namespace Demo.Models
{
    public class DbResult<T>
    {
        public int Status { get; set; }
        public T Data { get; set; }
    }
}
