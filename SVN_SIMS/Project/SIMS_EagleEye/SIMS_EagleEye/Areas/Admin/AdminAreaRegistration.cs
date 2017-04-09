using System.Web.Mvc;

namespace SIMS_EagleEye.Areas.Admin
{
    public class AdminAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "Admin";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            context.MapRoute(
                "Trang chủ",
                "trang-chu-admin",
                new { controller = "Home", action = "Index", id = UrlParameter.Optional },
                new[] { "SIMS_EagleEye.Areas.Admin.Controllers" }
            );
            context.MapRoute(
                "Error",
                "Error-Page",
                new { controller = "Error", action = "Index", id = UrlParameter.Optional },
                new[] { "SIMS_EagleEye.Areas.Admin.Controllers" }
            );
            context.MapRoute(
                "Admin_default",
                "Admin/{controller}/{action}/{id}",
                new { action = "Index", id = UrlParameter.Optional }
            );
        }
    }
}