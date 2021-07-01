import GPS
import autoformat

def set(Preference, To):
        GPS.Preference(Preference).set(To)

def gps_started(name):
    set("Ada-Align-Decl-On_Colon", True)
    set("Ada-Align-On-Arrows", "TRUE")
    set("Ada-Align-On-Colons", True)
    set("Ada-Casing-Policy", "On_The_Fly")
    set("Ada-Format-Operators", True)
    set("Ada-Stick-Comments", True)
    set("Ada-Conditional-Level", 1)
    set("Ada-Continuation-Level", 2)
    set("Ada-Declaration-Level:Indentation", 0)
    set("Ada-Indent-Level", 3)
    set("Ada-Record-Level", 3)
    set("Ada-Use-Tabs", False)
    set("Auto-Reload-Files", True)
    set("Ada-Auto-Indentation", "Extended")
    set("Ada-Indent-Case-Style", "Automatic")


GPS.Hook("gps_started").add(gps_started)
