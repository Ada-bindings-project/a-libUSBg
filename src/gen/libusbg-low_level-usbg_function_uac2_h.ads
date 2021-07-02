pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
limited with libUSBg.Low_Level.usbg_usbg_h;

package libUSBg.Low_Level.usbg_function_uac2_h is

   --  arg-macro: procedure USBG_F_UAC2_INT_TO_ATTR_VAL (WHAT)
   --    USBG_TO_UNION(usbg_f_uac2_attr_val, c_chmask, WHAT)
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

   type usbg_f_uac2 is null record;   -- incomplete struct

   type usbg_f_uac2_attrs is record
      c_chmask : aliased int;  -- usbg/function/uac2.h:28
      c_srate  : aliased int;  -- usbg/function/uac2.h:29
      c_ssize  : aliased int;  -- usbg/function/uac2.h:30
      p_chmask : aliased int;  -- usbg/function/uac2.h:31
      p_srate  : aliased int;  -- usbg/function/uac2.h:32
      p_ssize  : aliased int;  -- usbg/function/uac2.h:33
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/function/uac2.h:27

   subtype usbg_f_uac2_attr is unsigned;
   USBG_F_UAC2_ATTR_MIN : constant usbg_f_uac2_attr := 0;
   USBG_F_UAC2_C_CHMASK : constant usbg_f_uac2_attr := 0;
   USBG_F_UAC2_C_SRATE  : constant usbg_f_uac2_attr := 1;
   USBG_F_UAC2_C_SSIZE  : constant usbg_f_uac2_attr := 2;
   USBG_F_UAC2_P_CHMASK : constant usbg_f_uac2_attr := 3;
   USBG_F_UAC2_P_SRATE  : constant usbg_f_uac2_attr := 4;
   USBG_F_UAC2_P_SSIZE  : constant usbg_f_uac2_attr := 5;
   USBG_F_UAC2_ATTR_MAX : constant usbg_f_uac2_attr := 6;  -- usbg/function/uac2.h:36

   type usbg_f_uac2_attr_val (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            c_chmask : aliased int;  -- usbg/function/uac2.h:48
         when 1 =>
            c_srate : aliased int;  -- usbg/function/uac2.h:49
         when 2 =>
            c_ssize : aliased int;  -- usbg/function/uac2.h:50
         when 3 =>
            p_chmask : aliased int;  -- usbg/function/uac2.h:51
         when 4 =>
            p_srate : aliased int;  -- usbg/function/uac2.h:52
         when others =>
            p_ssize : aliased int;  -- usbg/function/uac2.h:53
      end case;
   end record
   with Convention    => C_Pass_By_Copy,
      Unchecked_Union => True;  -- usbg/function/uac2.h:47

  --*
  --  * @brief Cast from generic function to uac2 function
  --  * @param[in] f function to be converted to uac2 funciton.
  --  *         Function should be one of type uac2.
  --  * @return Converted uac2 function or NULL if function hasn't suitable type
  --

   function usbg_to_uac2_function (f : access libUSBg.Low_Level.usbg_usbg_h.usbg_function) return access usbg_f_uac2  -- usbg/function/uac2.h:65
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_to_uac2_function";

  --*
  --  * @brief Cast form uac2 function to generic one
  --  * @param[in] af function to be converted to generic one
  --  * @return Generic usbg function
  --

   function usbg_from_uac2_function (af : access usbg_f_uac2) return access libUSBg.Low_Level.usbg_usbg_h.usbg_function  -- usbg/function/uac2.h:72
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_from_uac2_function";

  --*
  --  * @brief Get attributes of given uac2 function
  --  * @param[in] af Pointer to uac2 function
  --  * @param[out] attrs Structure to be filled with data
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_get_attrs (af : access usbg_f_uac2; attrs : access usbg_f_uac2_attrs) return int  -- usbg/function/uac2.h:80
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_get_attrs";

  --*
  --  * @brief Set attributes of given uac2 function
  --  * @param[in] af Pointer to uac2 function
  --  * @param[in] attrs to be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_set_attrs (af : access usbg_f_uac2; attrs : access constant usbg_f_uac2_attrs) return int  -- usbg/function/uac2.h:89
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_set_attrs";

  --*
  --  * @brief Cleanup attributes structure after usage
  --  * @param[in] attrs to be cleaned up
  --

   procedure usbg_f_uac2_cleanup_attrs (attrs : access usbg_f_uac2_attrs)  -- usbg/function/uac2.h:96
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_cleanup_attrs";

  --*
  --  * @brief Get the value of single attribute
  --  * @param[in] af Pointer to uac2 function
  --  * @param[in] attr Code of attribute which value should be taken
  --  * @param[out] val Current value of this attribute
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_get_attr_val
     (af   : access usbg_f_uac2;
      attr : usbg_f_uac2_attr;
      val  : access usbg_f_uac2_attr_val) return int  -- usbg/function/uac2.h:107
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_get_attr_val";

  --*
  --  * @brief Set the value of single attribute
  --  * @param[in] af Pointer to uac2 function
  --  * @param[in] attr Code of attribute which value should be set
  --  * @param[in] val Value of attribute which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_set_attr_val
     (af   : access usbg_f_uac2;
      attr : usbg_f_uac2_attr;
      val  : usbg_f_uac2_attr_val) return int  -- usbg/function/uac2.h:117
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_set_attr_val";

  --*
  --  * @brief Get the capture channel mask of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[out] index Current capture channel mask of UAC2 adapter
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_get_c_chmask (af : access usbg_f_uac2; c_chmask : access int) return int  -- usbg/function/uac2.h:126
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_get_c_chmask";

  --*
  --  * @brief Set the capture channel mask of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[in] capture channel mask which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_set_c_chmask (af : access usbg_f_uac2; c_chmask : int) return int  -- usbg/function/uac2.h:138
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_set_c_chmask";

  --*
  --  * @brief Get the capture sample rate of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[out] index Current sample rate mask of UAC2 adapter
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_get_c_srate (af : access usbg_f_uac2; c_srate : access int) return int  -- usbg/function/uac2.h:150
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_get_c_srate";

  --*
  --  * @brief Set the capture sample rate of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[in] capture sample rate which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_set_c_srate (af : access usbg_f_uac2; c_srate : int) return int  -- usbg/function/uac2.h:162
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_set_c_srate";

  --*
  --  * @brief Get the capture sample size of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[out] index Current sample size mask of UAC2 adapter
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_get_c_ssize (af : access usbg_f_uac2; c_ssize : access int) return int  -- usbg/function/uac2.h:174
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_get_c_ssize";

  --*
  --  * @brief Set the capture sample size of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[in] capture sample size which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_set_c_ssize (af : access usbg_f_uac2; c_ssize : int) return int  -- usbg/function/uac2.h:186
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_set_c_ssize";

  --*
  --  * @brief Get the playback channel mask of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[out] index Current playback channel mask of UAC2 adapter
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_get_p_chmask (af : access usbg_f_uac2; p_chmask : access int) return int  -- usbg/function/uac2.h:198
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_get_p_chmask";

  --*
  --  * @brief Set the playback channel mask of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[in] playback channel mask which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_set_p_chmask (af : access usbg_f_uac2; p_chmask : int) return int  -- usbg/function/uac2.h:210
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_set_p_chmask";

  --*
  --  * @brief Get the playback sample rate of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[out] index Current sample rate mask of UAC2 adapter
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_get_p_srate (af : access usbg_f_uac2; p_srate : access int) return int  -- usbg/function/uac2.h:222
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_get_p_srate";

  --*
  --  * @brief Set the playback sample rate of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[in] playback sample rate which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_set_p_srate (af : access usbg_f_uac2; p_srate : int) return int  -- usbg/function/uac2.h:234
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_set_p_srate";

  --*
  --  * @brief Get the playback sample size of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[out] index Current sample size mask of UAC2 adapter
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_get_p_ssize (af : access usbg_f_uac2; p_ssize : access int) return int  -- usbg/function/uac2.h:246
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_get_p_ssize";

  --*
  --  * @brief Set the playback sample size of UAC2 adapter
  --  * @param[in] af Pointer to uac2 function
  --  * @param[in] playback sample size which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_uac2_set_p_ssize (af : access usbg_f_uac2; p_ssize : int) return int  -- usbg/function/uac2.h:258
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_uac2_set_p_ssize";

end libUSBg.Low_Level.usbg_function_uac2_h;
