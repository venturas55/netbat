import { OPCUAClient } from "node-opcua";
import { opcuaVariables,OPCUA_IP } from "./opcuaconfig.js";
const client = OPCUAClient.create({
    endpointMustExist: false
});

export async function maintest() {

    try {

        await client.connect(`opc.tcp://${OPCUA_IP}:4840`);

        const endpoints = await client.getEndpoints();

        console.log("ENDPOINTS:");

        endpoints.forEach((e) => {
            console.log(e.endpointUrl);
        });

        await client.disconnect();

    } catch(err) {

        console.error(err);

    }
}

