const axios = require('axios');

isOnline = async (url) => {
    try {
        const res = await axios.get(url);
        return res.status === 200;
    } catch (err) {
        return false;
    }
}

module.exports = isOnline;