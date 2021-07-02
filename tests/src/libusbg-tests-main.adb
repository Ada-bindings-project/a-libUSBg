with libUSBg.State;
procedure libUSBg.Tests.Main is
   S : libUSBg.State.Ref_Access := libUSBg.State.Get_Instance ("/sys/kernel/config");
begin
   null;
end libUSBg.Tests.Main;
