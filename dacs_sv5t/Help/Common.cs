using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace DACS_SV5T.Help
{
    public class Common
    {
        public static string EncryptMD5(string data)
        {
            MD5CryptoServiceProvider myMD5 = new MD5CryptoServiceProvider();
            byte[] b = System.Text.Encoding.UTF8.GetBytes(data);
            b = myMD5.ComputeHash(b);

            StringBuilder s = new StringBuilder();
            foreach (byte p in b)
            {
                s.Append(p.ToString("x").ToLower());
            }
            return s.ToString();
        }

        public static string MD5Hash(string text)
        {
            MD5 md5 = new MD5CryptoServiceProvider();
            md5.ComputeHash(ASCIIEncoding.ASCII.GetBytes(text));

            byte[] result = md5.Hash;

            StringBuilder strBuilder = new StringBuilder();
            for (int i = 0; i < result.Length; i++)
            {
                strBuilder.Append(result[i].ToString("x"));
            }

            return strBuilder.ToString();
        }
    }
}