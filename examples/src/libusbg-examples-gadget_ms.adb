with libUSBg.Low_Level.Usbg_Usbg_H;
with libUSBg.Low_Level.usbg_function_ms_h;
with Interfaces.C.Strings;
with Ada.Command_Line;
procedure libUSBg.Tests.Ms is
   use libUSBg.Low_Level.Usbg_Usbg_H;
   use libUSBg.Low_Level.Usbg_Function_Ms_H;
   use Interfaces.C.Strings;
   use Interfaces.C;
   VENDOR  : constant := 16#1d6b#;
   PRODUCT : constant := 16#0104#;

   G_Attrs : aliased constant Usbg_Gadget_Attrs := Usbg_Gadget_Attrs'
     (BcdUSB          => 16#0200#,
      BDeviceClass    => USB_CLASS_PER_INTERFACE,
      BDeviceSubClass => 16#00#,
      BDeviceProtocol => 16#00#,
      BMaxPacketSize0 => 64, --  Max allowed ep0 packet size
      IdVendor        => VENDOR,
      IdProduct       => PRODUCT,
      BcdDevice       => 16#0001#); --  Verson of device

   G_Strs  : aliased constant Usbg_Gadget_Strs :=
               Usbg_Gadget_Strs'(Manufacturer => New_String ("012345678"),
                                 Product      => New_String ("Foo Inc"),
                                 Serial       => New_String ("Bar Gadegt"));

   F_Ms_Luns_Array : aliased constant array (1 .. 2)  of aliased Usbg_F_Ms_Lun_Attrs :=
                       (1 => Usbg_F_Ms_Lun_Attrs'(Id => -1,
                                                  Cdrom     => True,
                                                  Ro        => False,
                                                  Nofua     => False,
                                                  Removable => True,
                                                  File      => New_String ("")),

                        2 => Usbg_F_Ms_Lun_Attrs'(Id        => -1,
                                                  Cdrom     => True,
                                                  Ro        => False,
                                                  Nofua     => False,
                                                  Removable => True,
                                                  File      => New_String (Ada.Command_Line.Argument (1))));

   F_Ms_Luns       : aliased constant array (1 .. 3)  of access constant Usbg_F_Ms_Lun_Attrs :=
                       (1 =>  F_Ms_Luns_Array (1)'Access,
                        2 =>  F_Ms_Luns_Array (2)'Access,
                        3 => null);

   F_Attrs         : aliased constant Usbg_F_Ms_Attrs :=
                       Usbg_F_Ms_Attrs'(stall => False,
                                        nluns => 2,
                                        Luns  => F_Ms_Luns'Address);
   C_Strs          : aliased constant Usbg_Config_Strs :=
                       Usbg_Config_Strs'(Configuration => New_String ("1xMass Storage"));

begin
   null;
end libUSBg.Tests.Ms;


