// SPDX-License-Identifier: MIT
pragma solidity 0.8.15;

contract WillThrow {
    function aFunction() public pure {
        // require(false, "Error Message");
        revert NotAllowedError("You are not allowed");
    }
}

contract ErrorHandling {
    event ErrorLogging(string reason);
    event ErrorCode(uint code);
    event ErrorLogBytes(bytes lowlevelData);
    function catchTheError() public {
        WillThrow will = new WillThrow();
        try will.aFunction(){
            //add code here if it works

        } catch Error(string memory reason){
            emit ErrorLogging(reason);
        }
        catch Panic(uint errorCode){
            emit ErrorLogging(errorCode);
        }
        catch (bytes memory lowlevelData){
            emit ErrorLogBytes(lowlevelData);
        }
    }
}