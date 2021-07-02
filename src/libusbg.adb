pragma Ada_2012;
package body libUSBg is

   -----------------------
   -- Retcode2exception --
   -----------------------

   procedure Retcode2exception (Code : Interfaces.C.Int) is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Retcode2exception unimplemented");
      raise Program_Error with "Unimplemented procedure Retcode2exception";
   end Retcode2exception;

end libUSBg;
