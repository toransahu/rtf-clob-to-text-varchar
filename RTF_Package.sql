CREATE OR REPLACE PACKAGE INTERSPC.RTF_Package
IS
   --RTF_SUPPORT
   FUNCTION rtftotext (asRTF IN CLOB)
      RETURN VARCHAR2
   IS
      LANGUAGE JAVA
      NAME 'inrtf.lnRTFToText( oracle.sql.CLOB ) return java.lang.String[]';
END RTF_Package;
/
