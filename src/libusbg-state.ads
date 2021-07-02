private with libUSBg.Low_Level.Usbg_Usbg_H;
private with Ada.Finalization;
with libUSBg.Gadget;
with Interfaces;
package libUSBg.State is
   type Ref is tagged private;
   type Ref_Access is access all Ref'Class with Storage_Size => 0;

   function Get_Instance (Configfs_Path : String) return Ref_Access;

   function Get_Configfs_Path (Self : not null access Ref) return String;

   function Create_Gadget (Self   : not null access Ref;
                           Name   : String;
                           Attrs  : Gadget.Attrs;
                           G_Strs : Gadget.Strs) return libUSBg.Gadget.Ref;

   function Create_Gadget (Self      : not null access Ref;
                           Name      : String;
                           IdVendor  : Interfaces.Unsigned_16;
                           IdProduct : Interfaces.Unsigned_16) return libUSBg.Gadget.Ref;

   procedure Rm_Gadget (Self      : not null access Ref;
                       G         : in out libUSBg.Gadget.Ref);

private
   type Ref is tagged record
      S : aliased libUSBg.Low_Level.Usbg_Usbg_H.Usbg_State_Access;
   end record;

   type Package_Controler is new Ada.Finalization.Limited_Controlled with null record;
   procedure Finalize   (Object : in out Package_Controler);

end libUSBg.State;
