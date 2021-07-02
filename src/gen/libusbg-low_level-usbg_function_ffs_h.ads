pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
limited with libUSBg.Low_Level.usbg_usbg_h;
with System;
with Interfaces.C.Strings;

package libUSBg.Low_Level.usbg_function_ffs_h is

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

   type usbg_f_fs is null record;   -- incomplete struct

  --*
  --  * @brief Convert from generic function to fs function
  --  * @param[in] f function to be converted to fs funciton.
  --  *         Function should be of type function fs.
  --  * @return Converted function or NULL if function hasn't suitable type
  --

   function usbg_to_fs_function (f : access libUSBg.Low_Level.usbg_usbg_h.usbg_function) return access usbg_f_fs  -- usbg/function/ffs.h:31
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_to_fs_function";

  --*
  --  * @brief Convert form fs function to a generic one
  --  * @param[in] pf function to be converted to generic one
  --  * @return Generic usbg function
  --

   function usbg_from_fs_function (ff : access usbg_f_fs) return access libUSBg.Low_Level.usbg_usbg_h.usbg_function  -- usbg/function/ffs.h:38
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_from_fs_function";

  --*
  --  * @brief Get the device name which should be used while mounting
  --  *         functionfs instace into newly allocated storage
  --  * @param[in] pf Pointer to net function
  --  * @param[out] dev_name Newly allocated string containing device name
  --  * @return 0 on success usbg_error if error occurred.
  --  * @note returned dev_name should be free() by caller
  --

   function usbg_f_fs_get_dev_name (ff : access usbg_f_fs; dev_name : System.Address) return int  -- usbg/function/ffs.h:48
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_fs_get_dev_name";

  --*
  --  * @brief Get the device name which should be used while mounting
  --  *         functionfs instace into user buffer
  --  * @param[in] pf Pointer to fs function
  --  * @param[out] buf Place where ifname should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family). This may
  --  *         also return negative error code from usbg_error.
  --

   function usbg_f_fs_get_dev_name_s
     (ff  : access usbg_f_fs;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- usbg/function/ffs.h:61
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_fs_get_dev_name_s";

end libUSBg.Low_Level.usbg_function_ffs_h;
