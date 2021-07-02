--  This package is declared private to block direct export of the
--  low levelC types.
--  All generated specs will apear under this root.

limited with libUSBg.Low_Level.Linker_Options;
package libUSBg.Low_Level is
   package Net_EtHernet_H is
      type Ether_Addr is new Integer;
   end  Net_Ethernet_H;
   package Sys_Types_H is
      type Dev_T is new Integer;
   end  Sys_Types_H;
end libUSBg.Low_Level;
