with libUSBg.Low_Level.usbg_usbg_h;
with libUSBg.Low_Level.usbg_function_ms_h;
with Interfaces.C.Strings;
with Ada.Command_Line;
procedure libUSBg.Tests.Ms is
   use libUSBg.Low_Level.usbg_usbg_h;
   use libUSBg.Low_Level.usbg_function_ms_h;
   use Interfaces.C.Strings;
   use Interfaces.C;
   VENDOR  : constant := 16#1d6b#;
   PRODUCT : constant := 16#0104#;

   G_Attrs : aliased constant usbg_gadget_attrs := usbg_gadget_attrs'
     (BcdUSB          => 16#0200#,
      BDeviceClass    => USB_CLASS_PER_INTERFACE,
      BDeviceSubClass => 16#00#,
      BDeviceProtocol => 16#00#,
      BMaxPacketSize0 => 64, --  Max allowed ep0 packet size
      IdVendor        => VENDOR,
      IdProduct       => PRODUCT,
      BcdDevice       => 16#0001#); --  Verson of device

   G_Strs  : aliased constant usbg_gadget_strs :=
               usbg_gadget_strs'(Manufacturer => New_String ("012345678"),
                                 Product      => New_String ("Foo Inc"),
                                 Serial       => New_String ("Bar Gadegt"));

   F_Ms_Luns_Array : aliased constant array (1 .. 2)  of aliased usbg_f_ms_lun_attrs :=
                       (1 => usbg_f_ms_lun_attrs'(Id => -1,
                                                  Cdrom     => True,
                                                  Ro        => False,
                                                  Nofua     => False,
                                                  Removable => True,
                                                  File      => New_String ("")),

                        2 => usbg_f_ms_lun_attrs'(Id        => -1,
                                                  Cdrom     => True,
                                                  Ro        => False,
                                                  Nofua     => False,
                                                  Removable => True,
                                                  File      => New_String (Ada.Command_Line.Argument (1))));

   F_Ms_Luns       : aliased constant array (1 .. 3)  of access constant usbg_f_ms_lun_attrs :=
                       (1 =>  F_Ms_Luns_Array (1)'Access,
                        2 =>  F_Ms_Luns_Array (2)'Access,
                        3 => null);

   F_Attrs         : aliased constant usbg_f_ms_attrs :=
                       usbg_f_ms_attrs'(Stall => False,
                                        Nluns => 2,
                                        Luns  => F_Ms_Luns'Address);
   C_Strs          : aliased constant usbg_config_strs :=
                       usbg_config_strs'(Configuration => New_String ("1xMass Storage"));

begin
   null;
end libUSBg.Tests.Ms;


