pragma solidity ^0.5.1;

contract trackRegistry {

    struct trackcert {
        string name;
        uint timestamp;
    }

    mapping (string => trackcert) trackcerts;

    event trackCertInfo(
 	string name,
       uint timestamp,
       string url
    );

    function setTrackcert(string memory _url, string memory _name) public {
        require (bytes(_url).length != 0);
        require (bytes(_name).length != 0);

        require(trackcerts[_url].timestamp == 0);

        trackcerts[_url] = trackcert(_name, now);
        emit trackCertInfo(_name, now, _url);
    }

    function getTrackcert(string memory _url) view public returns (string memory, uint) {
        return (trackcerts[_url].name, trackcerts[_url].timestamp);
    }
}
