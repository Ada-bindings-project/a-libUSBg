s-with libUSBg.Low_Level.bits_stdint_uintn_h;--
s-limited with libUSBg.Low_Level.bits_types_FILE_h;-with Interfaces.C_Streams;-
s-libUSBg.Low_Level.bits_stdint_uintn_h.uint16_t-Interfaces.unsigned_16-
s-libUSBg.Low_Level.bits_stdint_uintn_h.uint8_t-Interfaces.unsigned_8-
s-access libUSBg.Low_Level.bits_types_FILE_h.FILE-Interfaces.C_Streams.FILEs-

s!type usbg_state is null record;   -- incomplete struct!type usbg_state is null record;   -- incomplete struct\
   type usbg_state_access is access all usbg_state with Storage_Size => 0;!

s!type usbg_gadget is null record;   -- incomplete struct!type usbg_gadget is null record;   -- incomplete struct\
   type usbg_gadget_access is access all usbg_gadget with Storage_Size => 0;!
s!g : System.Address!g: not null access usbg_gadget_access!

s!type usbg_config is null record;   -- incomplete struct!type usbg_config is null record;   -- incomplete struct\
   type usbg_config_access is access all usbg_config with Storage_Size => 0;!
s!c : System.Address!c : not null access usbg_usbg_h.usbg_config_access!

s!type usbg_function is null record;   -- incomplete struct!type usbg_function is null record;   -- incomplete struct\
   type usbg_function_access is access all usbg_function with Storage_Size => 0;!
s!f : System.Address!f : not null access usbg_function_access!

s!type usbg_binding is null record;   -- incomplete struct!type usbg_binding is null record;   -- incomplete struct\
   type usbg_binding_access is access all usbg_binding with Storage_Size => 0;!

s!type usbg_udc is null record;   -- incomplete struct!type usbg_udc is null record;   -- incomplete struct\
   type usbg_udc_access is access all usbg_udc with Storage_Size => 0;!

s!type usbg_gadget_attrs is record!type usbg_gadget_attrs;\
    type usbg_gadget_attrs_access is access all usbg_gadget_attrs with Storage_Size => 0;\
    type usbg_gadget_attrs is record!

s!f_attrs : System.Address!f_attrs : not null access usbg_gadget_attrs_access!

s!state : System.Address!state : not null access usbg_state_access!
s!/usr/include/!!

s!with libUSBg.Low_Level.sys_types_h;!--  with libUSBg.Low_Level.sys_types_h;!
s!USBG_F_HID_REPORT_DESC!USBG_F_HID_REPORT_DESC_C!
s!with libUSBg.Low_Level.net_ethernet_h;!--  with libUSBg.Low_Level.net_ethernet_h;!
