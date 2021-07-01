pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
limited with Libusg.Low_Level.usbg_usbg_h;

package Libusg.Low_Level.usbg_function_loopback_h is

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

   type usbg_f_loopback is null record;   -- incomplete struct

   type usbg_f_loopback_attrs is record
      buflen : aliased unsigned;  -- usbg/function/loopback.h:26
      qlen   : aliased unsigned;  -- usbg/function/loopback.h:27
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/function/loopback.h:25

   subtype usbg_f_loopback_attr is unsigned;
   USBG_F_LOOPBACK_ATTR_MIN : constant usbg_f_loopback_attr := 0;
   USBG_F_LOOPBACK_BUFLEN   : constant usbg_f_loopback_attr := 0;
   USBG_F_LOOPBACK_QLEN     : constant usbg_f_loopback_attr := 1;
   USBG_F_LOOPBACK_ATTR_MAX : constant usbg_f_loopback_attr := 2;  -- usbg/function/loopback.h:30

  --*
  --  * @brief Cast from generic function to loopback function
  --  * @param[in] f function to be converted to loopback funciton.
  --  *         Function should be of type loopback.
  --  * @return Converted loopback function or NULL if function hasn't suitable type
  --

   function usbg_to_loopback_function (f : access Libusg.Low_Level.usbg_usbg_h.usbg_function) return access usbg_f_loopback  -- usbg/function/loopback.h:43
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_to_loopback_function";

  --*
  --  * @brief Cast form loopback function to generic one
  --  * @param[in] lf function to be converted to generic one
  --  * @return Generic usbg function
  --

   function usbg_from_loopback_function (lf : access usbg_f_loopback) return access Libusg.Low_Level.usbg_usbg_h.usbg_function  -- usbg/function/loopback.h:50
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_from_loopback_function";

  --*
  --  * @brief Get attributes of given loopback function
  --  * @param[in] lf Pointer to loopback function
  --  * @param[out] attrs Structure to be filled with data
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_loopback_get_attrs (lf : access usbg_f_loopback; attrs : access usbg_f_loopback_attrs) return int  -- usbg/function/loopback.h:58
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_loopback_get_attrs";

  --*
  --  * @brief Set attributes of given loopback function
  --  * @param[in] lf Pointer to loopback function
  --  * @param[in] attrs to be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_loopback_set_attrs (lf : access usbg_f_loopback; attrs : access constant usbg_f_loopback_attrs) return int  -- usbg/function/loopback.h:67
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_loopback_set_attrs";

  --*
  --  * @brief Get the value of single attribute
  --  * @param[in] lf Pointer to loopback function
  --  * @param[in] attr Code of attribute which value should be taken
  --  * @param[out] val Current value of this attribute
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_loopback_get_attr_val
     (lf   : access usbg_f_loopback;
      attr : usbg_f_loopback_attr;
      val  : access int) return int  -- usbg/function/loopback.h:77
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_loopback_get_attr_val";

  --*
  --  * @brief Set the value of single attribute
  --  * @param[in] lf Pointer to loopback function
  --  * @param[in] attr Code of attribute which value should be set
  --  * @param[in] val Value of attribute which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_loopback_set_attr_val
     (lf   : access usbg_f_loopback;
      attr : usbg_f_loopback_attr;
      val  : int) return int  -- usbg/function/loopback.h:87
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_loopback_set_attr_val";

  --*
  --  * @brief Get the size of request buffer
  --  * @details This is the maximum number of bytes which can be received
  --  *        using single usb_request.
  --  * @param[in] lf Pointer to loopback function
  --  * @param[out] buflen size of request buffer
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_loopback_get_buflen (lf : access usbg_f_loopback; buflen : access int) return int  -- usbg/function/loopback.h:98
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_loopback_get_buflen";

  --*
  --  * @brief Set the size of request buffer
  --  * @details This is the maximum number of bytes which can be received
  --  *        using single usb_request.
  --  * @param[in] lf Pointer to loopback function
  --  * @param[in] buflen size of request buffer
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_loopback_set_buflen (lf : access usbg_f_loopback; buflen : int) return int  -- usbg/function/loopback.h:111
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_loopback_set_buflen";

  --*
  --  * @brief Get the value of request queue length
  --  * @details This length is the number of OUT requests which can be received
  --  *         by function without requesting any IN transfers by host
  --  * @param[in] lf Pointer to loopback function
  --  * @param[out] qlen Current queue length
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_loopback_get_qlen (lf : access usbg_f_loopback; qlen : access int) return int  -- usbg/function/loopback.h:124
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_loopback_get_qlen";

  --*
  --  * @brief Set the value of request queue length
  --  * @details This length is the number of OUT requests which can be received
  --  *         by function without requesting any IN transfers by host
  --  * @param[in] lf Pointer to loopback function
  --  * @param[in] qlen Current queue length
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_loopback_set_qlen (lf : access usbg_f_loopback; qlen : int) return int  -- usbg/function/loopback.h:137
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_loopback_set_qlen";

end Libusg.Low_Level.usbg_function_loopback_h;
