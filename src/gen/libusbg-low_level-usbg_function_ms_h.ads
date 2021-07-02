pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Extensions;
with Interfaces.C.Strings;
with System;
limited with libUSBg.Low_Level.usbg_usbg_h;

package libUSBg.Low_Level.usbg_function_ms_h is

   --  arg-macro: procedure USBG_F_MS_LUN_BOOL_TO_ATTR_VAL (WHAT)
   --    USBG_TO_UNION(usbg_f_ms_lun_attr_val, cdrom, WHAT)
   --  arg-macro: procedure USBG_F_MS_LUN_CCHAR_PTR_TO_ATTR_VAL (WHAT)
   --    USBG_TO_UNION(usbg_f_ms_lun_attr_val, file, WHAT)
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

   type usbg_f_ms is null record;   -- incomplete struct

   type usbg_f_ms_lun_attrs is record
      id        : aliased int;  -- usbg/function/ms.h:27
      cdrom     : aliased Extensions.bool;  -- usbg/function/ms.h:28
      ro        : aliased Extensions.bool;  -- usbg/function/ms.h:29
      nofua     : aliased Extensions.bool;  -- usbg/function/ms.h:30
      removable : aliased Extensions.bool;  -- usbg/function/ms.h:31
      file      : Interfaces.C.Strings.chars_ptr;  -- usbg/function/ms.h:32
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/function/ms.h:26

   type usbg_f_ms_attrs is record
      stall : aliased Extensions.bool;  -- usbg/function/ms.h:36
      nluns : aliased int;  -- usbg/function/ms.h:37
      luns  : System.Address;  -- usbg/function/ms.h:38
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/function/ms.h:35

   subtype usbg_f_ms_lun_attr is unsigned;
   USBG_F_MS_LUN_ATTR_MIN  : constant usbg_f_ms_lun_attr := 0;
   USBG_F_MS_LUN_CDROM     : constant usbg_f_ms_lun_attr := 0;
   USBG_F_MS_LUN_RO        : constant usbg_f_ms_lun_attr := 1;
   USBG_F_MS_LUN_NOFUA     : constant usbg_f_ms_lun_attr := 2;
   USBG_F_MS_LUN_REMOVABLE : constant usbg_f_ms_lun_attr := 3;
   USBG_F_MS_LUN_FILE      : constant usbg_f_ms_lun_attr := 4;
   USBG_F_MS_LUN_ATTR_MAX  : constant usbg_f_ms_lun_attr := 5;  -- usbg/function/ms.h:41

   type usbg_f_ms_lun_attr_val (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            cdrom : aliased Extensions.bool;  -- usbg/function/ms.h:52
         when 1 =>
            ro : aliased Extensions.bool;  -- usbg/function/ms.h:53
         when 2 =>
            nofua : aliased Extensions.bool;  -- usbg/function/ms.h:54
         when 3 =>
            removable : aliased Extensions.bool;  -- usbg/function/ms.h:55
         when others =>
            file : Interfaces.C.Strings.chars_ptr;  -- usbg/function/ms.h:56
      end case;
   end record
   with Convention    => C_Pass_By_Copy,
      Unchecked_Union => True;  -- usbg/function/ms.h:51

  --*
  --  * @brief Cast from generic function to mass storage function
  --  * @param[in] f function to be converted to ms funciton.
  --  *         Should be one of types:
  --  *         ecm, subset, ncm, eem, rndis
  --  * @return Converted ms function or NULL if function hasn't suitable type
  --

   function usbg_to_ms_function (f : access libUSBg.Low_Level.usbg_usbg_h.usbg_function) return access usbg_f_ms  -- usbg/function/ms.h:74
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_to_ms_function";

  --*
  --  * @brief Cast form ms function to generic one
  --  * @param[in] mf function to be converted to generic one
  --  * @return Generic usbg function
  --

   function usbg_from_ms_function (mf : access usbg_f_ms) return access libUSBg.Low_Level.usbg_usbg_h.usbg_function  -- usbg/function/ms.h:81
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_from_ms_function";

  --*
  --  * @brief Create new LUN in choosen funcion
  --  * @note LUN ids should be contiguous (so id for new LUN should be
  --  *         current value nluns)
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun to be created
  --  * @param[in] lattrs LUN attributes to be set (may be NULL to use defaults)
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_create_lun
     (mf     : access usbg_f_ms;
      lun_id : int;
      lattrs : access usbg_f_ms_lun_attrs) return int  -- usbg/function/ms.h:92
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_create_lun";

  --*
  --  * @brief Remove LUN from choosen funcion
  --  * @note LUN ids should be contiguous (so you should remove LUN with id equal
  --  *        to nluns - 1)
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun to be created
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_rm_lun (mf : access usbg_f_ms; lun_id : int) return int  -- usbg/function/ms.h:103
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_rm_lun";

  --*
  --  * @brief Get attributes of choosen LUN
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[out] lattrs Structure to be filled with data
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_get_lun_attrs
     (mf     : access usbg_f_ms;
      lun_id : int;
      lattrs : access usbg_f_ms_lun_attrs) return int  -- usbg/function/ms.h:112
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_lun_attrs";

  --*
  --  * @brief Set attributes of choosen LUN
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[in] lattrs Lun attributes to be set
  --  * @return 0 on success usbg_error if error occurred.
  --  * @note The id value in lattrs is ignored by this function
  --

   function usbg_f_ms_set_lun_attrs
     (mf     : access usbg_f_ms;
      lun_id : int;
      lattrs : access constant usbg_f_ms_lun_attrs) return int  -- usbg/function/ms.h:123
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_set_lun_attrs";

  --*
  --  * @brief Cleanup LUN attributes structure after usage
  --  * @param[in] attrs to be cleaned up
  --

   procedure usbg_f_ms_cleanup_lun_attrs (lattrs : access usbg_f_ms_lun_attrs)  -- usbg/function/ms.h:130
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_f_ms_cleanup_lun_attrs";

  --*
  --  * @brief Get the value of single LUN attribute
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[in] lattr Code of attribute which value should be taken
  --  * @param[out] val Current value of this attribute
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_get_lun_attr_val
     (mf     : access usbg_f_ms;
      lun_id : int;
      lattr  : usbg_f_ms_lun_attr;
      val    : access usbg_f_ms_lun_attr_val) return int  -- usbg/function/ms.h:146
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_lun_attr_val";

  --*
  --  * @brief Set the value of single LUN attribute
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[in] lattr Code of attribute which value should be set
  --  * @param[in] val Value of attribute which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_set_lun_attr_val
     (mf     : access usbg_f_ms;
      lun_id : int;
      lattr  : usbg_f_ms_lun_attr;
      val    : usbg_f_ms_lun_attr_val) return int  -- usbg/function/ms.h:158
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_set_lun_attr_val";

  --*
  --  * @brief Get the value which determines if lun is visible as a cdrom
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[out] cdrom Current value of stall attribute
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_get_lun_cdrom
     (mf     : access usbg_f_ms;
      lun_id : int;
      cdrom  : access Extensions.bool) return int  -- usbg/function/ms.h:169
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_lun_cdrom";

  --*
  --  * @brief Set the value which determines if lun is visible as a cdrom
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[in] cdrom Value of stall attribute which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_set_lun_cdrom
     (mf     : access usbg_f_ms;
      lun_id : int;
      cdrom  : Extensions.bool) return int  -- usbg/function/ms.h:183
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_set_lun_cdrom";

  --*
  --  * @brief Get the value which determines if lun is read only
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[out] ro Indicates if LUN is read only
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_get_lun_ro
     (mf     : access usbg_f_ms;
      lun_id : int;
      ro     : access Extensions.bool) return int  -- usbg/function/ms.h:197
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_lun_ro";

  --*
  --  * @brief Set the value which determines if lun read only
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[in] ro True if LUN should be read only
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_set_lun_ro
     (mf     : access usbg_f_ms;
      lun_id : int;
      ro     : Extensions.bool) return int  -- usbg/function/ms.h:210
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_set_lun_ro";

  --*
  --  * @brief Get the value which determines if lun should ignore
  --  *        the FUA (Force Unit Access) flag in SCSI commands
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[out] nofua Indicates if FUA bit is ignored
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_get_lun_nofua
     (mf     : access usbg_f_ms;
      lun_id : int;
      nofua  : access Extensions.bool) return int  -- usbg/function/ms.h:224
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_lun_nofua";

  --*
  --  * @brief Set the value which determines if lun should ignore
  --  *        the FUA (Force Unit Access) flag in SCSI commands
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[in] nofua True if LUN should ignore FUA bit
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_set_lun_nofua
     (mf     : access usbg_f_ms;
      lun_id : int;
      nofua  : Extensions.bool) return int  -- usbg/function/ms.h:239
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_set_lun_nofua";

  --*
  --  * @brief Get the value which determines if lun is removable
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[out] removable Indicates if LUN is removable
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_get_lun_removable
     (mf        : access usbg_f_ms;
      lun_id    : int;
      removable : access Extensions.bool) return int  -- usbg/function/ms.h:253
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_lun_removable";

  --*
  --  * @brief Set the value which determines if lun removable
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[in] removable True if LUN should be removable
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_set_lun_removable
     (mf        : access usbg_f_ms;
      lun_id    : int;
      removable : Extensions.bool) return int  -- usbg/function/ms.h:267
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_set_lun_removable";

  --*
  --  * @brief Get the name of file which is used as backend storage by this LUN
  --  *         into newly allocated storage
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[out] file Newly allocated string name of file used as backend
  --  *         storage
  --  * @return 0 on success usbg_error if error occurred.
  --  * @note returned file should be free() by caller
  --

   function usbg_f_ms_get_lun_file
     (mf     : access usbg_f_ms;
      lun_id : int;
      file   : System.Address) return int  -- usbg/function/ms.h:284
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_lun_file";

  --*
  --  * @brief Get the name of file which is used as backend storage by this LUN
  --  *         into user buffer
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[out] buf Place where file should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family). This may
  --  *         also return negative error code from usbg_error.
  --

   function usbg_f_ms_get_lun_file_s
     (mf     : access usbg_f_ms;
      lun_id : int;
      buf    : Interfaces.C.Strings.chars_ptr;
      len    : int) return int  -- usbg/function/ms.h:303
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_lun_file_s";

  --*
  --  * @brief Set the name of file which is used as backend storage by this LUN
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] lun_id ID of lun
  --  * @param[in] file Name of file which should be used as backend storage
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_set_lun_file
     (mf     : access usbg_f_ms;
      lun_id : int;
      file   : Interfaces.C.Strings.chars_ptr) return int  -- usbg/function/ms.h:313
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_set_lun_file";

  --*
  --  * @brief Get attributes of given ms function
  --  * @param[in] mf Pointer to ms function
  --  * @param[out] attrs Structure to be filled with data
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_get_attrs (mf : access usbg_f_ms; attrs : access usbg_f_ms_attrs) return int  -- usbg/function/ms.h:326
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_attrs";

  --*
  --  * @brief Set attributes of given ms function
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] attrs to be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_set_attrs (mf : access usbg_f_ms; attrs : access constant usbg_f_ms_attrs) return int  -- usbg/function/ms.h:334
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_set_attrs";

  --*
  --  * @brief Cleanup attributes structure after usage
  --  * @param[in] attrs to be cleaned up
  --

   procedure usbg_f_ms_cleanup_attrs (attrs : access usbg_f_ms_attrs)  -- usbg/function/ms.h:340
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_f_ms_cleanup_attrs";

  --*
  --  * @brief Get the value of device side MAC address
  --  * @param[in] mf Pointer to ms function
  --  * @param[out] stall Current value of stall attribute
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_get_stall (mf : access usbg_f_ms; stall : access Extensions.bool) return int  -- usbg/function/ms.h:364
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_stall";

  --*
  --  * @brief Set the value of device side MAC address
  --  * @param[in] mf Pointer to ms function
  --  * @param[in] stall Value of stall attribute which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_set_stall (mf : access usbg_f_ms; stall : Extensions.bool) return int  -- usbg/function/ms.h:372
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_set_stall";

  --*
  --  * @brief Get the value of device side MAC address
  --  * @param[in] mf Pointer to ms function
  --  * @param[out] nluns Current number of LUNs
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_ms_get_nluns (mf : access usbg_f_ms; nluns : access int) return int  -- usbg/function/ms.h:380
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_ms_get_nluns";

end libUSBg.Low_Level.usbg_function_ms_h;
