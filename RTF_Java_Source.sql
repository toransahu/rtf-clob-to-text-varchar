CREATE OR REPLACE AND RESOLVE JAVA SOURCE NAMED INTERSPC."RTF_Java_Source" AS
//--RTF_SUPPORT
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.StringReader;
import java.sql.SQLException;

import javax.swing.text.BadLocationException;
import javax.swing.text.Document;
import javax.swing.text.rtf.RTFEditorKit;


    public class inrtf extends Object
    {
        static String str1="rtf1";
        public static String lnRTFToText(oracle.sql.CLOB p_in) throws IOException, BadLocationException, SQLException , IndexOutOfBoundsException 
        {
            try 
            {
               if (p_in.getAsciiStream() != null) 
               {
                  int len2= (int)p_in.length();
                  String y=p_in.getSubString(1,len2);
                  
                  if(y.contains(str1))
                  {
                      RTFEditorKit kit = new RTFEditorKit();
                      Document doc = kit.createDefaultDocument();
                      kit.read(p_in.getCharacterStream(), doc, 0);
                      String text = new String(doc.getText(0, doc.getLength()).getBytes("ISO-8859-1"));
                      String str= text.trim();
                      int len= str.length();
                      if(len>4000)
                        return "" + str.substring(0,3999);
                      else return "" + str;
                  }
                  else
                  {
                    if(len2>4000)
                        return "" +  y.substring(0,3999);
                    else return "" + y;
                   }
               } 
               else 
               {
                    return "";
               }
               } catch (NullPointerException ex) {
               return null;
            }
     }
}
/
