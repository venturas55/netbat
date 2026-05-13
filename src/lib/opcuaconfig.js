import 'dotenv/config'
export const opcuaVariables = {
    VLC: [
        {
            key: "velocidad_viento",
            nodeId: "ns=1;s=EM_VR041_VEL_VIENTO_38M_MEDIA"
        },
        {
            key: "direccion_viento",
            nodeId: "ns=1;s=EM_VR041_DIR_VIENTO_38M"
        },
        {
            key: "temperatura",
            nodeId: "ns=1;s=EM_VR041_TEMP"
        }, {
            key: "temperatura",
            nodeId: "ns=1;s=EM_VR041_TEMP"
        },
        {
            key: "presion",
            nodeId: "ns=1;s=EM_VR041_PRESION"
        },
        {
            key: "radiacion",
            nodeId: "ns=1;s=EM_VR041_RAD_SOLAR"
        }
        ,
        {
            key: "lluvia",
            nodeId: "ns=1;s=EM_VR041_LLUVIA"
        }
    ],

    SAG: [
        {
            key: "velocidad_viento",
            nodeId: "ns=1;s=EM_SR002_VEL_VIENTO"
        },
        {
            key: "direccion_viento",
            nodeId: "ns=1;s=EM_SR002_DIR_VIENTO"
        },
        {
            key: "temperatura",
            nodeId: "ns=1;s=EM_SR002_TEMP"
        }
        ,
        {
            key: "presion",
            nodeId: "ns=1;s=EM_SR002_PRESION"
        }
        ,
        {
            key: "humedad",
            nodeId: "ns=1;s=EM_SR002_HUMEDAD"
        }
        ,
        {
            key: "radiacion",
            nodeId: "ns=1;s=EM_SR002_RAD_SOLAR"
        }, {
            key: "lluvia",
            nodeId: "ns=1;s=EM_SR002_LLUVIA"
        }
    ],

    GAN: [
        {
            key: "velocidad_viento",
            nodeId: "ns=1;s=EM_GR005_VEL_VIENTO"
        },
        {
            key: "direccion_viento",
            nodeId: "ns=1;s=EM_GR005_DIR_VIENTO"
        },
        {
            key: "temperatura",
            nodeId: "ns=1;s=EM_GR005_TEMP"
        },
        {
            key: "presion",
            nodeId: "ns=1;s=EM_GR005_RAD_PRESION"
        },
        {
            key: "radiacion",
            nodeId: "ns=1;s=EM_GR005_RAD_PRESION"
        },
        {
            key: "humedad",
            nodeId: "ns=1;s=EM_GR005_HUMEDAD"
        }, {
            key: "lluvia",
            nodeId: "ns=1;s=EM_GR005_LLUVIA"
        },


    ]
};

export const OPCUA_IP = process.env.OPCUA_IP;