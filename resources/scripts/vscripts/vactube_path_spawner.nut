//Path_track parenting fixed by Enderek0

template_base <- EntityGroup[0];
_temp_reflect <- EntityGroup[1];
_temp_monster <- EntityGroup[2];
_temp_box <- EntityGroup[3];
_temp_companion <- EntityGroup[4];
_temp_activated <- EntityGroup[5];
track_origin <- EntityGroup[6].GetOrigin();

rot_x <- null;
rot_y <- null;

function GetRotX()
{
    rot_x <- caller;
    activator.Destroy();
}

function GetRotY()
{
    rot_y <- caller;
    activator.Destroy();
}

function Initialise_Base()
{
    printl("Init");
    activator.Destroy();
    caller.SetOrigin(track_origin);
    rot_x.SetOrigin(track_origin);
    rot_y.SetOrigin(track_origin);

    EntFireByHandle(rot_y, "SetParent", rot_x.GetName(), 0, null, null);
    EntFireByHandle(rot_x, "SetParent", caller.GetName(), 0.03, null, null);
    EntFireByHandle(caller, "StartForward", "", 0.05, null, null);
    EntFireByHandle(rot_x, "StartForward", "", 0.05, null, null);
    EntFireByHandle(rot_y, "StartForward", "", 0.05, null, null);
}

function OnTimer()
{
    EntFireByHandle(template_base, "ForceSpawn", "", 0, null, null);
    switch(RandomInt(1, 5))
    {
        case 1:
        {
            EntFireByHandle(_temp_reflect, "ForceSpawn", "", 0, null, null);
            break;
        }
        case 2:
        {
            EntFireByHandle(_temp_monster, "ForceSpawn", "", 0, null, null);
            break;
        }
        case 3:
        {
            EntFireByHandle(_temp_box, "ForceSpawn", "", 0, null, null);
            break;
        }
        case 4:
        {
            EntFireByHandle(_temp_companion, "ForceSpawn", "", 0, null, null);
            break;
        }
        case 5:
        {
            EntFireByHandle(_temp_activated, "ForceSpawn", "", 0, null, null);
            break;
        }
        default: return null;
    }
}

function BindCube()
{
    activator.Destroy();
    caller.SetOrigin(track_origin);
    EntFireByHandle(caller, "SetParent", rot_y.GetName(), 0.04, null, null);
}