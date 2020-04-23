using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(HousingManagementSystem.Startup))]
namespace HousingManagementSystem
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
