pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;

with Interfaces.C.Strings;
with Interfaces.C.Extensions;
with System;
with Interfaces.C_Streams;

package libUSBg.Low_Level.usbg_usbg_h is

   --  unsupported macro: DEFAULT_UDC NULL
   LANG_US_ENG          : constant                := 16#0409#;  --  usbg/usbg.h:51
   DEFAULT_CONFIG_LABEL : aliased constant String := "config" & ASCII.NUL;  --  usbg/usbg.h:52

   USBG_MAX_STR_LENGTH  : constant := 256;  --  usbg/usbg.h:55
   USBG_MAX_NAME_LENGTH : constant := 40;  --  usbg/usbg.h:56
   --  unsupported macro: USBG_MAX_DEV_LENGTH (USBG_MAX_NAME_LENGTH - 4)
   --  arg-macro: function USBG_TO_UNION (UNAME, FIELD, WHAT)
   --    return (union UNAME){ .FIELD := WHAT, };

   USBG_RM_RECURSE : constant := 1;  --  usbg/usbg.h:68
   --  arg-macro: procedure usbg_for_each_gadget (g, s)
   --    for (g := usbg_get_first_gadget(s); g /= NULL; g := usbg_get_next_gadget(g))
   --  arg-macro: procedure usbg_for_each_function (f, g)
   --    for (f := usbg_get_first_function(g); f /= NULL; f := usbg_get_next_function(f))
   --  arg-macro: procedure usbg_for_each_config (c, g)
   --    for (c := usbg_get_first_config(g); c /= NULL; c := usbg_get_next_config(c))
   --  arg-macro: procedure usbg_for_each_binding (b, c)
   --    for (b := usbg_get_first_binding(c); b /= NULL; b := usbg_get_next_binding(b))
   --  arg-macro: procedure usbg_for_each_udc (u, s)
   --    for (u := usbg_get_first_udc(s); u /= NULL; u := usbg_get_next_udc(u))

   --  * Copyright (C) 2013 Linaro Limited
   --  *
   --  * Matt Porter <mporter@linaro.org>
   --  *
   --  * Copyright (C) 2013 - 2015 Samsung Electronics
   --  *
   --  * Krzysztof Opasiak <k.opasiak@samsung.com>
   --  *
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

   -- For FILE *
  --*
  --  * @file include/usbg/usbg.h
  --  * @todo Clean up static buffers in structures
  --

   --*
  -- * @addtogroup libusbgx
  --  * Public API for USB gadget-configfs library
  --  * @{
  --

   --  This one has to be at least 18 bytes to hold network address
   --  Dev name for ffs is a part of function name, we subtract 4 char for "ffs."
  --*
  --  * @brief Additional option for usbg_rm_* functions.
  --  * @details This option allows to remove all content
  --  * of gadget/config/function recursively.
  --

   -- * Internal structures
  --

   type usbg_state is null record;   -- incomplete struct
   type usbg_state_access is access all usbg_state with Storage_Size => 0;

   type usbg_gadget is null record;   -- incomplete struct
   type usbg_gadget_access is access all usbg_gadget with Storage_Size => 0;

   type usbg_config is null record;   -- incomplete struct
   type usbg_config_access is access all usbg_config with Storage_Size => 0;

   type usbg_function is null record;   -- incomplete struct
   type usbg_function_access is access all usbg_function with Storage_Size => 0;

   type usbg_binding is null record;   -- incomplete struct
   type usbg_binding_access is access all usbg_binding with Storage_Size => 0;

   type usbg_udc is null record;   -- incomplete struct
   type usbg_udc_access is access all usbg_udc with Storage_Size => 0;

  --*
  --  * @brief State of the gadget devices in the system
  --

  --*
  -- * @brief USB gadget device
  --

  --*
  -- * @brief USB configuration
  --

  --*
  -- * @brief USB function
  --

  --*
  --  * @brief USB function to config binding
  --

  --*
  --  * @brief USB device controller
  --

  --*
  --  * @typedef usbg_gadget_attr
  --  * @brief Gadget attributes which can be set using
  --  * usbg_set_gadget_attr() function.
  --

   subtype usbg_gadget_attr is unsigned;
   USBG_GADGET_ATTR_MIN     : constant usbg_gadget_attr := 0;
   USBG_BCD_USB             : constant usbg_gadget_attr := 0;
   USBG_B_DEVICE_CLASS      : constant usbg_gadget_attr := 1;
   USBG_B_DEVICE_SUB_CLASS  : constant usbg_gadget_attr := 2;
   USBG_B_DEVICE_PROTOCOL   : constant usbg_gadget_attr := 3;
   USBG_B_MAX_PACKET_SIZE_0 : constant usbg_gadget_attr := 4;
   USBG_ID_VENDOR           : constant usbg_gadget_attr := 5;
   USBG_ID_PRODUCT          : constant usbg_gadget_attr := 6;
   USBG_BCD_DEVICE          : constant usbg_gadget_attr := 7;
   USBG_GADGET_ATTR_MAX     : constant usbg_gadget_attr := 8;  -- usbg/usbg.h:126

  --*
  --  * @brief USB gadget device attributes
  --

   type usbg_gadget_attrs;
   type usbg_gadget_attrs_access is access all usbg_gadget_attrs with Storage_Size => 0;
   type usbg_gadget_attrs is record
      bcdUSB          : aliased Interfaces.Unsigned_16;  -- usbg/usbg.h:133
      bDeviceClass    : aliased Interfaces.Unsigned_8;  -- usbg/usbg.h:134
      bDeviceSubClass : aliased Interfaces.Unsigned_8;  -- usbg/usbg.h:135
      bDeviceProtocol : aliased Interfaces.Unsigned_8;  -- usbg/usbg.h:136
      bMaxPacketSize0 : aliased Interfaces.Unsigned_8;  -- usbg/usbg.h:137
      idVendor        : aliased Interfaces.Unsigned_16;  -- usbg/usbg.h:138
      idProduct       : aliased Interfaces.Unsigned_16;  -- usbg/usbg.h:139
      bcdDevice       : aliased Interfaces.Unsigned_16;  -- usbg/usbg.h:140
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/usbg.h:131

   subtype usbg_gadget_str is unsigned;
   USBG_GADGET_STR_MIN    : constant usbg_gadget_str := 0;
   USBG_STR_MANUFACTURER  : constant usbg_gadget_str := 0;
   USBG_STR_PRODUCT       : constant usbg_gadget_str := 1;
   USBG_STR_SERIAL_NUMBER : constant usbg_gadget_str := 2;
   USBG_GADGET_STR_MAX    : constant usbg_gadget_str := 3;  -- usbg/usbg.h:149

  --*
  --  * @brief USB gadget device strings
  --

   type usbg_gadget_strs is record
      manufacturer : Interfaces.C.Strings.chars_ptr;  -- usbg/usbg.h:156
      product      : Interfaces.C.Strings.chars_ptr;  -- usbg/usbg.h:157
      serial       : Interfaces.C.Strings.chars_ptr;  -- usbg/usbg.h:158
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/usbg.h:154

  --*
  --  * @brief USB gadget Microsoft OS Descriptors
  --

   type usbg_gadget_os_descs is record
      c_use         : aliased Extensions.bool;  -- usbg/usbg.h:166
      b_vendor_code : aliased Interfaces.Unsigned_8;  -- usbg/usbg.h:167
      qw_sign       : Interfaces.C.Strings.chars_ptr;  -- usbg/usbg.h:168
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/usbg.h:164

  --*
  --  * @typedef usbg_gadget_os_desc_strs
  --  * @brief Microsoft OS Descriptors strings
  --

   subtype usbg_gadget_os_desc_strs is unsigned;
   USBG_GADGET_OS_DESC_MIN : constant usbg_gadget_os_desc_strs := 0;
   OS_DESC_USE             : constant usbg_gadget_os_desc_strs := 0;
   OS_DESC_B_VENDOR_CODE   : constant usbg_gadget_os_desc_strs := 1;
   OS_DESC_QW_SIGN         : constant usbg_gadget_os_desc_strs := 2;
   USBG_GADGET_OS_DESC_MAX : constant usbg_gadget_os_desc_strs := 3;  -- usbg/usbg.h:181

  --*
  --  * @brief USB configuration attributes
  --

   type usbg_config_attrs is record
      bmAttributes : aliased Interfaces.Unsigned_8;  -- usbg/usbg.h:188
      bMaxPower    : aliased Interfaces.Unsigned_8;  -- usbg/usbg.h:189
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/usbg.h:186

  --*
  --  * @brief USB configuration strings
  --

   type usbg_config_strs is record
      configuration : Interfaces.C.Strings.chars_ptr;  -- usbg/usbg.h:197
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/usbg.h:195

  --*
  --  * @typedef usbg_function_type
  --  * @brief Supported USB function types
  --

   subtype usbg_function_type is unsigned;
   USBG_FUNCTION_TYPE_MIN : constant usbg_function_type := 0;
   USBG_F_SERIAL          : constant usbg_function_type := 0;
   USBG_F_ACM             : constant usbg_function_type := 1;
   USBG_F_OBEX            : constant usbg_function_type := 2;
   USBG_F_ECM             : constant usbg_function_type := 3;
   USBG_F_SUBSET          : constant usbg_function_type := 4;
   USBG_F_NCM             : constant usbg_function_type := 5;
   USBG_F_EEM             : constant usbg_function_type := 6;
   USBG_F_RNDIS           : constant usbg_function_type := 7;
   USBG_F_PHONET          : constant usbg_function_type := 8;
   USBG_F_FFS             : constant usbg_function_type := 9;
   USBG_F_MASS_STORAGE    : constant usbg_function_type := 10;
   USBG_F_MIDI            : constant usbg_function_type := 11;
   USBG_F_LOOPBACK        : constant usbg_function_type := 12;
   USBG_F_HID             : constant usbg_function_type := 13;
   USBG_F_UAC2            : constant usbg_function_type := 14;
   USBG_FUNCTION_TYPE_MAX : constant usbg_function_type := 15;  -- usbg/usbg.h:223

  --*
  --  * @brief USB OS Descriptor function attributes
  --

   type usbg_function_os_desc is record
      compatible_id     : Interfaces.C.Strings.chars_ptr;  -- usbg/usbg.h:230
      sub_compatible_id : Interfaces.C.Strings.chars_ptr;  -- usbg/usbg.h:231
   end record
   with Convention => C_Pass_By_Copy;  -- usbg/usbg.h:228

  -- Error codes
  --*
  -- * @typedef usbg_error
  --  * @brief Errors which could be returned by library functions
  --

   subtype usbg_error is int;
   USBG_SUCCESS              : constant usbg_error := 0;
   USBG_ERROR_NO_MEM         : constant usbg_error := -1;
   USBG_ERROR_NO_ACCESS      : constant usbg_error := -2;
   USBG_ERROR_INVALID_PARAM  : constant usbg_error := -3;
   USBG_ERROR_NOT_FOUND      : constant usbg_error := -4;
   USBG_ERROR_IO             : constant usbg_error := -5;
   USBG_ERROR_EXIST          : constant usbg_error := -6;
   USBG_ERROR_NO_DEV         : constant usbg_error := -7;
   USBG_ERROR_BUSY           : constant usbg_error := -8;
   USBG_ERROR_NOT_SUPPORTED  : constant usbg_error := -9;
   USBG_ERROR_PATH_TOO_LONG  : constant usbg_error := -10;
   USBG_ERROR_INVALID_FORMAT : constant usbg_error := -11;
   USBG_ERROR_MISSING_TAG    : constant usbg_error := -12;
   USBG_ERROR_INVALID_TYPE   : constant usbg_error := -13;
   USBG_ERROR_INVALID_VALUE  : constant usbg_error := -14;
   USBG_ERROR_NOT_EMPTY      : constant usbg_error := -15;
   USBG_ERROR_OTHER_ERROR    : constant usbg_error := -99;  -- usbg/usbg.h:258

  --*
  --  * @brief Get the error name as a constant string
  --  * @param e error code
  --  * @return Constant string with error name
  --

   function usbg_error_name (e : usbg_error) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:265
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_error_name";

  --*
  --  * @brief Get the short description of error
  --  * @param e error code
  --  * @return Constant string with error description
  --

   function usbg_strerror (e : usbg_error) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:272
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_strerror";

  -- Library init and cleanup
  --*
  --  * @brief Initialize the libusbgx library state
  --  * @param configfs_path Path to the mounted configfs filesystem
  --  * @param state Pointer to be filled with pointer to usbg_state
  --  * @return 0 on success, usbg_error on error
  --

   function usbg_init (configfs_path : Interfaces.C.Strings.chars_ptr; state : not null access usbg_state_access) return int  -- usbg/usbg.h:282
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_init";

  --*
  --  * @brief Clean up the libusbgx library state
  --  * @param s Pointer to state
  --

   procedure usbg_cleanup (s : access usbg_state)  -- usbg/usbg.h:288
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_cleanup";

  --*
  -- * @brief Get ConfigFS path
  --  * @param s Pointer to state
  --  * @return Path to configfs or NULL if error occurred
  --  * @warning Returned buffer should not be edited!
  --  * Returned string is valid as long as passed usbg_state is valid.
  --  * For example path is valid until usbg_cleanup() call.
  --

   function usbg_get_configfs_path (s : access usbg_state) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:298
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_configfs_path";

  --*
  --  * @brief Get ConfigFS path into user buffer
  --  * @param[in] s Pointer to state
  --  * @param[out] buf Place where path should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family).
  --

   function usbg_get_configfs_path_s
     (s   : access usbg_state;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- usbg/usbg.h:309
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_configfs_path_s";

  -- USB gadget queries
  --*
  --  * @brief Get a gadget device by name
  --  * @param s Pointer to state
  --  * @param name Name of the gadget device
  --  * @return Pointer to gadget or NULL if a matching gadget isn't found
  --

   function usbg_get_gadget (s : access usbg_state; name : Interfaces.C.Strings.chars_ptr) return access usbg_gadget  -- usbg/usbg.h:319
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_gadget";

  --*
  --  * @brief Get a function by name
  --  * @param g Pointer to gadget
  --  * @param type Function type
  --  * @param instance Instance of function
  --  * @return Pointer to function or NULL if a matching function isn't found
  --

   function usbg_get_function
     (g        : access usbg_gadget;
      c_type   : usbg_function_type;
      instance : Interfaces.C.Strings.chars_ptr) return access usbg_function  -- usbg/usbg.h:328
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_function";

  --*
  --  * @brief Get a configuration by name
  --  * @param g Pointer to gadget
  --  * @param id Identify of configuration
  --  * @param label Configuration label. If not NULL this function will return
  --  * valid value only if configuration with given id exist and has this label.
  --  * If NULL this function will return config with given id (if such exist)
  --  * and ignore this param.
  --  * @return Pointer to config or NULL if a matching config isn't found
  --

   function usbg_get_config
     (g     : access usbg_gadget;
      id    : int;
      label : Interfaces.C.Strings.chars_ptr) return access usbg_config  -- usbg/usbg.h:341
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_config";

  --*
  -- * @brief Get a udc by name
  --  * @param s Pointer to state
  --  * @param name Name of the udc
  --  * @return Pointer to udc or NULL if a matching udc isn't found
  --

   function usbg_get_udc (s : access usbg_state; name : Interfaces.C.Strings.chars_ptr) return access usbg_udc  -- usbg/usbg.h:349
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_udc";

  --  USB gadget/config/function/binding removal
  --*
  --  * @brief Remove binding between configuration and function
  --  * @details This function frees also the memory allocated for binding
  --  * @param b Binding to be removed
  --  * @return 0 on success, usbg_error if error occurred
  --

   function usbg_rm_binding (b : access usbg_binding) return int  -- usbg/usbg.h:359
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_rm_binding";

  --*
  --  * @brief Remove configuration
  --  * @details This function frees also the memory allocated for configuration
  --  * @param c Configuration to be removed
  --  * @param opts Additional options for configuration removal.
  --  * @return 0 on success, usbg_error if error occurred
  --

   function usbg_rm_config (c : access usbg_config; opts : int) return int  -- usbg/usbg.h:368
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_rm_config";

  --*
  --  * @brief Remove existing USB function
  --  * @details This function frees also the memory allocated for function
  --  * @param f Function to be removed
  --  * @param opts Additional options for configuration removal.
  --  * @return 0 on success, usbg_error if error occurred
  --

   function usbg_rm_function (f : access usbg_function; opts : int) return int  -- usbg/usbg.h:377
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_rm_function";

  --*
  --  * @brief Remove existing USB gadget
  --  * @details This function frees also the memory allocated for gadget
  --  * @param g Gadget to be removed
  --  * @param opts Additional options for configuration removal.
  --  * @return 0 on success, usbg_error if error occurred
  --

   function usbg_rm_gadget (g : access usbg_gadget; opts : int) return int  -- usbg/usbg.h:386
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_rm_gadget";

  --*
  --  * @brief Remove configuration strings for given language
  --  * @param c Pointer to configuration
  --  * @param lang Language of strings which should be deleted
  --  * @return 0 on success, usbg_error if error occurred
  --

   function usbg_rm_config_strs (c : access usbg_config; lang : int) return int  -- usbg/usbg.h:394
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_rm_config_strs";

  --*
  --  * @brief Remove gadget strings for given language
  --  * @param g Pointer to gadget
  --  * @param lang Language of strings which should be deleted
  --  * @return 0 on success, usbg_error if error occurred
  --

   function usbg_rm_gadget_strs (g : access usbg_gadget; lang : int) return int  -- usbg/usbg.h:402
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_rm_gadget_strs";

  --  USB gadget allocation and configuration
  --*
  --  * @brief Create a new USB gadget device
  --  * @param s Pointer to state
  --  * @param name Name of the gadget
  --  * @param idVendor Gadget vendor ID
  --  * @param idProduct Gadget product ID
  --  * @param g Pointer to be filled with pointer to gadget
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_create_gadget_vid_pid
     (s         : access usbg_state;
      name      : Interfaces.C.Strings.chars_ptr;
      idVendor  : Interfaces.Unsigned_16;
      idProduct : Interfaces.Unsigned_16;
      g         : not null access usbg_gadget_access) return int  -- usbg/usbg.h:415
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_create_gadget_vid_pid";

  --*
  --  * @brief Create a new USB gadget device and set given attributes
  --  * and strings
  --  * @param s Pointer to state
  --  * @param name Name of the gadget
  --  * @param g_attrs Gadget attributes to be set. If NULL setting is omitted.
  --  * @param g_strs Gadget strings to be set. If NULL setting is omitted.
  --  * @param g Pointer to be filled with pointer to gadget
  --  * @note Given strings are assumed to be in US English
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_create_gadget
     (s       : access usbg_state;
      name    : Interfaces.C.Strings.chars_ptr;
      g_attrs : access constant usbg_gadget_attrs;
      g_strs  : access constant usbg_gadget_strs;
      g       : not null access usbg_gadget_access) return int  -- usbg/usbg.h:429
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_create_gadget";

  --*
  --  * @brief Get string representing selected gadget attribute
  --  * @param attr code of selected attribute
  --  * @return String suitable for given attribute or NULL if such
  --  * string has not been found
  --

   function usbg_get_gadget_attr_str (attr : usbg_gadget_attr) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:440
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_attr_str";

  --*
  --  * @brief Lookup attr code based on its name
  --  * @param name of attribute
  --  * @return code of suitable attribute or usbg_error
  --

   function usbg_lookup_gadget_attr (name : Interfaces.C.Strings.chars_ptr) return int  -- usbg/usbg.h:447
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_lookup_gadget_attr";

  --*
  --  * @brief Lookup str code based on its name
  --  * @param name of string
  --  * @return code of suitable string or usbg_error
  --

   function usbg_lookup_gadget_str (name : Interfaces.C.Strings.chars_ptr) return int  -- usbg/usbg.h:454
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_lookup_gadget_str";

  --*
  --  * @brief Get name of selected gadget string
  --  * @param str Gadget string code
  --  * @return Name of string associated with this code
  --

   function usbg_get_gadget_str_name (str : usbg_gadget_str) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:461
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_str_name";

  --*
  --  * @brief Get name of selected OS Descriptor string
  --  * @param str OS Descriptor string code
  --  * @return Name of OS Descriptor associated with this code
  --

   function usbg_get_gadget_os_desc_name (str : usbg_gadget_os_desc_strs) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:468
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_os_desc_name";

  --*
  --  * @brief Set selected attribute to value
  --  * @param g Pointer to gadget
  --  * @param attr Code of selected attribute
  --  * @param val value to be set
  --  * @return 0 on success, usbg_error otherwise
  --  * @note val is of type int but value provided to this function should
  --  * be suitable to place it in type dedicated for selected attr (uint16 or uint8)
  --

   function usbg_set_gadget_attr
     (g    : access usbg_gadget;
      attr : usbg_gadget_attr;
      val  : int) return int  -- usbg/usbg.h:479
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_attr";

  --*
  --  * @brief Get value of selected attribute
  --  * @param g Pointer to gadget
  --  * @param attr Code of selected attribute
  --  * @return Value of selected attribute (always above zero) or
  --  * usbg_error if error occurred.
  --  * @note User should use only lowest one or two bytes as attribute value
  --  * depending on attribute size (see usbg_gadget_attrs for details).
  --

   function usbg_get_gadget_attr (g : access usbg_gadget; attr : usbg_gadget_attr) return int  -- usbg/usbg.h:490
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_attr";

  --*
  --  * @brief Set the USB gadget attributes
  --  * @param g Pointer to gadget
  --  * @param g_attrs Gadget attributes
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_attrs (g : access usbg_gadget; g_attrs : access constant usbg_gadget_attrs) return int  -- usbg/usbg.h:498
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_attrs";

  --*
  --  * @brief Get the USB gadget strings
  --  * @param g Pointer to gadget
  --  * @param g_attrs Structure to be filled
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_get_gadget_attrs (g : access usbg_gadget; g_attrs : access usbg_gadget_attrs) return int  -- usbg/usbg.h:507
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_attrs";

  --*
  -- * @brief Get gadget name
  --  * @param g Pointer to gadget
  --  * @return Gadget name or NULL if error occurred.
  --  * @warning Returned buffer should not be edited!
  --  * Returned string is valid as long as passed usbg_gadget is valid.
  --  * For example gadget name is valid until someone remove gadget.
  --

   function usbg_get_gadget_name (g : access usbg_gadget) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:518
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_name";

  --*
  --  * @brief Get gadget name into user buffer
  --  * @param[in] g Pointer to state
  --  * @param[out] buf Place where name should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family).
  --

   function usbg_get_gadget_name_s
     (g   : access usbg_gadget;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- usbg/usbg.h:529
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_name_s";

  --*
  --  * @brief Set the USB gadget vendor id
  --  * @param g Pointer to gadget
  --  * @param idVendor USB device vendor id
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_vendor_id (g : access usbg_gadget; idVendor : Interfaces.Unsigned_16) return int  -- usbg/usbg.h:537
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_vendor_id";

  --*
  --  * @brief Set the USB gadget product id
  --  * @param g Pointer to gadget
  --  * @param idProduct USB device product id
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_product_id (g : access usbg_gadget; idProduct : Interfaces.Unsigned_16) return int  -- usbg/usbg.h:545
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_product_id";

  --*
  --  * @brief Set the USB gadget device class code
  --  * @param g Pointer to gadget
  --  * @param bDeviceClass USB device class code
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_device_class (g : access usbg_gadget; bDeviceClass : Interfaces.Unsigned_8) return int  -- usbg/usbg.h:553
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_device_class";

  --*
  --  * @brief Set the USB gadget protocol code
  --  * @param g Pointer to gadget
  --  * @param bDeviceProtocol USB protocol code
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_device_protocol (g : access usbg_gadget; bDeviceProtocol : Interfaces.Unsigned_8) return int  -- usbg/usbg.h:562
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_device_protocol";

  --*
  --  * @brief Set the USB gadget device subclass code
  --  * @param g Pointer to gadget
  --  * @param bDeviceSubClass USB device subclass code
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_device_subclass (g : access usbg_gadget; bDeviceSubClass : Interfaces.Unsigned_8) return int  -- usbg/usbg.h:571
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_device_subclass";

  --*
  --  * @brief Set the maximum packet size for a gadget
  --  * @param g Pointer to gadget
  --  * @param bMaxPacketSize0 Maximum packet size
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_device_max_packet (g : access usbg_gadget; bMaxPacketSize0 : Interfaces.Unsigned_8) return int  -- usbg/usbg.h:580
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_device_max_packet";

  --*
  --  * @brief Set the gadget device BCD release number
  --  * @param g Pointer to gadget
  --  * @param bcdDevice BCD release number
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_device_bcd_device (g : access usbg_gadget; bcdDevice : Interfaces.Unsigned_16) return int  -- usbg/usbg.h:589
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_device_bcd_device";

  --*
  --  * @brief Set the gadget device BCD USB version
  --  * @param g Pointer to gadget
  --  * @param bcdUSB BCD USB version
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_device_bcd_usb (g : access usbg_gadget; bcdUSB : Interfaces.Unsigned_16) return int  -- usbg/usbg.h:598
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_device_bcd_usb";

  --*
  --  * @brief Get the USB gadget strings
  --  * @param g Pointer to gadget
  --  * @param lang Language of strings
  --  * @param g_strs Structure to be filled
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_get_gadget_strs
     (g      : access usbg_gadget;
      lang   : int;
      g_strs : access usbg_gadget_strs) return int  -- usbg/usbg.h:607
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_strs";

  --*
  --  * @brief Get the array of languages available in this gadget
  --  * @param g Pointer to gadget
  --  * @param langs array of available language codes
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_get_gadget_strs_langs (g : access usbg_gadget; langs : System.Address) return int  -- usbg/usbg.h:616
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_strs_langs";

  --*
  --  * @brief Free gadget strings
  --  * @details This function releases the memory allocated for strings
  --  *          not for struct usbg_gadget_strs itself.
  --  * @param g_strs Strings to be released
  --

   procedure usbg_free_gadget_strs (g_strs : access usbg_gadget_strs)  -- usbg/usbg.h:624
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_free_gadget_strs";

  --*
  --  * @brief Set selected string
  --  * @param g Pointer to gadget
  --  * @param str Code of selected string
  --  * @param val value to be set
  --  * @return 0 on success, usbg_error otherwise
  --

   function usbg_set_gadget_str
     (g    : access usbg_gadget;
      str  : usbg_gadget_str;
      lang : int;
      val  : Interfaces.C.Strings.chars_ptr) return int  -- usbg/usbg.h:641
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_str";

  --*
  --  * @brief Set the USB gadget strings
  --  * @param g Pointer to gadget
  --  * @param lang USB language ID
  --  * @param g_strs Gadget attributes
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_strs
     (g      : access usbg_gadget;
      lang   : int;
      g_strs : access constant usbg_gadget_strs) return int  -- usbg/usbg.h:651
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_strs";

  --*
  --  * @brief Set the serial number for a gadget
  --  * @param g Pointer to gadget
  --  * @param lang USB language ID
  --  * @param ser Serial number
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_serial_number
     (g    : access usbg_gadget;
      lang : int;
      ser  : Interfaces.C.Strings.chars_ptr) return int  -- usbg/usbg.h:661
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_serial_number";

  --*
  --  * @brief Set the manufacturer name for a gadget
  --  * @param g Pointer to gadget
  --  * @param lang USB language ID
  --  * @param mnf Manufacturer
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_manufacturer
     (g    : access usbg_gadget;
      lang : int;
      mnf  : Interfaces.C.Strings.chars_ptr) return int  -- usbg/usbg.h:671
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_manufacturer";

  --*
  --  * @brief Set the product name for a gadget
  --  * @param g Pointer to gadget
  --  * @param lang USB language ID
  --  * @param prd Product
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_product
     (g    : access usbg_gadget;
      lang : int;
      prd  : Interfaces.C.Strings.chars_ptr) return int  -- usbg/usbg.h:681
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_product";

  --*
  --  * @brief Get the USB gadget OS Descriptor
  --  * @param g Pointer to gadget
  --  * @param g_os_descs Structure to be filled
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_get_gadget_os_descs (g : access usbg_gadget; g_os_descs : access usbg_gadget_os_descs) return int  -- usbg/usbg.h:691
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_os_descs";

  --*
  --  * @brief Free OS Descriptor attributes
  --  * @details This function releases the memory allocated for USB
  --  *          gadget OS Descriptor atrributes.
  --  * @param g_os_desc OS Descriptor attributes to be released
  --

   procedure usbg_free_gadget_os_desc (g_os_desc : access usbg_gadget_os_descs)  -- usbg/usbg.h:700
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_free_gadget_os_desc";

  --*
  --  * @brief Set the USB gadget OS Descriptor
  --  * @param g Pointer to gadget
  --  * @param g_os_descs Structure to be filled
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_set_gadget_os_descs (g : access usbg_gadget; g_os_descs : access constant usbg_gadget_os_descs) return int  -- usbg/usbg.h:716
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_gadget_os_descs";

  --  USB function allocation and configuration
  --*
  --  * @brief Create a new USB gadget function and set its attributes
  --  * @param g Pointer to gadget
  --  * @param type Type of function
  --  * @param instance Function instance name
  --  * @param f_attrs Function specific attributes to be set.
  --  *        If NULL setting is omitted.
  --  * @param f Pointer to be filled with pointer to function
  --  * @note Given strings are assumed to be in US English
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_create_function
     (g        : access usbg_gadget;
      c_type   : usbg_function_type;
      instance : Interfaces.C.Strings.chars_ptr;
      f_attrs  : not null access usbg_gadget_attrs_access;
      f        : not null access usbg_function_access) return int  -- usbg/usbg.h:732
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_create_function";

  --*
  --  * @brief Get function instance name
  --  * @param f Pointer to function
  --  * @return instance name or NULL if error occurred.
  --  * @warning Returned buffer should not be edited!
  --  * Returned string is valid as long as passed usbg_function is valid.
  --  * For example instance name is valid until someone remove this function.
  --

   function usbg_get_function_instance (f : access usbg_function) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:743
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_function_instance";

  --*
  --  * @brief Get function instance name into user buffer
  --  * @param[in] f Pointer to function
  --  * @param[out] buf Place where instance name should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family).
  --

   function usbg_get_function_instance_s
     (f   : access usbg_function;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- usbg/usbg.h:754
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_function_instance_s";

  --*
  --  * @brief Get function type as a string
  --  * @param type Function type
  --  * @return String suitable for given function type
  --

   function usbg_get_function_type_str (c_type : usbg_function_type) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:761
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_function_type_str";

  --*
  --  * @brief Lookup function type suitable for given name
  --  * @param name Name of function
  --  * @return Function type enum or negative error code
  --

   function usbg_lookup_function_type (name : Interfaces.C.Strings.chars_ptr) return int  -- usbg/usbg.h:768
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_lookup_function_type";

  --*
  --  * @brief Cleanup content of function attributes
  --  * @param f_attrs function attributes which should be cleaned up.
  --  * @note This function should be called to free
  --  * additional memory allocated by usbg_get_function_attrs().
  --  * @warning None of attributes in passed structure should be
  --  * accessed after returning from this function.
  --

   procedure usbg_cleanup_function_attrs (f : access usbg_function; f_attrs : not null access usbg_gadget_attrs_access)  -- usbg/usbg.h:778
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_cleanup_function_attrs";

  --*
  --  * @brief Get type of given function
  --  * @param f Pointer to function
  --  * @return usbg_function_type (0 or above) or
  --  *  usbg_error (below 0) if error occurred
  --

   function usbg_get_function_type (f : access usbg_function) return usbg_function_type  -- usbg/usbg.h:786
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_function_type";

  --*
  --  * @brief Get attributes of given function
  --  * @param f Pointer to function
  --  * @param f_attrs Union to be filled
  --  * @return 0 on success usbg_error if error occurred.
  --  * @warning memory pointed by f_attrs should be big enough to hold attributes
  --  *         specific for given function type. This function can by dangerous.
  --  *         That's why it is strongly recomended to use set/get function provided
  --  *         by each function type.
  --

   function usbg_get_function_attrs (f : access usbg_function; f_attrs : not null access usbg_gadget_attrs_access) return int  -- usbg/usbg.h:798
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_function_attrs";

  --*
  --  * @brief Set attributes of given function
  --  * @param f Pointer to function
  --  * @param f_attrs Attributes to be set
  --  * @return 0 on success, usbg_error if error occurred
  --

   function usbg_set_function_attrs (f : access usbg_function; f_attrs : not null access usbg_gadget_attrs_access) return int  -- usbg/usbg.h:806
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_function_attrs";

  --*
  --  * @brief Get OS Descriptor compatibility of given function
  --  * @param f Pointer to function
  --  * @param iname Interface name
  --  * @param f_os_desc OS Descriptor compatibility to be filled
  --  * @return 0 on success, usbg_error if error occurred
  --

   function usbg_get_interf_os_desc
     (f         : access usbg_function;
      iname     : Interfaces.C.Strings.chars_ptr;
      f_os_desc : access usbg_function_os_desc) return int  -- usbg/usbg.h:815
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_interf_os_desc";

  --*
  --  * @brief Free OS Descriptor function attributes
  --  * @details This function releases the memory allocated for function
  --  *          atrributes for struct usbg_function_os_desc.
  --  * @param f_os_desc OS Descriptor function attributes to be released
  --

   procedure usbg_free_interf_os_desc (f_os_desc : access usbg_function_os_desc)  -- usbg/usbg.h:824
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_free_interf_os_desc";

  --*
  --  * @brief Set OS Descriptor compatibility of given function
  --  * @param f Pointer to function
  --  * @param iname Interface name
  --  * @param f_os_desc OS Descriptor compatibility to be set
  --  * @return 0 on success, usbg_error if error occurred
  --

   function usbg_set_interf_os_desc
     (f         : access usbg_function;
      iname     : Interfaces.C.Strings.chars_ptr;
      f_os_desc : access constant usbg_function_os_desc) return int  -- usbg/usbg.h:841
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_interf_os_desc";

  --  USB configurations allocation and configuration
  --*
  --  * @brief Create a new USB gadget configuration
  --  * @param g Pointer to gadget
  --  * @param id Identify of configuration
  --  * @param label configuration label, if NULL, default is used
  --  * @param c_attrs Configuration attributes to be set
  --  * @param c_strs Configuration strings to be set
  --  * @param c Pointer to be filled with pointer to configuration
  --  * @note Given strings are assumed to be in US English
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_create_config
     (g       : access usbg_gadget;
      id      : int;
      label   : Interfaces.C.Strings.chars_ptr;
      c_attrs : access constant usbg_config_attrs;
      c_strs  : access constant usbg_config_strs;
      c       : not null access usbg_usbg_h.usbg_config_access) return int  -- usbg/usbg.h:857
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_create_config";

  --*
  -- * @brief Get config label
  --  * @param c Pointer to config
  --  * @return config label or NULL if error occurred.
  --  * @warning Returned buffer should not be edited!
  --  * Returned string is valid as long as passed usbg_config is valid.
  --  * For example config label is valid until someone remove this function.
  --

   function usbg_get_config_label (c : access usbg_config) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:870
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_config_label";

  --*
  --  * @brief Get config label into user buffer
  --  * @param[in] c Pointer to config
  --  * @param[out] buf Place where label should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family).
  --

   function usbg_get_config_label_s
     (c   : access usbg_config;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- usbg/usbg.h:881
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_config_label_s";

  --*
  -- * @brief Get config id
  --  * @param c Pointer to config
  --  * @return Configuration id or usbg_error if error occurred.
  --

   function usbg_get_config_id (c : access usbg_config) return int  -- usbg/usbg.h:888
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_config_id";

  --*
  --  * @brief Set the USB configuration attributes
  --  * @param c Pointer to configuration
  --  * @param c_attrs Configuration attributes
  --  * @return 0 on success or usbg_error if error occurred.
  --

   function usbg_set_config_attrs (c : access usbg_config; c_attrs : access constant usbg_config_attrs) return int  -- usbg/usbg.h:896
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_config_attrs";

  --*
  --  * @brief Get the USB configuration strings
  --  * @param c Pointer to configuration
  --  * @param c_attrs Structure to be filled
  --  * @return 0 on success or usbg_error if error occurred.
  --

   function usbg_get_config_attrs (c : access usbg_config; c_attrs : access usbg_config_attrs) return int  -- usbg/usbg.h:905
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_config_attrs";

  --*
  --  * @brief Set the configuration maximum power
  --  * @param c Pointer to config
  --  * @param bMaxPower Maximum power (in 2 mA units)
  --  * @return 0 on success or usbg_error if error occurred.
  --

   function usbg_set_config_max_power (c : access usbg_config; bMaxPower : int) return int  -- usbg/usbg.h:914
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_config_max_power";

  --*
  --  * @brief Set the configuration bitmap attributes
  --  * @param c Pointer to config
  --  * @param bmAttributes Configuration characteristics
  --  * @return 0 on success or usbg_error if error occurred.
  --

   function usbg_set_config_bm_attrs (c : access usbg_config; bmAttributes : int) return int  -- usbg/usbg.h:922
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_config_bm_attrs";

  --*
  --  * @brief Get the USB configuration strings
  --  * @param c Pointer to configuration
  --  * @param lang Language of strings
  --  * @param c_strs Structure to be filled
  --  * @return 0 on success or usbg_error if error occurred.
  --

   function usbg_get_config_strs
     (c      : access usbg_config;
      lang   : int;
      c_strs : access usbg_config_strs) return int  -- usbg/usbg.h:931
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_config_strs";

  --*
  --  * @brief Get the array of languages available in this config
  --  * @param c Pointer to configuration
  --  * @param langs array of available language codes
  --  * @return 0 on success usbg_error if error occurred
  --

   function usbg_get_config_strs_langs (c : access usbg_config; langs : System.Address) return int  -- usbg/usbg.h:940
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_config_strs_langs";

  --*
  --  * @brief Free configuration strings
  --  * @details This function releases the memory allocated for strings
  --  *          not for struct usbg_config_strs itself.
  --  * @param c_strs Strings to be released
  --

   procedure usbg_free_config_strs (c_strs : access usbg_config_strs)  -- usbg/usbg.h:948
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_free_config_strs";

  --*
  --  * @brief Set the USB configuration strings
  --  * @param c Pointer to configuration
  --  * @param lang USB language ID
  --  * @param c_strs Configuration strings
  --  * @return 0 on success, usbg_error on failure.
  --

   function usbg_set_config_strs
     (c      : access usbg_config;
      lang   : int;
      c_strs : access constant usbg_config_strs) return int  -- usbg/usbg.h:963
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_config_strs";

  --*
  --  * @brief Set the configuration string
  --  * @param c Pointer to config
  --  * @param lang USB language ID
  --  * @param string Configuration description
  --  * @return 0 on success, usbg_error on failure.
  --

   function usbg_set_config_string
     (c      : access usbg_config;
      lang   : int;
      string : Interfaces.C.Strings.chars_ptr) return int  -- usbg/usbg.h:973
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_config_string";

  --*
  --  * @brief Add a function to a configuration
  --  * @param c Pointer to config
  --  * @param name Name of configuration function binding
  --  * @param f Pointer to function
  --  * @return 0 on success, usbg_error on failure.
  --

   function usbg_add_config_function
     (c    : access usbg_config;
      name : Interfaces.C.Strings.chars_ptr;
      f    : access usbg_function) return int  -- usbg/usbg.h:982
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_add_config_function";

  --*
  --  * @brief Get target function of given binding
  --  * @param b Binding between configuration and function
  --  * @return Pointer to USB function which is target for this binding
  --

   function usbg_get_binding_target (b : access usbg_binding) return access usbg_function  -- usbg/usbg.h:990
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_binding_target";

  --*
  -- * @brief Get binding name
  --  * @param b Pointer to binding
  --  * @return Binding name or NULL if error occurred.
  --  * @warning Returned buffer should not be edited!
  --  * Returned string is valid as long as passed usbg_binding is valid.
  --  * For example binding name is valid until someone remove this binding.
  --

   function usbg_get_binding_name (b : access usbg_binding) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:1000
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_binding_name";

  --*
  --  * @brief Get binding name into user buffer
  --  * @param[in] b Pointer to binding
  --  * @param[out] buf Place where binding name should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family).
  --

   function usbg_get_binding_name_s
     (b   : access usbg_binding;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- usbg/usbg.h:1011
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_binding_name_s";

  --*
  --  * @brief Get configuration selected for OS Descriptors
  --  * @param g Pointer to gadget
  --  * @return usbg_config or NULL
  --

   function usbg_get_os_desc_binding (g : access usbg_gadget) return access usbg_config  -- usbg/usbg.h:1018
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_os_desc_binding";

  --*
  --  * @brief Set configuration for OS Descriptors
  --  * @param g Pointer to gadget
  --  * @param c Pointer to config
  --  * @return 0 on success, usbg_error on failure.
  --

   function usbg_set_os_desc_config (g : access usbg_gadget; c : access usbg_config) return int  -- usbg/usbg.h:1026
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_set_os_desc_config";

  --  USB gadget setup and teardown
  --*
  --  * @brief Enable a USB gadget device
  --  * @param g Pointer to gadget
  --  * @param udc where gadget should be assigned.
  --  *  If NULL, default one (first) is used.
  --  * @return 0 on success or usbg_error if error occurred.
  --

   function usbg_enable_gadget (g : access usbg_gadget; udc : access usbg_udc) return int  -- usbg/usbg.h:1037
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_enable_gadget";

  --*
  --  * @brief Disable a USB gadget device
  --  * @param g Pointer to gadget
  --  * @return 0 on success or usbg_error if error occurred.
  --

   function usbg_disable_gadget (g : access usbg_gadget) return int  -- usbg/usbg.h:1044
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_disable_gadget";

  --*
  -- * @brief Get name of udc
  -- * @param u Pointer to udc
  --  * @return UDC name or NULL if error occurred.
  --  * @warning Returned buffer should not be edited!
  --  * Returned string is valid as long as passed usbg_state is valid.
  --  * For example UDC name is valid until usbg_cleanup().
  --

   function usbg_get_udc_name (u : access usbg_udc) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:1054
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_udc_name";

  --*
  --  * @brief Get udc name into user buffer
  --  * @param[in] u Pointer to udc
  --  * @param[out] buf Place where udc name should be stored
  --  * @param[in] len Size of buffer
  --  * @return Number of bytes placed into buf (excluding '\0') or the number of
  --  *         characters which would have been written to the buffer if enough
  --  *         space had been available. (just like snprintf() family).
  --

   function usbg_get_udc_name_s
     (u   : access usbg_udc;
      buf : Interfaces.C.Strings.chars_ptr;
      len : int) return int  -- usbg/usbg.h:1065
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_udc_name_s";

  --*
  --  * @brief Get udc to which gadget is bound
  --  * @param g Pointer to gadget
  --  * @return Pointer to UDC or NULL if gadget is not enabled
  --

   function usbg_get_gadget_udc (g : access usbg_gadget) return access usbg_udc  -- usbg/usbg.h:1072
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_udc";

  --*
  --  * @brief Get gadget which is attached to this UDC
  --  * @param u Pointer to udc
  --  * @return Pointer to gadget or NULL if UDC is free
  --

   function usbg_get_udc_gadget (u : access usbg_udc) return access usbg_gadget  -- usbg/usbg.h:1079
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_udc_gadget";

  --*
  --  * @def usbg_for_each_gadget(g, s)
  --  * Iterates over each gadget
  --

  --*
  --  * @def usbg_for_each_function(f, g)
  --  * Iterates over each function
  --

  --*
  --  * @def usbg_for_each_config(c, g)
  --  * Iterates over each config
  --

  --*
  --  * @def usbg_for_each_binding(b, c)
  --  * Iterates over each binding
  --

  --*
  --  * @def usbg_for_each_udc(b, c)
  --  * Iterates over each udc
  --

  --*
  --  * @brief Get first gadget in gadget list
  --  * @param s State of library
  --  * @return Pointer to gadget or NULL if list is empty.
  --  * @note Gadgets are sorted in strings (name) order
  --

   function usbg_get_first_gadget (s : access usbg_state) return access usbg_gadget  -- usbg/usbg.h:1132
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_first_gadget";

  --*
  --  * @brief Get first function in function list
  --  * @param g Pointer of gadget
  --  * @return Pointer to function or NULL if list is empty.
  --  * @note Functions are sorted in strings (name) order
  --

   function usbg_get_first_function (g : access usbg_gadget) return access usbg_function  -- usbg/usbg.h:1140
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_first_function";

  --*
  --  * @brief Get first config in config list
  --  * @param g Pointer of gadget
  --  * @return Pointer to configuration or NULL if list is empty.
  --  * @note Configs are sorted in strings (name) order
  --

   function usbg_get_first_config (g : access usbg_gadget) return access usbg_config  -- usbg/usbg.h:1148
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_first_config";

  --*
  --  * @brief Get first binding in binding list
  --  * @param c Pointer to configuration
  --  * @return Pointer to binding or NULL if list is empty.
  --  * @note Bindings are sorted in strings (name) order
  --

   function usbg_get_first_binding (c : access usbg_config) return access usbg_binding  -- usbg/usbg.h:1156
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_first_binding";

  --*
  --  * @brief Get first udc in udc list
  --  * @param s State of library
  --  * @return Pointer to udc or NULL if list is empty.
  --  * @note UDCs are sorted in strings (name) order
  --

   function usbg_get_first_udc (s : access usbg_state) return access usbg_udc  -- usbg/usbg.h:1164
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_first_udc";

  --*
  --  * @brief Get the next gadget on a list.
  --  * @param g Pointer to current gadget
  --  * @return Next gadget or NULL if end of list.
  --

   function usbg_get_next_gadget (g : access usbg_gadget) return access usbg_gadget  -- usbg/usbg.h:1171
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_next_gadget";

  --*
  --  * @brief Get the next function on a list.
  --  * @param f Pointer to current function
  --  * @return Next function or NULL if end of list.
  --

   function usbg_get_next_function (f : access usbg_function) return access usbg_function  -- usbg/usbg.h:1178
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_next_function";

  --*
  --  * @brief Get the next config on a list.
  --  * @param c Pointer to current config
  --  * @return Next config or NULL if end of list.
  --

   function usbg_get_next_config (c : access usbg_config) return access usbg_config  -- usbg/usbg.h:1185
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_next_config";

  --*
  --  * @brief Get the next binding on a list.
  --  * @param b Pointer to current binding
  --  * @return Next binding or NULL if end of list.
  --

   function usbg_get_next_binding (b : access usbg_binding) return access usbg_binding  -- usbg/usbg.h:1192
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_next_binding";

  --*
  --  * @brief Get the next udc on a list.
  --  * @param u Pointer to current udc
  --  * @return Next udc or NULL if end of list.
  --

   function usbg_get_next_udc (u : access usbg_udc) return access usbg_udc  -- usbg/usbg.h:1199
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_next_udc";

  -- Import / Export API
  --*
  --  * @brief Exports usb function to file
  --  * @param f Pointer to function to be exported
  --  * @param stream where function should be saved
  --  * @return 0 on success, usbg_error otherwise
  --

   function usbg_export_function (f : access usbg_function; stream : Interfaces.C_Streams.FILEs) return int  -- usbg/usbg.h:1209
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_export_function";

  --*
  --  * @brief Exports configuration to file
  --  * @param c Pointer to configuration to be exported
  --  * @param stream where configuration should be saved
  --  * @return 0 on success, usbg_error otherwise
  --

   function usbg_export_config (c : access usbg_config; stream : Interfaces.C_Streams.FILEs) return int  -- usbg/usbg.h:1217
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_export_config";

  --*
  --  * @brief Exports whole gadget to file
  --  * @param g Pointer to gadget to be exported
  --  * @param stream where gadget should be saved
  --  * @return 0 on success, usbg_error otherwise
  --

   function usbg_export_gadget (g : access usbg_gadget; stream : Interfaces.C_Streams.FILEs) return int  -- usbg/usbg.h:1225
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_export_gadget";

  --*
  --  * @brief Imports usb function from file and adds it to given gadget
  --  * @param g Gadget where function should be placed
  --  * @param stream from which function should be imported
  --  * @param instance name which should be used for new function
  --  * @param f place for pointer to imported function
  --  * if NULL this param will be ignored.
  --  * @return 0 on success, usbg_error otherwise
  --

   function usbg_import_function
     (g        : access usbg_gadget;
      stream   : Interfaces.C_Streams.FILEs;
      instance : Interfaces.C.Strings.chars_ptr;
      f        : not null access usbg_function_access) return int  -- usbg/usbg.h:1236
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_import_function";

  --*
  --  * @brief Imports usb configuration from file and adds it to given gadget
  --  * @param g Gadget where configuration should be placed
  --  * @param stream from which configuration should be imported
  --  * @param id which should be used for new configuration
  --  * @param c place for pointer to imported configuration
  --  * if NULL this param will be ignored.
  --  * @return 0 on success, usbg_error otherwise
  --

   function usbg_import_config
     (g      : access usbg_gadget;
      stream : Interfaces.C_Streams.FILEs;
      id     : int;
      c      : not null access usbg_usbg_h.usbg_config_access) return int  -- usbg/usbg.h:1248
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_import_config";

  --*
  --  * @brief Imports usb gadget from file
  --  * @param s current state of library
  --  * @param stream from which gadget should be imported
  --  * @param name which should be used for new gadget
  --  * @param g place for pointer to imported gadget
  --  * if NULL this param will be ignored.
  --  * @return 0 on success, usbg_error otherwise
  --

   function usbg_import_gadget
     (s      : access usbg_state;
      stream : Interfaces.C_Streams.FILEs;
      name   : Interfaces.C.Strings.chars_ptr;
      g      : not null access usbg_gadget_access) return int  -- usbg/usbg.h:1260
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_import_gadget";

  --*
  --  * @brief Get text of error which occurred during last function import
  --  * @param g gadget where function import error occurred
  --  * @return Text of error or NULL if no error data
  --

   function usbg_get_func_import_error_text (g : access usbg_gadget) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:1268
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_func_import_error_text";

  --*
  --  * @brief Get line number where function import error occurred
  --  * @param g gadget where function import error occurred
  --  * @return line number or value below 0 if no error data
  --

   function usbg_get_func_import_error_line (g : access usbg_gadget) return int  -- usbg/usbg.h:1275
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_func_import_error_line";

  --*
  --  * @brief Get text of error which occurred during last config import
  --  * @param g gadget where config import error occurred
  --  * @return Text of error or NULL if no error data
  --

   function usbg_get_config_import_error_text (g : access usbg_gadget) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:1282
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_config_import_error_text";

  --*
  --  * @brief Get line number where config import error occurred
  --  * @param g gadget where config import error occurred
  --  * @return line number or value below 0 if no error data
  --

   function usbg_get_config_import_error_line (g : access usbg_gadget) return int  -- usbg/usbg.h:1289
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_config_import_error_line";

  --*
  --  * @brief Get text of error which occurred during last gadget import
  --  * @param s where gadget import error occurred
  --  * @return Text of error or NULL if no error data
  --

   function usbg_get_gadget_import_error_text (s : access usbg_state) return Interfaces.C.Strings.chars_ptr  -- usbg/usbg.h:1296
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_import_error_text";

  --*
  --  * @brief Get line number where gadget import error occurred
  --  * @param s where gadget import error occurred
  --  * @return line number or value below 0 if no error data
  --

   function usbg_get_gadget_import_error_line (s : access usbg_state) return int  -- usbg/usbg.h:1303
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_get_gadget_import_error_line";

  --*
  -- * @}
  --

end libUSBg.Low_Level.usbg_usbg_h;
