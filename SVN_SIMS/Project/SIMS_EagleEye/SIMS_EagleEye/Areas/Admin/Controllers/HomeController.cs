using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace SIMS_EagleEye.Areas.Admin.Controllers
{
    public class HomeController : Controller
    {
        // GET: Admin/Home
        public ActionResult Index()
        {
            return View();
        }

        [ChildActionOnly]
        [OutputCache(Duration = 3600, VaryByParam = "None")]
        public ActionResult TopNavResult()
        {
            return PartialView();
        }

        [ChildActionOnly]
        [OutputCache(Duration = 3600, VaryByParam = "None")]
        public ActionResult SideNavResult()
        {
            return PartialView();
        }
    }
}