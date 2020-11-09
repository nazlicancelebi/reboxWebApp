using Newtonsoft.Json;
using Subgurim.Controles;
using Subgurim.Controles.GoogleChartIconMaker;
using System;
using System.Collections.Generic;
using System.Device.Location;
using System.Drawing;
using System.Drawing.Printing;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplicatio
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        public static string getBinsJson()
        {
            List<RecycleBox> bins = new List<RecycleBox>();
            using (recycleboxEntities dc = new recycleboxEntities())
            {
                bins = dc.RecycleBox.ToList();
            }
            return JsonConvert.SerializeObject(bins);

        }

    }
}