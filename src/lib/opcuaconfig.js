import 'dotenv/config'
export const opcuaVariables = [
    {
        key: "racha_viento",
        nodeId: "ns=1;s=EM_VR041_VEL_VIENTO_38M"
    },
    {
        key: "direccion_viento",
        nodeId: "ns=1;s=EM_VR041_DIR_VIENTO_38M"
    },
    {
        key: "velocidad_media_viento",
        nodeId: "ns=1;s=EM_VR041_VEL_VIENTO_38M_MEDIA"
    },
    {
        key: "temperatura",
        nodeId: "ns=1;s=EM_VR041_TEMP"
    },
    {
        key: "presion",
        nodeId: "ns=1;s=EM_VR041_PRESION"
    },
        {
        key: "rad_solar",
        nodeId: "ns=1;s=EM_VR041_RAD_SOLAR"
    }
];

export const OPCUA_IP = process.env.OPCUA_IP;