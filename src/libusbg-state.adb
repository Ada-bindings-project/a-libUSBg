pragma Ada_2012;
package body libUSBg.State is

   ------------------
   -- Get_Instance --
   ------------------

   function Get_Instance (Configfs_Path : String) return Ref_Access is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Instance unimplemented");
      return raise Program_Error with "Unimplemented function Get_Instance";
   end Get_Instance;

   -----------------------
   -- Get_Configfs_Path --
   -----------------------

   function Get_Configfs_Path (Self : not null access Ref) return String is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Get_Configfs_Path unimplemented");
      return
        raise Program_Error with "Unimplemented function Get_Configfs_Path";
   end Get_Configfs_Path;

   -------------------
   -- Create_Gadget --
   -------------------

   function Create_Gadget
     (Self   : not null access Ref; Name : String; Attrs : Gadget.Attrs;
      G_Strs : Gadget.Strs) return libUSBg.Gadget.Ref
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Create_Gadget unimplemented");
      return raise Program_Error with "Unimplemented function Create_Gadget";
   end Create_Gadget;

   -------------------
   -- Create_Gadget --
   -------------------

   function Create_Gadget
     (Self     : not null access Ref; Name : String;
      IdVendor : Interfaces.Unsigned_16; IdProduct : Interfaces.Unsigned_16)
      return libUSBg.Gadget.Ref
   is
   begin
      pragma Compile_Time_Warning
        (Standard.True, "Create_Gadget unimplemented");
      return raise Program_Error with "Unimplemented function Create_Gadget";
   end Create_Gadget;

   ---------------
   -- Rm_Gadget --
   ---------------

   procedure Rm_Gadget
     (Self : not null access Ref; G : in out libUSBg.Gadget.Ref)
   is
   begin
      pragma Compile_Time_Warning (Standard.True, "Rm_Gadget unimplemented");
      raise Program_Error with "Unimplemented procedure Rm_Gadget";
   end Rm_Gadget;

   --------------
   -- Finalize --
   --------------

   procedure Finalize (Object : in out Package_Controler) is
   begin
      pragma Compile_Time_Warning (Standard.True, "Finalize unimplemented");
      raise Program_Error with "Unimplemented procedure Finalize";
   end Finalize;

end libUSBg.State;
