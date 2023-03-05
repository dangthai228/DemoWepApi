using Demo.Service;

namespace Demo.Factory
{
    public interface IServiceFactory
    {
        IitemService GetInstance(string name);
    }
}
