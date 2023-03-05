using Demo.Service;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Xml.Linq;

namespace Demo.Factory
{
    public class ServiceFactoryImpl : IServiceFactory
    {
        private readonly IEnumerable<IitemService> _itemservice;

        public ServiceFactoryImpl(IEnumerable<IitemService> itemservice)
        {
            _itemservice = itemservice;
        }

        public IitemService GetInstance(string name)
        {
            return name switch
            {
                "sv1" => this.GetService(typeof(ItemServices)),
                "sv2" => this.GetService(typeof(ItemA)),
                _ => throw new InvalidOperationException()
            }; ;
        }

        public IitemService GetService(Type type)
        {
            return this._itemservice.FirstOrDefault(x => x.GetType() == type)!;
        }
    }
}
