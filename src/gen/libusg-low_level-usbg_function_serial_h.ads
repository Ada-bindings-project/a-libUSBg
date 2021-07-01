pragma Ada_2012;
pragma Style_Checks (Off);
pragma Warnings ("U");

with Interfaces.C; use Interfaces.C;
limited with Libusg.Low_Level.usbg_usbg_h;

package Libusg.Low_Level.usbg_function_serial_h is

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

   type usbg_f_serial is null record;   -- incomplete struct

  --*
  --  * @brief Convert from generic function to serial function
  --  * @param[in] f function to be converted to serial funciton.
  --  *         Function should be one of types: serial, ACM, OBEX.
  --  * @return Converted serial function or NULL if function hasn't suitable type
  --

   function usbg_to_serial_function (f : access Libusg.Low_Level.usbg_usbg_h.usbg_function) return access usbg_f_serial  -- usbg/function/serial.h:31
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_to_serial_function";

  --*
  --  * @brief Convert form serial function to generic one
  --  * @param[in] sf function to be converted to generic one
  --  * @return Generic usbg function
  --

   function usbg_from_serial_function (sf : access usbg_f_serial) return access Libusg.Low_Level.usbg_usbg_h.usbg_function  -- usbg/function/serial.h:38
     with Import    => True,
      Convention    => C,
      External_Name => "usbg_from_serial_function";

  --*
  --  * @brief Get the id of device side tty port (/dev/ttyGS<port_num>)
  --  * @param[in] sf Pointer to serial function
  --  * @param[out] port_num the id of device side tty port
  --  * @return 0 on success usbg_error if error occurred.
  --

   function usbg_f_serial_get_port_num (sf : access usbg_f_serial; port_num : access int) return int  -- usbg/function/serial.h:46
      with Import   => True,
      Convention    => C,
      External_Name => "usbg_f_serial_get_port_num";

end Libusg.Low_Level.usbg_function_serial_h;
