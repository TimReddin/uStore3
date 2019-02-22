using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(uStore3.UI.MVC.Startup))]
namespace uStore3.UI.MVC
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
