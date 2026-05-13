import {
    OPCUAClient,
    AttributeIds
} from "node-opcua";
import { config }  from '../config.js'; //traigo el database desde el archivo
import { opcuaVariables,OPCUA_IP } from "./opcuaconfig.js";

export async function getOPCuaVariables(estacion) {

    const endpointUrl = `opc.tcp://${estacion.ip}:4840`;

    const variables = opcuaVariables[estacion.codigo];

    if (!variables) {
        throw new Error(
            `No hay configuración OPCUA para ${estacion.codigo}`
        );
    }

    const client = OPCUAClient.create({
        endpointMustExist: false
    });

    let session;

    try {

        await client.connect(endpointUrl);

        session = await client.createSession();

        const nodesToRead = variables.map(v => ({
            nodeId: v.nodeId,
            attributeId: AttributeIds.Value
        }));

        const results = await session.read(nodesToRead);

        const output = {};

        variables.forEach((v, i) => {

            const result = results[i];

            output[v.key] = result?.statusCode?.isGood()
                ? result.value.value
                : null;
        });

        return output;

    } finally {

        if (session) {
            await session.close();
        }

        await client.disconnect();
    }
}