using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.Services;
using WebProject;

namespace grid_db
{
    /// <summary>
    /// Summary description for WebService1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        [WebMethod(EnableSession = true)]
        public string GetUsers()
        {
            using(var db = new WebProjectEntities())
            {
                var users = db.lecturers.ToList();
                return JsonConvert.SerializeObject(users);
            }            
        }


        [WebMethod(EnableSession = true)]
        public int RemUser(int id)
        {
            using (var db = new WebProjectEntities())
            {
                var lecturer = db.lecturers.Where(i => i.lecturerID == id).FirstOrDefault();
                db.lecturers.Remove(lecturer);
                db.SaveChanges();
                return lecturer.lecturerID;
            }
        }


        [WebMethod(EnableSession = true)]
        public int SaveUser()
        {
            using(var stream = new MemoryStream())
            {
                var request = HttpContext.Current.Request;
                request.InputStream.Seek(0, SeekOrigin.Begin);
                request.InputStream.CopyTo(stream);
                var dataStr = Encoding.UTF8.GetString(stream.ToArray());
                var data = (dynamic)JsonConvert.DeserializeObject(dataStr);
                using(var db = new WebProjectEntities())
                {
                    var d = data.data;
                    int id = Convert.ToInt32(d["Id"]);
                    var lecturer = id == 0 ? new lecturer() : db.lecturers.Where(i => i.lecturerID == id).FirstOrDefault();
                    //user.Email = Convert.ToString(d["Email"]);
                    //user.Password = Convert.ToString(d["Password"]);
                    //user.Address = Convert.ToString(d["Address"]);
                    
                    if (id == 0) db.lecturers.Add(lecturer);
                    db.SaveChanges();

                    return lecturer.lecturerID;
                }
            }
            
        }


    }
}
