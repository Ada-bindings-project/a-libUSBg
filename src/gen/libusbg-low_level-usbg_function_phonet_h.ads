pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
limited with libUSBg.Low_Level.usbg_usbg_h;
with System;
with Interfaces.C.Strings;

package libUSBg.Low_Level.usbg_function_phonet_h is

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

   type usbg_f_phonet is null record;   -- incomplete struct

  --*
  --  * @brief Convert from generic function to phonet function
  --  * @param[in] f function to be converted to phonet funciton.
  --  *         Function should be of type phonet.
  --  * @return Converted phonet function or NULL if function hasn't suitable type
  --

   function usbg_to_phonet_function (f : access libUSBg.Low_Level.usbg_usbg_h.usbg_function) return access usbg_f_phonet  -- usbg/function/phonet.h:31
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_to_phonet_function";

  --*
  --  * @brief Convert form phonet function to generic one
  --  * @param[in] pf function to be converted to generic one
  --  * @return Generic usbg function
  --

   function usbg_from_phonet_function (pf : access usbg_f_phonet) return access libUSBg.Low_Level.usbg_usbg_h.usbg_function  -- usbg/function/phonet.h:38
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_from_phonet_function";

  --*
  --  * @brief Get the value of interface name associated with this function
  --  *         into newly allocated storage
  --  * @param[in] pf Pointer to net function
  --  * @param[out] ifname Newly allocated string containing name of interface
  --  * @return 0 on success usbg_error if error occurred.
  --  * @note returned ifname should be free() by caller
  --

   function usbg_f_phonet_get_ifname (pf : access usbg_f_phonet; ifname : System.Address) return int  -- usbg/function/phonet.h:48
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_phonet_get_ifname";

  --*
  --  * @brief Get the value of interface name associated with this function
  --  *         into user buffer
  --  * @param[in] pf Pointer to phonet function
  --  * @param[out] buf Place where ifname should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family). This may
  --  *         also return negative error code from usbg_error.
  --

   function usbg_f_phonet_get_ifname_s
     (pf  : access usbg_f_phonet;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- usbg/function/phonet.h:61
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_phonet_get_ifname_s";

end libUSBg.Low_Level.usbg_function_phonet_h;
