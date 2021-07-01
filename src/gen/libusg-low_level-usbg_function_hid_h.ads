pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
--  with Libusg.Low_Level.sys_types_h;
limited with Libusg.Low_Level.usbg_usbg_h;
with System;

package Libusg.Low_Level.usbg_function_hid_h is

   --  arg-macro: procedure USBG_F_HID_UINT_TO_ATTR_VAL (WHAT)
   --    USBG_TO_UNION(usbg_f_hid_attr_val, protocol, WHAT)
   --  arg-macro: procedure USBG_F_HID_RDESC_TO_ATTR_VAL (WHAT)
   --    USBG_TO_UNION(usbg_f_hid_attr_val, report_desc, WHAT)
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

   type usbg_f_hid is null record;   -- incomplete struct

   type usbg_f_hid_report_desc is record
      desc : Interfaces.C.Strings.chars_ptr;  -- usbg/function/hid.h:30
      len  : aliased unsigned;  -- usbg/function/hid.h:31
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/function/hid.h:29

   type usbg_f_hid_attrs is record
      dev           : aliased Libusg.Low_Level.Sys_Types_H.Dev_T;  -- usbg/function/hid.h:35
      protocol      : aliased unsigned;  -- usbg/function/hid.h:36
      report_desc   : aliased usbg_f_hid_report_desc;  -- usbg/function/hid.h:37
      report_length : aliased unsigned;  -- usbg/function/hid.h:38
      subclass      : aliased unsigned;  -- usbg/function/hid.h:39
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/function/hid.h:34

   subtype usbg_f_hid_attr is unsigned;
   USBG_F_HID_ATTR_MIN      : constant usbg_f_hid_attr := 0;
   USBG_F_HID_DEV           : constant usbg_f_hid_attr := 0;
   USBG_F_HID_PROTOCOL      : constant usbg_f_hid_attr := 1;
   USBG_F_HID_REPORT_DESC_C : constant usbg_f_hid_attr := 2;
   USBG_F_HID_REPORT_LENGTH : constant usbg_f_hid_attr := 3;
   USBG_F_HID_SUBCLASS      : constant usbg_f_hid_attr := 4;
   USBG_F_HID_ATTR_MAX      : constant usbg_f_hid_attr := 5;  -- usbg/function/hid.h:42

   type usbg_f_hid_attr_val (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            dev : aliased Libusg.Low_Level.Sys_Types_H.Dev_T;  -- usbg/function/hid.h:53
         when 1 =>
            protocol : aliased unsigned;  -- usbg/function/hid.h:54
         when 2 =>
            report_desc : aliased usbg_f_hid_report_desc;  -- usbg/function/hid.h:55
         when 3 =>
            report_length : aliased unsigned;  -- usbg/function/hid.h:56
         when others =>
            subclass : aliased unsigned;  -- usbg/function/hid.h:57
      end case;
   end record
   with Convention    => C_Pass_By_Copy,
      Unchecked_Union => True;  -- usbg/function/hid.h:52

  --*
  --  * @brief Cast from generic function to hid function
  --  * @param[in] f function to be converted to hid funciton.
  --  *         Function should be one of type hid.
  --  * @return Converted hid function or NULL if function hasn't suitable type
  --

   function usbg_to_hid_function (f : access Libusg.Low_Level.usbg_usbg_h.usbg_function) return access usbg_f_hid  -- usbg/function/hid.h:71
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_to_hid_function";

  --*
  --  * @brief Cast form hid function to generic one
  --  * @param[in] hf function to be converted to generic one
  --  * @return Generic usbg function
  --

   function usbg_from_hid_function (hf : access usbg_f_hid) return access Libusg.Low_Level.usbg_usbg_h.usbg_function  -- usbg/function/hid.h:78
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_from_hid_function";

  --*
  --  * @brief Get attributes of given hid function
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] attrs Structure to be filled with data
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_get_attrs (hf : access usbg_f_hid; attrs : access usbg_f_hid_attrs) return int  -- usbg/function/hid.h:86
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_get_attrs";

  --*
  --  * @brief Set attributes of given hid function
  --  * @param[in] hf Pointer to hid function
  --  * @param[in] attrs to be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_set_attrs (hf : access usbg_f_hid; attrs : access constant usbg_f_hid_attrs) return int  -- usbg/function/hid.h:95
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_set_attrs";

  --*
  --  * @brief Cleanup HID report descriptor structure after usage
  --  * @param[in] report_desc to be cleaned up
  --

   procedure usbg_f_hid_cleanup_report_desc (report_desc : access usbg_f_hid_report_desc)  -- usbg/function/hid.h:103
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_f_hid_cleanup_report_desc";

  -- Just for safety
  --*
  --  * @brief Cleanup attributes structure after usage
  --  * @param[in] attrs to be cleaned up
  --

   procedure usbg_f_hid_cleanup_attrs (attrs : access usbg_f_hid_attrs)  -- usbg/function/hid.h:117
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_f_hid_cleanup_attrs";

  --*
  --  * @brief Get the value of single attribute
  --  * @param[in] hf Pointer to hid function
  --  * @param[in] attr Code of attribute which value should be taken
  --  * @param[out] val Current value of this attribute
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_get_attr_val
     (hf   : access usbg_f_hid;
      attr : usbg_f_hid_attr;
      val  : access usbg_f_hid_attr_val) return int  -- usbg/function/hid.h:130
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_get_attr_val";

  --*
  --  * @brief Set the value of single attribute
  --  * @param[in] hf Pointer to hid function
  --  * @param[in] attr Code of attribute which value should be set
  --  * @param[in] val Value of attribute which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_set_attr_val
     (hf   : access usbg_f_hid;
      attr : usbg_f_hid_attr;
      val  : usbg_f_hid_attr_val) return int  -- usbg/function/hid.h:140
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_set_attr_val";

  --*
  --  * @brief Get the minor and major of corresponding character device
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] dev Minor and major of corresponding
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_get_dev (hf : access usbg_f_hid; dev : access Libusg.Low_Level.Sys_Types_H.Dev_T) return int  -- usbg/function/hid.h:149
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_get_dev";

  --*
  --  * @brief Get HID protocol code
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] protocol code
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_get_protocol (hf : access usbg_f_hid; protocol : access unsigned) return int  -- usbg/function/hid.h:161
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_get_protocol";

  --*
  --  * @brief Set HID protocol code
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] protocol code
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_set_protocol (hf : access usbg_f_hid; protocol : unsigned) return int  -- usbg/function/hid.h:174
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_set_protocol";

  --*
  --  * @brief Get HID report descriptor
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] report_desc Report descriptor
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_get_report_desc (hf : access usbg_f_hid; report_desc : access usbg_f_hid_report_desc) return int  -- usbg/function/hid.h:187
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_get_report_desc";

  --*
  --  * @brief Set HID report descriptor
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] report_desc Report descriptor
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_set_report_desc (hf : access usbg_f_hid; report_desc : usbg_f_hid_report_desc) return int  -- usbg/function/hid.h:200
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_set_report_desc";

  --*
  --  * @brief Get HID report descriptor
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] report_desc Report descriptor
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_get_report_desc_raw
     (hf   : access usbg_f_hid;
      desc : System.Address;
      len  : access unsigned) return int  -- usbg/function/hid.h:213
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_get_report_desc_raw";

  --*
  --  * @brief Set HID report descriptor
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] report_desc Report descriptor
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_set_report_desc_raw
     (hf   : access usbg_f_hid;
      desc : Interfaces.C.Strings.chars_ptr;
      len  : unsigned) return int  -- usbg/function/hid.h:237
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_set_report_desc_raw";

  --*
  --  * @brief Get HID report length
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] report_length Length of HID report
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_get_report_length (hf : access usbg_f_hid; report_length : access unsigned) return int  -- usbg/function/hid.h:256
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_get_report_length";

  --*
  --  * @brief Set HID report length
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] report_length Length of HID report
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_set_report_length (hf : access usbg_f_hid; report_length : unsigned) return int  -- usbg/function/hid.h:269
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_set_report_length";

  --*
  --  * @brief Get HID subclass code
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] subclass code
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_get_subclass (hf : access usbg_f_hid; subclass : access unsigned) return int  -- usbg/function/hid.h:282
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_get_subclass";

  --*
  --  * @brief Set HID subclass code
  --  * @param[in] hf Pointer to hid function
  --  * @param[out] subclass code
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_hid_set_subclass (hf : access usbg_f_hid; subclass : unsigned) return int  -- usbg/function/hid.h:295
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_hid_set_subclass";

end Libusg.Low_Level.usbg_function_hid_h;
