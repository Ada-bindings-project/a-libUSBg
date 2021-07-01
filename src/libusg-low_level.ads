--  This package is declared private to block direct export of the
--  low levelC types.
--  All generated specs will apear under this root.

limited with Libusg.Low_Level.Linker_Options;
package Libusg.Low_Level is
   package Net_Ethernet_H is
      type Ether_Addr is new Integer;
   end  Net_Ethernet_H;
   package Sys_Types_H is
      type Dev_T is new Integer;
   end  Sys_Types_H;
end Libusg.Low_Level;
