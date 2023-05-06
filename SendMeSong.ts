import { ethers } from "ethers";
import { SendMeSong } from "../typechain-types";

describe("SendMeSong", () => {
    let sendMeSongContract: SendMeSong;

    beforeEach(async () => {
        const sendMeSongFactory = await ethers.getContractFactory("SendMeSong"); // helper function not there
        const sendMeSongContract = await sendMeSongFactory.deploy() as SendMeSong;
        await sendMeSongContract.deployed();
    });

    it()





});
