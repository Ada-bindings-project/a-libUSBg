pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
--  with Libusg.Low_Level.net_ethernet_h;
with Interfaces.C.Strings;
limited with Libusg.Low_Level.usbg_usbg_h;
with System;

package Libusg.Low_Level.usbg_function_net_h is

   --  arg-macro: procedure USBG_F_NET_ETHER_ADDR_TO_ATTR_VAL (WHAT)
   --    USBG_TO_UNION(usbg_f_net_attr_val, dev_addr, WHAT)
   --  arg-macro: procedure USBG_F_NET_INT_TO_ATTR_VAL (WHAT)
   --    USBG_TO_UNION(usbg_f_net_attr_val, qmult, WHAT)
  --  * This library is free software; you can redistribute it and/or
  --  * modify it under the terms of the GNU Lesser General Public
  --  * License as published by the Free Software Foundation; either
  --  * version 2.1 of the License, or (at your option) any later version.
  --  *
  --  * This library is distributed in the hope that it will be useful,
  --  * but WITHOUT ANY WARRANTY; without even the implied warranty of
  --  * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
  --  * Lesser General Public License for more details.
  --

   type usbg_f_net is null record;   -- incomplete struct

   type usbg_f_net_attrs is record
      dev_addr  : aliased Libusg.Low_Level.Net_Ethernet_H.Ether_Addr;  -- usbg/function/net.h:28
      host_addr : aliased Libusg.Low_Level.Net_Ethernet_H.Ether_Addr;  -- usbg/function/net.h:29
      ifname    : Interfaces.C.Strings.chars_ptr;  -- usbg/function/net.h:30
      qmult     : aliased int;  -- usbg/function/net.h:31
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/function/net.h:27

   subtype usbg_f_net_attr is unsigned;
   USBG_F_NET_ATTR_MIN  : constant usbg_f_net_attr := 0;
   USBG_F_NET_DEV_ADDR  : constant usbg_f_net_attr := 0;
   USBG_F_NET_HOST_ADDR : constant usbg_f_net_attr := 1;
   USBG_F_NET_IFNAME    : constant usbg_f_net_attr := 2;
   USBG_F_NET_QMULT     : constant usbg_f_net_attr := 3;
   USBG_F_NET_ATTR_MAX  : constant usbg_f_net_attr := 4;  -- usbg/function/net.h:34

   type usbg_f_net_attr_val (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            dev_addr : aliased Libusg.Low_Level.Net_Ethernet_H.Ether_Addr;  -- usbg/function/net.h:44
         when 1 =>
            host_addr : aliased Libusg.Low_Level.Net_Ethernet_H.Ether_Addr;  -- usbg/function/net.h:45
         when 2 =>
            ifname : Interfaces.C.Strings.chars_ptr;  -- usbg/function/net.h:46
         when others =>
            qmult : aliased int;  -- usbg/function/net.h:47
      end case;
   end record
   with Convention    => C_Pass_By_Copy,
      Unchecked_Union => True;  -- usbg/function/net.h:43

  --*
  --  * @brief Cast from generic function to net function
  --  * @param[in] f function to be converted to net funciton.
  --  *         Should be one of types:
  --  *         ecm, subset, ncm, eem, rndis
  --  * @return Converted net function or NULL if function hasn't suitable type
  --

   function usbg_to_net_function (f : access Libusg.Low_Level.usbg_usbg_h.usbg_function) return access usbg_f_net  -- usbg/function/net.h:63
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_to_net_function";

  --*
  --  * @brief Cast form net function to generic one
  --  * @param[in] nf function to be converted to generic one
  --  * @return Generic usbg function
  --

   function usbg_from_net_function (nf : access usbg_f_net) return access Libusg.Low_Level.usbg_usbg_h.usbg_function  -- usbg/function/net.h:70
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_from_net_function";

  --*
  --  * @brief Get attributes of given net function
  --  * @param[in] nf Pointer to net function
  --  * @param[out] attrs Structure to be filled with data
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_net_get_attrs (nf : access usbg_f_net; attrs : access usbg_f_net_attrs) return int  -- usbg/function/net.h:78
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_get_attrs";

  --*
  --  * @brief Set attributes of given net function
  --  * @param[in] nf Pointer to net function
  --  * @param[in] attrs to be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_net_set_attrs (nf : access usbg_f_net; attrs : access constant usbg_f_net_attrs) return int  -- usbg/function/net.h:86
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_set_attrs";

  --*
  --  * @brief Cleanup attributes structure after usage
  --  * @param[in] attrs to be cleaned up
  --

   procedure usbg_f_net_cleanup_attrs (attrs : access usbg_f_net_attrs)  -- usbg/function/net.h:93
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_f_net_cleanup_attrs";

  --*
  --  * @brief Get the value of single attribute
  --  * @param[in] nf Pointer to net function
  --  * @param[in] attr Code of attribute which value should be taken
  --  * @param[out] val Current value of this attribute
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_net_get_attr_val
     (nf   : access usbg_f_net;
      attr : usbg_f_net_attr;
      val  : access usbg_f_net_attr_val) return int  -- usbg/function/net.h:108
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_get_attr_val";

  --*
  --  * @brief Set the value of single attribute
  --  * @param[in] nf Pointer to net function
  --  * @param[in] attr Code of attribute which value should be set
  --  * @param[in] val Value of attribute which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_net_set_attr_val
     (nf   : access usbg_f_net;
      attr : usbg_f_net_attr;
      val  : usbg_f_net_attr_val) return int  -- usbg/function/net.h:118
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_set_attr_val";

  --*
  --  * @brief Get the value of device side MAC address
  --  * @param[in] nf Pointer to net function
  --  * @param[out] val Current value of this attribute
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_net_get_dev_addr (nf : access usbg_f_net; addr : access Libusg.Low_Level.Net_Ethernet_H.Ether_Addr) return int  -- usbg/function/net.h:127
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_get_dev_addr";

  --*
  --  * @brief Set the value of device side MAC address
  --  * @param[in] nf Pointer to net function
  --  * @param[out] val Value of attribute which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_net_set_dev_addr (nf : access usbg_f_net; addr : access constant Libusg.Low_Level.Net_Ethernet_H.Ether_Addr) return int  -- usbg/function/net.h:140
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_set_dev_addr";

  --*
  --  * @brief Get the value of host side MAC address
  --  * @param[in] nf Pointer to net function
  --  * @param[out] val Current value of this attribute
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_net_get_host_addr (nf : access usbg_f_net; addr : access Libusg.Low_Level.Net_Ethernet_H.Ether_Addr) return int  -- usbg/function/net.h:153
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_get_host_addr";

  --*
  --  * @brief Set the value of device side MAC address
  --  * @param[in] nf Pointer to net function
  --  * @param[in] val Value of attribute which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_net_set_host_addr (nf : access usbg_f_net; addr : access constant Libusg.Low_Level.Net_Ethernet_H.Ether_Addr) return int  -- usbg/function/net.h:166
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_set_host_addr";

  --*
  --  * @brief Get the value of interface name associated with this function
  --  *         into newly allocated storage
  --  * @param[in] nf Pointer to net function
  --  * @param[out] ifname Newly allocated string containing name of interface
  --  * @return 0 on success usbg_error if error occurred.
  --  * @note returned ifname should be free() by caller
  --

   function usbg_f_net_get_ifname (nf : access usbg_f_net; ifname : System.Address) return int  -- usbg/function/net.h:181
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_get_ifname";

  --*
  --  * @brief Get the value of interface name associated with this function
  --  *         into user buffer
  --  * @param[in] nf Pointer to net function
  --  * @param[out] buf Place where ifname should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family). This may
  --  *         also return negative error code from usbg_error.
  --

   function usbg_f_net_get_ifname_s
     (nf  : access usbg_f_net;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- usbg/function/net.h:198
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_get_ifname_s";

  --*
  --  * @brief Get the value of request queue length multiplier
  --  * @param[in] nf Pointer to net function
  --  * @param[out] qmult Current multiplier of queue len
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_net_get_qmult (nf : access usbg_f_net; qmult : access int) return int  -- usbg/function/net.h:206
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_get_qmult";

  --*
  --  * @brief Set the value of request queue length multiplier
  --  * @param[in] nf Pointer to net function
  --  * @param[in] qmult Multiplier of queue len which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_net_set_qmult (nf : access usbg_f_net; qmult : int) return int  -- usbg/function/net.h:218
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_net_set_qmult";

end Libusg.Low_Level.usbg_function_net_h;
