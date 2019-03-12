using System.Net;
using System.Net.Mail;
using System.Web.Mvc;
using uStore3.UI.MVC.Models;

namespace uStore3.UI.MVC.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet]
        public ActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        [HttpGet]
        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Contact(ContactViewModel contact)
        {
            if (ModelState.IsValid)
            {
                //Create the bodey of the email
                string body = string.Format("Name: {0}<br/>Email: {1}<br/>Subject: {2}<br/>Message:<br/>{3}",
                    contact.Name,
                    contact.Email,
                    contact.Subject,
                    contact.Message);

                //Create and configure the email message
                MailMessage msg = new MailMessage(
                        "no-reply@timothyreddin.com", //From address (must be an email address on hosting account)
                        "twreddin@gmail.com", //To address (where you want the email sent)     
                        contact.Subject,
                        body
                    );

                //Configure the MailMessage object
                msg.IsBodyHtml = true;//This treats the text as html. Need this one. The rest are optional.
                //msg.Priority = MailPriority.High; Sets message priority in the recipient's email
                //msg.CC.Add("jbeckett@centriq.com");

                //Create and configure the SMTP client
                SmtpClient client = new SmtpClient("mail.timothyreddin.com");
                client.Credentials = new NetworkCredential("no-reply@timothyreddin.com", "m9B3@123");
                using (client)
                {
                    try
                    {
                        client.Send(msg);
                    }
                    catch
                    {
                        ViewBag.ErrorMessage = "Sorry, your email not sent, please try again.";
                        return View(contact);
                    }
                }

                return View("ContactConfirmation", contact);

            }
            return View(contact);
        }

        public ActionResult ContactConfirmation()
        {
            return View();
        }
    }
}
