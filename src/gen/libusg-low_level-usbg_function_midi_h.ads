pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
with Interfaces.C.Strings;
limited with Libusg.Low_Level.usbg_usbg_h;
with System;

package Libusg.Low_Level.usbg_function_midi_h is

   --  arg-macro: procedure USBG_F_MIDI_INT_TO_ATTR_VAL (WHAT)
   --    USBG_TO_UNION(usbg_f_midi_attr_val, index, WHAT)
   --  arg-macro: procedure USBG_F_MIDI_UINT_TO_ATTR_VAL (WHAT)
   --    USBG_TO_UNION(usbg_f_midi_attr_val, qlen, WHAT)
   --  arg-macro: procedure USBG_F_MIDI_CCHAR_PTR_TO_ATTR_VAL (WHAT)
   --    USBG_TO_UNION(usbg_f_midi_attr_val, id, WHAT)
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

   type usbg_f_midi is null record;   -- incomplete struct

   type usbg_f_midi_attrs is record
      index     : aliased int;  -- usbg/function/midi.h:28
      id        : Interfaces.C.Strings.chars_ptr;  -- usbg/function/midi.h:29
      in_ports  : aliased unsigned;  -- usbg/function/midi.h:30
      out_ports : aliased unsigned;  -- usbg/function/midi.h:31
      buflen    : aliased unsigned;  -- usbg/function/midi.h:32
      qlen      : aliased unsigned;  -- usbg/function/midi.h:33
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/function/midi.h:27

   subtype usbg_f_midi_attr is unsigned;
   USBG_F_MIDI_ATTR_MIN  : constant usbg_f_midi_attr := 0;
   USBG_F_MIDI_INDEX     : constant usbg_f_midi_attr := 0;
   USBG_F_MIDI_ID        : constant usbg_f_midi_attr := 1;
   USBG_F_MIDI_IN_PORTS  : constant usbg_f_midi_attr := 2;
   USBG_F_MIDI_OUT_PORTS : constant usbg_f_midi_attr := 3;
   USBG_F_MIDI_BUFLEN    : constant usbg_f_midi_attr := 4;
   USBG_F_MIDI_QLEN      : constant usbg_f_midi_attr := 5;
   USBG_F_MIDI_ATTR_MAX  : constant usbg_f_midi_attr := 6;  -- usbg/function/midi.h:36

   type usbg_f_midi_attr_val (discr : unsigned := 0) is record
      case discr is
         when 0 =>
            index : aliased int;  -- usbg/function/midi.h:48
         when 1 =>
            id : Interfaces.C.Strings.chars_ptr;  -- usbg/function/midi.h:49
         when 2 =>
            in_ports : aliased unsigned;  -- usbg/function/midi.h:50
         when 3 =>
            out_ports : aliased unsigned;  -- usbg/function/midi.h:51
         when 4 =>
            buflen : aliased unsigned;  -- usbg/function/midi.h:52
         when others =>
            qlen : aliased unsigned;  -- usbg/function/midi.h:53
      end case;
   end record
   with Convention    => C_Pass_By_Copy,
      Unchecked_Union => True;  -- usbg/function/midi.h:47

  --*
  --  * @brief Cast from generic function to midi function
  --  * @param[in] f function to be converted to midi funciton.
  --  *         Function should be one of type midi.
  --  * @return Converted midi function or NULL if function hasn't suitable type
  --

   function usbg_to_midi_function (f : access Libusg.Low_Level.usbg_usbg_h.usbg_function) return access usbg_f_midi  -- usbg/function/midi.h:71
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_to_midi_function";

  --*
  --  * @brief Cast form midi function to generic one
  --  * @param[in] mf function to be converted to generic one
  --  * @return Generic usbg function
  --

   function usbg_from_midi_function (mf : access usbg_f_midi) return access Libusg.Low_Level.usbg_usbg_h.usbg_function  -- usbg/function/midi.h:78
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_from_midi_function";

  --*
  --  * @brief Get attributes of given midi function
  --  * @param[in] mf Pointer to midi function
  --  * @param[out] attrs Structure to be filled with data
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_get_attrs (mf : access usbg_f_midi; attrs : access usbg_f_midi_attrs) return int  -- usbg/function/midi.h:86
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_get_attrs";

  --*
  --  * @brief Set attributes of given midi function
  --  * @param[in] mf Pointer to midi function
  --  * @param[in] attrs to be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_set_attrs (mf : access usbg_f_midi; attrs : access constant usbg_f_midi_attrs) return int  -- usbg/function/midi.h:95
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_set_attrs";

  --*
  --  * @brief Cleanup attributes structure after usage
  --  * @param[in] attrs to be cleaned up
  --

   procedure usbg_f_midi_cleanup_attrs (attrs : access usbg_f_midi_attrs)  -- usbg/function/midi.h:102
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_f_midi_cleanup_attrs";

  -- Just for safety
  --*
  --  * @brief Get the value of single attribute
  --  * @param[in] mf Pointer to midi function
  --  * @param[in] attr Code of attribute which value should be taken
  --  * @param[out] val Current value of this attribute
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_get_attr_val
     (mf   : access usbg_f_midi;
      attr : usbg_f_midi_attr;
      val  : access usbg_f_midi_attr_val) return int  -- usbg/function/midi.h:118
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_get_attr_val";

  --*
  --  * @brief Set the value of single attribute
  --  * @param[in] mf Pointer to midi function
  --  * @param[in] attr Code of attribute which value should be set
  --  * @param[in] val Value of attribute which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_set_attr_val
     (mf   : access usbg_f_midi;
      attr : usbg_f_midi_attr;
      val  : usbg_f_midi_attr_val) return int  -- usbg/function/midi.h:128
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_set_attr_val";

  --*
  --  * @brief Get the index value of MIDI adapter
  --  * @param[in] mf Pointer to midi function
  --  * @param[out] index Current index value of MIDI adapter
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_get_index (mf : access usbg_f_midi; index : access int) return int  -- usbg/function/midi.h:137
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_get_index";

  --*
  --  * @brief Set the index value of MIDI adapter
  --  * @param[in] mf Pointer to midi function
  --  * @param[in] index value which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_set_index (mf : access usbg_f_midi; index : int) return int  -- usbg/function/midi.h:149
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_set_index";

  --*
  --  * @brief Get the value of ID string for associated MIDI adapter
  --  *        into newly allocated storage
  --  * @param[in] mf Pointer to midi function
  --  * @param[out] id Newly allocated string containing id string of MIDI adapter
  --  * @return 0 on success usbg_error if error occurred.
  --  * @note returned id should be free() by caller
  --

   function usbg_f_midi_get_id (mf : access usbg_f_midi; id : System.Address) return int  -- usbg/function/midi.h:163
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_get_id";

  --*
  --  * @brief Get the value of ID string for associated MIDI adapter
  --  *         into user buffer
  --  * @param[in] mf Pointer to midi function
  --  * @param[out] buf Place where id should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family). This may
  --  *         also return negative error code from usbg_error.
  --  * @note returned id should be free() by caller
  --

   function usbg_f_midi_get_id_s
     (mf  : access usbg_f_midi;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- usbg/function/midi.h:181
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_get_id_s";

  --*
  --  * @brief Set the value of ID string for associated MIDI adapter
  --  * @param[in] mf Pointer to midi function
  --  * @param[in] id string for MIDI adapter
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_set_id (mf : access usbg_f_midi; id : Interfaces.C.Strings.chars_ptr) return int  -- usbg/function/midi.h:189
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_set_id";

  --*
  --  * @brief Get the number of in ports of MIDI adapter
  --  * @param[in] mf Pointer to midi function
  --  * @param[out] in_ports Number of in ports of MIDI adapter
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_get_in_ports (mf : access usbg_f_midi; in_ports : access unsigned) return int  -- usbg/function/midi.h:201
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_get_in_ports";

  --*
  --  * @brief Set the number of in ports of MIDI adapter
  --  * @param[in] mf Pointer to midi function
  --  * @param[in] in_ports number of in ports of MIDI adapters which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_set_in_ports (mf : access usbg_f_midi; in_ports : unsigned) return int  -- usbg/function/midi.h:213
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_set_in_ports";

  --*
  --  * @brief Get the number of out ports of MIDI adapter
  --  * @param[in] mf Pointer to midi function
  --  * @param[out] out_ports Number of out ports of MIDI adapter
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_get_out_ports (mf : access usbg_f_midi; out_ports : access unsigned) return int  -- usbg/function/midi.h:225
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_get_out_ports";

  --*
  --  * @brief Set the number of out ports of MIDI adapter
  --  * @param[in] mf Pointer to midi function
  --  * @param[in] out_ports number of out ports of MIDI adapters which should be set
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_set_out_ports (mf : access usbg_f_midi; out_ports : unsigned) return int  -- usbg/function/midi.h:237
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_set_out_ports";

  --*
  --  * @brief Get the size of request buffer
  --  * @details This is the maximum number of bytes which can be received
  --  *        using single usb_request.
  --  * @param[in] lf Pointer to midi function
  --  * @param[out] buflen Current queue length
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_get_buflen (mf : access usbg_f_midi; buflen : access int) return int  -- usbg/function/midi.h:251
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_get_buflen";

  --*
  --  * @brief Set the size of request buffer
  --  * @details This is the maximum number of bytes which can be received
  --  *        using single usb_request.
  --  * @param[in] lf Pointer to midi function
  --  * @param[in] buflen Current queue length
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_set_buflen (mf : access usbg_f_midi; buflen : unsigned) return int  -- usbg/function/midi.h:265
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_set_buflen";

  --*
  --  * @brief Get the value of request queue length
  --  * @param[in] lf Pointer to midi function
  --  * @param[out] qlen Current queue length
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_get_qlen (mf : access usbg_f_midi; qlen : access unsigned) return int  -- usbg/function/midi.h:277
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_get_qlen";

  --*
  --  * @brief Set the value of request queue length
  --  * @param[in] lf Pointer to midi function
  --  * @param[in] qlen Current queue length
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_midi_set_qlen (mf : access usbg_f_midi; qlen : unsigned) return int  -- usbg/function/midi.h:289
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_midi_set_qlen";

end Libusg.Low_Level.usbg_function_midi_h;
