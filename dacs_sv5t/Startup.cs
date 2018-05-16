using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(DACS_SV5T.Startup))]
namespace DACS_SV5T
{
    public class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            //add this
            app.MapSignalR();
        }

    }
}