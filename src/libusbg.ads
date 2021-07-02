private with Interfaces.C;
package libUSBg is
   libUSBg_Error : exception;
   USB_CLASS_PER_INTERFACE : constant := 00;

private
   procedure Retcode2exception (Code : Interfaces.C.Int);
end libUSBg;
