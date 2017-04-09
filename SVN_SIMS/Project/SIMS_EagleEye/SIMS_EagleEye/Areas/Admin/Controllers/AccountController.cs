using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Model.DAO;

namespace SIMS_EagleEye.Areas.Admin.Controllers
{
    public class AccountController : Controller
    {
        // GET: Admin/Account
        public ActionResult Index()
        {
            AccountDao dao = new AccountDao();
            var model = dao.ListAll();
            return View(model);
        }

    }
}