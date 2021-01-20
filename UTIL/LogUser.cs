using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace UTIL
{
    public class LogUser
    {
        public static void agregarLog(string texto)
        {
            string path;
            path = ConfigurationManager.AppSettings["RutaLog"];
            string varLogFile = path + "log_" + DateTime.Now.ToString("yyyyMMdd") + ".txt";
            try
            {
                StreamWriter varfichTMP = new StreamWriter(varLogFile,true);
                varfichTMP.WriteLine(DateTime.Now.ToString("yyyy-MM-dd hh:mm:ss.fff") + "-" + texto);
                varfichTMP.Close();
                varfichTMP = null;
            }catch(Exception e)
            {
                string varLog = e.Message.ToString();
            }
        }
    }
}
