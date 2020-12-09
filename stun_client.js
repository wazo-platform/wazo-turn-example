#!/usr/bin/env node

const stun = require('stun');

const args = process.argv;
const ip = args[2];
const port = args[3]

if (!ip || !port) {
    throw "Usage: node stun_client.js <ip> <port>"
}
stun.request(`${ip}:${port}`, (err, res) => {
    if (err) {
        console.log(`Error fetching my IP from the STUN server at ${ip}:${port}`);
        console.error(err);
    } else {
        const {
            address
        } = res.getXorAddress();
        console.log('My IP is ', address);
    }
});

