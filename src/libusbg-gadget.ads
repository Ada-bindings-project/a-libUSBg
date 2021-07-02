package  libUSBg.Gadget is
   type Ref is tagged private;
   type Ref_Access is access all Ref'Class;
   type Attrs is new Integer;
   type Strs is new Integer;
private
   type Ref is tagged null record;

end  libUSBg.Gadget;
