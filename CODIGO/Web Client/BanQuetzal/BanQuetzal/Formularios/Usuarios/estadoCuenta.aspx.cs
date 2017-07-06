using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using iTextSharp.text.html;
using iTextSharp.text.html.simpleparser;
using System.Text;
using System.IO;
using System.Web.UI;
using System.Web.UI.HtmlControls;

namespace BanQuetzal.Formularios.Usuarios
{
    
    public partial class estadoCuenta : System.Web.UI.Page
    {
        ws.wsBQ ww = new ws.wsBQ();
        ws.estadoCuenta[] ec;

        DataTable dt = new DataTable();
        DataColumn dc;
        DataRow dr;
        

        public estadoCuenta()
        {
            dc = new DataColumn();
            dc.ColumnName = "DEBE";
            dt.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "HABER";
            dt.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "SALDO";
            dt.Columns.Add(dc);

            dc = new DataColumn();
            dc.ColumnName = "FECHA";
            dt.Columns.Add(dc);

            

        }
        protected void Page_Load(object sender, EventArgs e)
        {
            /*if (HttpContext.Current.Session["usuario"] != null) {

            }
            else {
                Response.Redirect("/Formularios/Inicio/Index.aspx");
            }*/
        }

        protected void Mostrar_Click(object sender, EventArgs e)
        {
            try
            {
                ec = ww.getEstadoCuenta(txtDesde.Text, txtHasta.Text, long.Parse(txtCuenta.Text));
                for (int i = 0; i < ec.Length; i++)
                {
                    dr = dt.NewRow();
                    dr["DEBE"] = ec[i].debe;
                    dr["HABER"] = ec[i].haber;
                    dr["SALDO"] = ec[i].saldo;
                    dr["FECHA"] = ec[i].fecha;
                    dt.Rows.Add(dr);
                }
                tabla1.DataSource = dt;
                tabla1.DataBind();
            }
            catch (Exception ex)
            {
                lmsg.Text = "Error: " + ex.ToString();
            }
            
        }

        protected void Guardar_Click(object sender, EventArgs e)
        {
            try
            {
                ec = ww.getEstadoCuenta(txtDesde.Text, txtHasta.Text, long.Parse(txtCuenta.Text));
                for (int i = 0; i < ec.Length; i++)
                {
                    dr = dt.NewRow();
                    dr["DEBE"] = ec[i].debe;
                    dr["HABER"] = ec[i].haber;
                    dr["SALDO"] = ec[i].saldo;
                    dr["FECHA"] = ec[i].fecha;
                    dt.Rows.Add(dr);
                }



                Response.ContentType = "text/plain";
                Response.AddHeader("Content-Disposition", "attachment;filename=Estado Cta " + txtCuenta.Text + ".pdf");
                Response.Cache.SetCacheability(HttpCacheability.NoCache);

                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);

                tabla1.DataSource = dt;
                tabla1.DataBind();
                tabla1.RenderControl(hw);
                StringReader sr = new StringReader(sw.ToString());

                Document pdfDoc = new Document(PageSize.LETTER, 100f, 100f, 100f, 100f);
                HTMLWorker parse = new HTMLWorker(pdfDoc);
                PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

                pdfDoc.Open();
                parse.Parse(sr);
                pdfDoc.Close();

                Response.Write(pdfDoc);
                Response.End();
            }
            catch (Exception ex)
            {
                lmsg.Text = "Error: " + ex.ToString();
            }
        }

        public override void VerifyRenderingInServerForm(Control control)
        {
            
        }
    }
}