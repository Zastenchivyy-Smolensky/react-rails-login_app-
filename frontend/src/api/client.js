import applyCaseMiddleware from "axios-case-converter"
import axios from "axios"

const options = {
    ignoreHeader: true,
}
const client = applyCaseMiddleware(
    axios.create({
        baseURL: "http://localhost:3001"
    }),
    options
);
export default client

