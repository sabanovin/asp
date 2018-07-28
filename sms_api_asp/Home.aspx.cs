using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace sms_api_asp
{
    public partial class Home : System.Web.UI.Page
    {
        string api_key, gateway;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private void init_parameters()
        {
            api_key = ApiKeyTxt.Text.Trim();
            gateway = GatewayTxt.Text.Trim();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            init_parameters();
            WebClient webClient = new WebClient();
            string url = "https://api.sabanovin.com/v1/" + api_key + "/account/balance.json";
            string result = webClient.DownloadString(url);
            JObject obj = JObject.Parse(result);
            MessageTxt.Text = obj["entry"]["balance"].ToString();
            StatusCodeTxt.Text = obj["status"]["code"].ToString();
            // Fix UTF-8 Encoding
            string message = obj["status"]["message"].ToString();
            byte[] bytes = Encoding.Default.GetBytes(message);
            message = Encoding.UTF8.GetString(bytes);
            ResultTxt.Text = message;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            init_parameters();
            string url = "https://api.sabanovin.com/v1/" + api_key + "/sms/send.json?gateway=" +
                gateway + "&to=" + SingleGroupNumbersTxt.Text.Trim() + "&text=" + SingleGroupTextTxt.Text.Trim();
            WebClient webClient = new WebClient();
            string result = webClient.DownloadString(url);
            ResultTxt.Text = result;
            JObject obj = JObject.Parse(result);
            StatusCodeTxt.Text = obj["status"]["code"].ToString();
            // Fix UTF-8 Encoding
            string message = obj["status"]["message"].ToString();
            byte[] bytes = Encoding.Default.GetBytes(message);
            message = Encoding.UTF8.GetString(bytes);
            MessageTxt.Text = message;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            init_parameters();
            string url = "";
            if (FromDateTxt.Text != "")
            {
                if (ToDateTxt.Text != "")
                {
                    url = "https://api.sabanovin.com/v1/" + api_key + "/sms/receive.json?gateway=" + gateway + "&is_read=0&from_date=" +
                        FromDateTxt.Text + "&to_date=" + ToDateTxt.Text;
                }
                else
                {
                    url = "https://api.sabanovin.com/v1/" + api_key + "/sms/receive.json?gateway=" + gateway + "&is_read=0&from_date=" +
                                            FromDateTxt.Text;
                }
            }
            else
            {
                url = "https://api.sabanovin.com/v1/" + api_key + "/sms/receive.json?gateway=" + gateway + "&is_read=0";
            }
            System.Console.WriteLine(url);
            WebClient webClient = new WebClient();
            string result = webClient.DownloadString(url);
            ResultTxt.Text = result;
            JObject obj = JObject.Parse(result);
            StatusCodeTxt.Text = obj["status"]["code"].ToString();
            // Fix UTF-8 Encoding
            string message = obj["status"]["message"].ToString();
            byte[] bytes = Encoding.Default.GetBytes(message);
            message = Encoding.UTF8.GetString(bytes);
            MessageTxt.Text = message;
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            init_parameters();
            string url = "https://api.sabanovin.com/v1/" + api_key + "/utils/add_contact.json?group_id=" + GroupIdTxt.Text + "&number=" + PhonebookNumberTxt.Text;
            WebClient webClient = new WebClient();
            string result = webClient.DownloadString(url);
            ResultTxt.Text = result;
            JObject obj = JObject.Parse(result);
            StatusCodeTxt.Text = obj["status"]["code"].ToString();
            // Fix UTF-8 Encoding
            string message = obj["status"]["message"].ToString();
            byte[] bytes = Encoding.Default.GetBytes(message);
            message = Encoding.UTF8.GetString(bytes);
            MessageTxt.Text = message;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            init_parameters();
            string[] numbers;
            numbers = PairToPairNumbersTxt.Text.Split(',');
            string[] textes;
            textes = PairToPairTextTxt.Text.Split(',');
            if (textes.Count() != numbers.Count())
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "number and textes are not equal)", true);
                return;
            }
            var paramters = new { gateway = gateway, to = numbers, text = textes };
            using (var client = new WebClient())
            {
                var dataString = JsonConvert.SerializeObject(paramters);
                client.Headers.Add(HttpRequestHeader.ContentType, "application/json");
                string result = client.UploadString(new Uri("https://api.sabanovin.com/v1/" + api_key + "/sms/send_array.json"), "POST", dataString);
                ResultTxt.Text = result;
                JObject obj = JObject.Parse(result);
                StatusCodeTxt.Text = obj["status"]["code"].ToString();
                // Fix UTF-8 Encoding
                string message = obj["status"]["message"].ToString();
                byte[] bytes = Encoding.Default.GetBytes(message);
                message = Encoding.UTF8.GetString(bytes);
                MessageTxt.Text = message;
            }
        }
    }
}