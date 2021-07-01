s-with Libusg.Low_Level.bits_stdint_uintn_h;--
s-limited with Libusg.Low_Level.bits_types_FILE_h;-with Interfaces.C_Streams;-
s-Libusg.Low_Level.bits_stdint_uintn_h.uint16_t-Interfaces.unsigned_16-
s-Libusg.Low_Level.bits_stdint_uintn_h.uint8_t-Interfaces.unsigned_8-
s-access Libusg.Low_Level.bits_types_FILE_h.FILE-Interfaces.C_Streams.FILEs-
s!type usbg_state is null record;   -- incomplete struct!type usbg_state is null record;   -- incomplete struct\
   type usbg_state_access is access all usbg_state with Storage_Size => 0;!

s!state : System.Address!state : not null access usbg_state_access!
s!/usr/include/!!

s!with Libusg.Low_Level.sys_types_h;!--  with Libusg.Low_Level.sys_types_h;!
s!USBG_F_HID_REPORT_DESC!USBG_F_HID_REPORT_DESC_C!
s!with Libusg.Low_Level.net_ethernet_h;!--  with Libusg.Low_Level.net_ethernet_h;!
